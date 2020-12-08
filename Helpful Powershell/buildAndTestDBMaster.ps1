param($database, $server, $port, $deleteDB, $test, $remoteSynonymSetup, $stopContainer, $tenant = "MML", $docker = "true", $repeatable = "true", $cleanbuild="false", $backupRestore="false", $includeLocalStubs="true")

# $database = $args[0]
# $server = $args[1]
# $port= $args[2]
# $deleteDB = $args[3]
# $test = $args[4]
# $remoteSynonymTest = $args[5]
# $stopContainer = $args[6]
# $tenant = $args[7]
# $docker = $args[8]
# $repeatable = $args[9]

#$database = "CFN_SecurityBuildTest"
#$server = "host.docker.internal"
#$port= 1433
$password = "yourStrong!Password"
$user = "sa"
$containerName = "sql_server2"
#$deleteDB = "true"
#$stopContainer = "false"
#$test = "true"
#$remoteSynonymTest = 'true'
#use the MML setup by default because it has more.
# if (!$args[7])
# {
#     $tenant = "MML"
# }

# if (!$args[8])
# {
#     $docker = "true"
# }

# if (!$args[9])
# {
#     $repeatable = "true"
# }

#create docker container if it doesn't exist
if ($docker -eq "true")
{
    $containerNameExist = docker container ls -f "name=sql_server2" --format '{{.Names}}' -a
    if ($containerNameExist -ne $containerName)
    {
        docker run --name "$containerName" -v C:\backups:/backups -e 'ACCEPT_EULA=Y' -e "SA_PASSWORD=$password" -p ${port}:${port} -d mcr.microsoft.com/mssql/server:2019-latest
        Start-Sleep -Seconds 30
    }


	$containerNameRunning = docker ps -f "name=sql_server2" --format '{{.Names}}'
	if ($containerNameRunning -ne $containerName)
	{
		docker container start $containerName
		Start-Sleep -Seconds 30
	}
	$connectionStringDBBuild = "Data Source=$server,$port;Initial Catalog=master;User Id=$user;Password=$password"
    $connectionString = "Data Source=$server;Initial Catalog=$database;User Id=$user;Password=$password;Connection Timeout=90"
    #write-output $connectionString
}
else
{
	$connectionStringDBBuild = "Data Source=$server;Initial Catalog=master;Trusted_Connection=True;"
    $connectionString = "Data Source=$server;Initial Catalog=$database;Trusted_Connection=True;Connection Timeout=90"
    #write-output $connectionString
}


#delete db if needed and build db

if ($deleteDB -eq "true")
{
    Write-Output "Deleting db..."
    $query = "
    IF  EXISTS (SELECT * FROM sys.databases WHERE name = '$database')
    BEGIN
        alter database [$database] set single_user with rollback immediate; drop database IF EXISTS [$database]
    END;"
    $connection = new-object -typename system.data.sqlclient.sqlconnection($connectionstringdbbuild)
    $command = new-object -typename system.data.sqlclient.sqlcommand($query, $connection)
    $connection.open()
    $command.executenonquery()
    $connection.close()
}

if ($backupRestore -eq "true")
{
    $connectionStringBackupRestore = "Data Source=$server;Initial Catalog=$database;User ID=sa;Password=n0clue;Connection Timeout=90"
    $connection = New-Object -TypeName System.Data.SqlClient.SqlConnection($connectionStringBackupRestore)

    $query = get-content ".\RestoreBackup.sql";

    Write-Output $query

    $command = New-Object -TypeName System.Data.SqlClient.SqlCommand($query, $connection)
    $connection.Open()
    $command.ExecuteNonQuery()
    $connection.Close()
}

$connection = New-Object -TypeName System.Data.SqlClient.SqlConnection($connectionStringDBBuild)

$query = "IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = '$database')
BEGIN
  CREATE DATABASE $database;
END;"
$command = New-Object -TypeName System.Data.SqlClient.SqlCommand($query, $connection)
$connection.Open()
$command.ExecuteNonQuery()
$connection.Close()


write-output $connectionString
#disable trigger to stop releases
#write-output $connectionString
$connectionDisable = New-Object -TypeName System.Data.SqlClient.SqlConnection($connectionString)

write-output $connectionString
$query = "IF EXISTS (SELECT * FROM sys.triggers WHERE [name] = N'cfn_TFS_Trigger')
BEGIN
	DISABLE TRIGGER cfn_TFS_Trigger ON DATABASE
END"
$command = New-Object -TypeName System.Data.SqlClient.SqlCommand($query, $connectionDisable)
$connectionDisable.Open()
$command.ExecuteNonQuery()
$connectionDisable.Close()


#apply flyway
cd Flyway\flyway-6.4.3\
$currentDir=(Get-Item -Path ".\").FullName
Push-Location $currentDir

$flywayconnectionString= "-url=jdbc:sqlserver:`"//${server}:${port};databaseName=${database};`""

$flywayLocations = "-locations=filesystem:..\..\SprintReleases\,filesystem:..\..\DataLoads\Shared,filesystem:..\..\DataLoads\$tenant"

if ($repeatable -eq "true")
{
    $flywayLocations = $flywayLocations + ",filesystem:..\..\Repeatable"
}

if ($test -eq "true")
{
    $flywayLocations = $flywayLocations + ",filesystem:..\..\UnitTests"
}

if ($includeLocalStubs -eq "true") #Only include local stubs when wanted.
{
    $flywayLocations = $flywayLocations + ",filesystem:..\..\LocalStubs"
}

if ($cleanbuild -eq "true") #Initial Data Load is put in location that shouldn't be touched.
{
    $flywayLocations = $flywayLocations + ",filesystem:..\..\ignore\this\folder\please,filesystem:..\..\ignore\this\folder\InitialData\$tenant"
}


$arguments = "-user=${user}", "-password=${password}", "-configFiles=`"$currentDir/conf/flywayLocalBuild.conf`"", "$flywayconnectionString", "$flywayLocations", "-placeholders.Tenant=$tenant", "migrate" 

if ($docker -ne "true")
{
    $flywayconnectionString= "-url=jdbc:sqlserver://${server}:${port};databaseName=${database};integratedSecurity=true;"
    $arguments = "-configFiles=`"$currentDir/conf/flywayLocalBuild.conf`"", "$flywayconnectionString", "$flywayLocations", "-placeholders.Tenant=$tenant", "migrate" 
    
}

.\flyway.cmd $arguments

#run tests and put results in base folder.
cd ..
cd ..
#If not a clean build, then need to make sure local stubs are set for testing our processes.
if ($test -eq "true" -and $cleanbuild -ne "true")
{
    

    $connectionString = "Data Source=$server,$port;Initial Catalog=$database;User Id=$user;Password=$password"
    if ($docker -ne "true")
    {
        $connectionString = "Data Source=$server,$port;Initial Catalog=$database;Trusted_Connection=True;"
    }

    cd LocalStubs\SynonymsForLocal  
    $currentDir=(Get-Item -Path ".\").FullName
    Write-Output currentDir  #Only want to find repeatable synonyms. That's why the R__* is in the filter.
    Get-ChildItem "$($currentDir)" -Recurse -Filter  "R__*.sql" |
    Foreach-Object {
        
        $connection = New-Object -TypeName System.Data.SqlClient.SqlConnection($connectionString)

        $query = get-content $_;

        Write-Output "Executing $_..."
        #Write-Output $query

        $command = New-Object -TypeName System.Data.SqlClient.SqlCommand($query, $connection)
        $connection.Open()
        $command.ExecuteNonQuery()
        $connection.Close()

    }

    cd ..
    cd ..

}

if ($test -eq "true")
{
    if ($docker -ne "true")
    {
        sqlcmd -S $server,$port -E -d $database -Q "EXEC tSQLt.RunAll"
        sqlcmd -S $server,$port -E -d $database -y0 -Q "SET NOCOUNT ON;EXEC tSQLt.XmlResultFormatter" -o "UnitTests.xml"
    }
    else
    {
        sqlcmd -S $server,$port -U sa -P $password -d $database -Q "EXEC tSQLt.RunAll"
        sqlcmd -S $server,$port -U sa -P $password -d $database -y0 -Q "SET NOCOUNT ON;EXEC tSQLt.XmlResultFormatter" -o "UnitTests.xml"
    }
}



#Run all synonym tests after putting the remote synonyms in
if ($remoteSynonymSetup -eq "true")
{
if ($docker -ne "true")
{
    $flywayconnectionString= "-url=jdbc:sqlserver://${server}:${port};databaseName=${database};integratedSecurity=true;"
    $arguments = "-configFiles=`"$currentDir/conf/flywayLocalBuild.conf`"", "$flywayconnectionString", "$flywayLocations", "migrate" 
    
}

    #Make sure all synonyms are now replaced with the real ones.

    $connectionString = "Data Source=$server,$port;Initial Catalog=$database;User Id=$user;Password=$password"
    if ($docker -ne "true")
    {
        $connectionString = "Data Source=$server,$port;Initial Catalog=$database;Trusted_Connection=True;"
    }

    cd RemoteSynonyms  #Replace -Filter  "dbo.Account.Synonym.sql" with  -Filter  "*.sql" when the whole db is set up.
    $currentDir=(Get-Item -Path ".\").FullName
    Get-ChildItem "$($currentDir)" -Recurse -Filter  "*.sql" |
    Foreach-Object {
        
        $connection = New-Object -TypeName System.Data.SqlClient.SqlConnection($connectionString)

        $query = get-content $_;

        Write-Output "Executing $_..."

        $command = New-Object -TypeName System.Data.SqlClient.SqlCommand($query, $connection)
        $connection.Open()
        $command.ExecuteNonQuery()
        $connection.Close()

    }

    cd ..
    cd ..

    if ($test -eq "true")
    {
        #run tests and put results in base folder.
        if ($docker -ne "true")
        {
            sqlcmd -S $server,$port -E -d $database -Q "EXEC tsqlt.Run @TestName = N'testSynonym'"
            sqlcmd -S $server,$port -E -d $database -y0 -Q "SET NOCOUNT ON;EXEC tSQLt.XmlResultFormatter" -o "SynonymTests.xml"
        }
        else{
            sqlcmd -S $server,$port -U sa -P $password -d $database -Q "EXEC tsqlt.Run @TestName = N'testSynonym'"
            sqlcmd -S $server,$port -U sa -P $password -d $database -y0 -Q "SET NOCOUNT ON;EXEC tSQLt.XmlResultFormatter" -o "SynonymTests.xml"
        }
        
    }
}


#review tests in junit
#junit 'UnitTests.xml'
#junit 'SynonymTests.xml'

#enable trigger to stop releases
$connection = New-Object -TypeName System.Data.SqlClient.SqlConnection($connectionString)

$query = "IF EXISTS (SELECT * FROM sys.triggers WHERE [name] = N'cfn_TFS_Trigger')
BEGIN
	ENABLE TRIGGER cfn_TFS_Trigger ON DATABASE
END"
$command = New-Object -TypeName System.Data.SqlClient.SqlCommand($query, $connection)
$connection.Open()
$command.ExecuteNonQuery()
$connection.Close()

Start-Sleep -Seconds 2

#Drop the database if you want.

if ($deleteDB -eq "true")
{
    Write-Output "Deleting db..."
    $query = "alter database [$database] set single_user with rollback immediate; drop database [$database]"
    $connection = new-object -typename system.data.sqlclient.sqlconnection($connectionstringdbbuild)
    $command = new-object -typename system.data.sqlclient.sqlcommand($query, $connection)
    $connection.open()
    $command.executenonquery()
    $connection.close()
}

if ($stopContainer -eq "true")
{
    Write-Output "Stopping container..."
    docker container stop $containerName
}

#if in interactive mode, allow user to read errors and build process.
If ((gwmi win32_process | ? { $_.processname -eq "powershell.exe" }).commandline -match "-NonInteractive")
{
    Write-Output "Process Successful..."
}
else
{
    read-host "Press ENTER to continue..."
}

