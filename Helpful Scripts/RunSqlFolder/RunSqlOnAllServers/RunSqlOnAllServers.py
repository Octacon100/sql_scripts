#import pyodbc
import openpyxl as xl
import pyodbc

staffStartRow = 2
staffEmailColumn = 1
# SQL Server and database Setup:

serverList = ["DC1T1AG-D008SQL.tenant01dev.com", "DC1T1AG-Q009SQL.tenant01qax.com",
              "DC1T1AG-S009SQL.tenant01stg.com", "DC2T1AG-L009SQL.TENANT01LTE.COM", "tesladev.commonwealth.com",
               "teslaqa.commonwealth.com", "tesla.commonwealth.com"]
dbName = "CFN_Security"

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
