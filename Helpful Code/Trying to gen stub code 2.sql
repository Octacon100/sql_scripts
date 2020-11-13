--DROP TABLE IF EXISTS #ListOfTablesAndViews
--CREATE TABLE #ListOfTablesAndViews (ID INT IDENTITY(1,1),DbName sysname,SchemaName sysname,TableName sysname, TableFullName AS CAST(QUOTENAME(DbName)+'.'+QUOTENAME(SchemaName)+'.'+QUOTENAME(TableName) AS NVARCHAR(1000)));

--TRUNCATE TABLE #ListOfTablesAndViews;

--INSERT INTO #ListOfTablesAndViews (DbName, SchemaName, TableName)
--SELECT DB_NAME(),SCHEMA_NAME(v.schema_id),v.name FROM sys.Objects v WHERE type IN ('U','V')                    -- nvarchar(max)


/*****************************/
DROP TABLE IF EXISTS dbo.ListOfSynonyms
CREATE TABLE dbo.ListOfSynonyms (ID INT IDENTITY(1,1),DatabaseName NVARCHAR(1000),SchemaName NVARCHAR(1000), objectname NVARCHAR(1000));

--TRUNCATE TABLE dbo.ListOfSynonyms;


INSERT INTO dbo.ListOfSynonyms (DatabaseName, SchemaName, objectname)

SELECT 
	PARSENAME(base_object_name, 3) AS 'DatabaseName',
	PARSENAME(base_object_name, 2) AS 'SchemaName',
	PARSENAME(base_object_name, 1) AS 'ObjectName'
FROM sys.synonyms
WHERE PARSENAME(base_object_name, 3) IS NOT NULL
AND PARSENAME(base_object_name, 4) IS NULL
ORDER BY PARSENAME(base_object_name, 3) 

SELECT DISTINCT databasename
FROM dbo.ListOfSynonyms

