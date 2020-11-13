#Run example: .\RunAllSqlInCurrentDir.ps1 "SurveillanceBuilddb" "host.docker.internal" 1433

$database = $args[0]
$server = $args[1]
$port= $args[2]

#If you don't want to pass arguements, just hardcode here.
#$database = "SurveillanceBuildTest"
#$server = "host.docker.internal"
#$port= 1433
#$password = "yourStrong(!)Password"
#$user = "sa"


$currentDir=(Get-Item -Path ".\").FullName
Get-ChildItem "$($currentDir)" -Recurse -Filter  "*.sql" |
Foreach-Object {
    #Depending on the connection
    $connectionString = "Data Source=$server;Initial Catalog=$database;Trusted_Connection=True;"
    #$connectionString = "Data Source=$server,$port;Initial Catalog=$database;User Id=$user;Password=$password"
    $connection = New-Object -TypeName System.Data.SqlClient.SqlConnection($connectionString)

    $query = get-content $_;

    Write-Output $query

    $command = New-Object -TypeName System.Data.SqlClient.SqlCommand($query, $connection)
    $connection.Open()
    $command.ExecuteNonQuery()
    $connection.Close()

}