#import pyodbc
import openpyxl as xl
import pyodbc

staffStartRow = 2
staffEmailColumn = 1
# SQL Server and database Setup:

serverList = ["dc01db-d007sql.commonwealth.com", "DC01AG-Q001SQL.commonwealth.com",
              "DC01AG-P019SQL.commonwealth.com", "DC1T1DB-D010SQL.tenant01dev.com", "DC2T1AG-L011SQL.TENANT01LTE.COM", "DC1T1AG-S011SQL.tenant01stg.com", 
              "DC1T1AG-P011SQL.tenant01prd.com", "DC1T1AG-Q011SQL.tenant01qax.com"]
dbName = "Clarify"

# Get Query.

f = f = open("sqlToRun.sql", "r")
sql = f.read()

print(sql)

# Run on all servers
for server in serverList:
    insertConn = pyodbc.connect('Driver={{ODBC Driver 17 for SQL Server}};'
                                'Server={server};'
                                'Database={dbName};'
                                'Trusted_Connection=yes;'.format(server=server, dbName=dbName))
    insertCursor = insertConn.cursor()
    insertCursor.execute(sql)
    insertConn.commit()
    print ("Query run on " + server + ".")
