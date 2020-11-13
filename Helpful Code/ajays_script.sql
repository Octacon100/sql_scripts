DROP TABLE IF EXISTS #ListOfTablesAndViews
CREATE TABLE #ListOfTablesAndViews (ID INT IDENTITY(1,1),DbName sysname,SchemaName sysname,TableName sysname, TableFullName AS CAST(QUOTENAME(DbName)+'.'+QUOTENAME(SchemaName)+'.'+QUOTENAME(TableName) AS NVARCHAR(1000)));

TRUNCATE TABLE #ListOfTablesAndViews;

INSERT INTO #ListOfTablesAndViews (DbName, SchemaName, TableName)
SELECT DB_NAME(),SCHEMA_NAME(v.schema_id),v.name FROM sys.Objects v WHERE type IN ('U','V')                    -- nvarchar(max)


/*****************************/
DROP TABLE IF EXISTS dbo.ListOfSynonyms
CREATE TABLE dbo.ListOfSynonyms (ID INT IDENTITY(1,1),DbName sysname,base_object_name NVARCHAR(1000));

TRUNCATE TABLE dbo.ListOfSynonyms;


INSERT INTO dbo.ListOfSynonyms (DbName, base_object_name)
SELECT DB_NAME(),base_object_name FROM sys.synonyms;                    -- nvarchar(max)

/**************
Special handling for codevalues table as table with same name also exist in other databases. 
There are more code depending on Accounts.dbo.codevalues so we are keeping that copy of tables in base db copy.
***********************/
DELETE l
FROM #ListOfTablesAndViews l
WHERE  tablename = 'codevalues'
       AND SchemaName='dbo'
       AND DbName<>'Accounts';

DELETE l
FROM #ListOfTablesAndViews l
WHERE  tablename = 'DIM_TIME'
       AND SchemaName='dbo'
       AND DbName<>'Product_master';

/*************************
SELECT DISTINCT lotav.DbName, lotav.SchemaName, lotav.TableName, lotav.TableFullName
FROM #ListOfTablesAndViews lotav
JOIN dbo.ListOfSynonyms los ON lotav.TableFullName=los.base_object_name
WHERE tablename like '%Dim_TIME%'
--*****************************/


DECLARE @SchemaName sysname
DECLARE @ViewName sysname
DECLARE @DataType sysname
DECLARE @ColumnCount INT
DECLARE @ColumnID INT
DECLARE @SelectColumn NVARCHAR(500)
DECLARE @sql NVARCHAR(max) = ''

DECLARE QUERYINFO CURSOR FOR
SELECT SCHEMA_NAME (v.schema_id) AS schema_name
         ,v.name AS ViewName
      ,ccount.ColumnCount
      ,c.column_id AS ColumnID
      ,QUOTENAME(c.name) AS SelectColumn
         ,CASE WHEN TYPE_NAME (c.user_type_id) IN ( 'varchar','nvarchar','char','nchar' ) THEN TYPE_NAME (c.user_type_id)+'('+CASE WHEN c.max_length < 0 OR c.max_length > 4000 THEN 'MAX' ELSE CAST(c.max_length AS VARCHAR(10)) END+')'
                     WHEN TYPE_NAME (c.user_type_id) ='decimal' THEN TYPE_NAME (c.user_type_id)+'('+CAST(c.precision  AS VARCHAR(10))+','+CAST(c.scale AS VARCHAR(10))+')' 
                     WHEN TYPE_NAME (c.user_type_id) ='tFeeRate' THEN 'DECIMAL(8,5)'
                     WHEN TYPE_NAME (c.user_type_id) ='tUserID' THEN 'VARCHAR(128)'
                  ELSE TYPE_NAME (c.user_type_id) END 
        +CASE WHEN c.is_identity=1 THEN ' IDENTITY (1,1) ' ELSE '' END  
       +CASE WHEN c.column_id <> ccount.ColumnCount THEN ', ' ELSE '' END AS DataType
FROM sys.Objects v
         JOIN (SELECT DISTINCT lotav.SchemaName, lotav.TableName, lotav.TableFullName
                     FROM #ListOfTablesAndViews lotav
                     JOIN dbo.ListOfSynonyms los ON lotav.TableFullName=los.base_object_name
                     WHERE lotav.DbName=DB_NAME()) d ON SCHEMA_NAME (v.schema_id)=d.SchemaName AND v.name=d.TableName
      INNER JOIN sys.columns c ON v.object_id = c.object_id
      INNER JOIN (SELECT object_id, COUNT (*) AS ColumnCount 
                             FROM sys.columns
                             GROUP BY object_id) ccount ON v.object_id = ccount.object_id
WHERE v.Type IN ('U','V') 
ORDER BY SCHEMA_NAME (v.schema_id),v.name, c.column_id;

--OPEN QUERYINFO
--FETCH NEXT FROM QUERYINFO INTO @SchemaName,@ViewName,@ColumnCount,@ColumnID,@SelectColumn,@DataType
--WHILE @@FETCH_STATUS = 0
--BEGIN
--    IF @ColumnID = 1
--    BEGIN
--              SET @sql = 'USE ForE0Reference;IF NOT EXISTS( SELECT * FROM sys.schemas WHERE name ='''+@SchemaName+''') EXEC sys.sp_executesql N''CREATE SCHEMA ['+@SchemaName+'];'';'
--              SET @sql = @sql+'DROP TABLE IF EXISTS '+QUOTENAME(@SchemaName)+'.' +QUOTENAME(@ViewName) + ';'
--        SET @sql = @sql+'CREATE TABLE '+QUOTENAME(@SchemaName)+'.' +QUOTENAME(@ViewName) + ' ( ' + @SelectColumn + ' '+@DataType
--    END
--    ELSE
--    BEGIN
--        SET @sql = @sql + @SelectColumn+ ' '+@DataType
--    END  

--    IF @ColumnID = @ColumnCount
--    BEGIN
--        SET @sql = @sql + '); ' 
--              BEGIN TRY
--                     --PRINT @sql
--                     EXEC sys.sp_executesql @sql
--              END TRY
--              BEGIN CATCH
--                     PRINT @sql;
--                     THROW
--              END CATCH
--        SET @sql = ''
--    END 

--    FETCH NEXT FROM QUERYINFO INTO @SchemaName,@ViewName,@ColumnCount,@ColumnID,@SelectColumn,@DataType
--END

--CLOSE QUERYINFO
--DEALLOCATE QUERYINFO                    -- nvarchar(max)
--,@database_list='PPS,CFNAccountDb'
--,@user_only=1
--,@print_command_only=0
--,@exclude_list='ReportServer,ReportServerTempDB,ForE0Reference'--',commonwealth_MSCRM'
--,@print_dbname=1;
/*********************************************************************/

