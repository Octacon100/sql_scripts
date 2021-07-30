from sqlalchemy import create_engine
conn_str = r'mssql+pyodbc://@localhost/Apollo?driver=ODBC+Driver+17+for+SQL+Server'
engine = create_engine(conn_str)
connection = engine.connect()
result = connection.execute("SELECT SYSTEM_USER AS me")
row = result.fetchone()
print(row['me'])