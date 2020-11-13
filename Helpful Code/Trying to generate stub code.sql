USE Surveillance
go

SELECT base_object_name
FROM sys.synonyms
ORDER BY base_object_name

SELECT 
	PARSENAME(base_object_name, 3) AS 'DatabaseName',
	PARSENAME(base_object_name, 2) AS 'SchemaName',
	PARSENAME(base_object_name, 1) AS 'ObjectName'
FROM sys.synonyms
WHERE PARSENAME(base_object_name, 3) IS NOT NULL
AND PARSENAME(base_object_name, 4) IS NULL
ORDER BY PARSENAME(base_object_name, 3) 


SELECT *
FROM sys.all_objects
WHERE name = '[Accounts].[dbo].[AccountPERSHING]'

USE Accounts
GO

SELECT o.name, o.type, *
FROM sys.objects o
INNER JOIN sys.schemas s
ON s.schema_id = o.schema_id
WHERE o.name = 'AccountPERSHING'
AND s.name = 'dbo'

SELECT * FROM sys.views WHERE object_id = 1031385
SELECT * FROM sys.columns WHERE object_id = 1031385

EXEC sys.sp_help @objname = N'[dbo].[AccountPERSHING]' 
