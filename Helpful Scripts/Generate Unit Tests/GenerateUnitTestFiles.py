import pyodbc

#variables
server = "host.docker.internal"
dbName = "CFN_SecurityMML"
username = 'sa'
password= 'yourStrong!Password'
filePrefix = 'R__TEST_'

#SQL Server Setup:

fd = open('GenerateUnitTestsFromProceduresAndParameters.sql', 'r')
sql = fd.read()
fd.close()

insertConn = pyodbc.connect('Driver={{ODBC Driver 17 for SQL Server}};'
                                         'Server={server};'
                                         'Database={dbName};'
                                         'uid={username};'
                                         'pwd={password};'.format(server=server, dbName=dbName, username=username, password=password))
dbCursor = insertConn.cursor()
#print(sql)
res1 = dbCursor.execute(sql)
res1 = dbCursor.fetchall()
for row in res1:
    print (row[0])
    fileName = row[0]
    with open(filePrefix + fileName, 'w') as f:
        f.write(row[1])
