USE Surveillance
go

--Run this stuff after you''ve used a db with synonyms
DECLARE @sourceDBName NVARCHAR(1000) = DB_NAME();
DECLARE @databasename NVARCHAR(1000);
DECLARE @sqlCall NVARCHAR(MAX);

--Generate Stub List.

DROP TABLE IF EXISTS dbo.ListOfSynonyms;
CREATE TABLE dbo.ListOfSynonyms
(
    ID INT IDENTITY(1, 1),
    DatabaseName NVARCHAR(1000),
    SchemaName NVARCHAR(1000),
    objectname NVARCHAR(1000)
);

--TRUNCATE TABLE dbo.ListOfSynonyms;

SELECT COUNT(*)
FROM sys.synonyms
WHERE PARSENAME(base_object_name, 3) IS NOT NULL
      AND PARSENAME(base_object_name, 4) IS NULL

INSERT INTO dbo.ListOfSynonyms
(
    DatabaseName,
    SchemaName,
    objectname
)
SELECT PARSENAME(base_object_name, 3) AS 'DatabaseName',
       PARSENAME(base_object_name, 2) AS 'SchemaName',
       PARSENAME(base_object_name, 1) AS 'ObjectName'
FROM sys.synonyms
WHERE PARSENAME(base_object_name, 3) IS NOT NULL
      AND PARSENAME(base_object_name, 4) IS NULL
ORDER BY PARSENAME(base_object_name, 3);

SELECT DISTINCT
       DatabaseName
FROM dbo.ListOfSynonyms;

DROP TABLE IF EXISTS dbo.synonymSQL;

CREATE TABLE dbo.synonymSQL
(
	DatabaseName NVARCHAR(1000),
    sql NVARCHAR(MAX),
    objectName NVARCHAR(1000),
    objtype NVARCHAR(5)
);



DECLARE dbName CURSOR FAST_FORWARD READ_ONLY FOR
SELECT DISTINCT
       DatabaseName
FROM dbo.ListOfSynonyms;

OPEN dbName;

FETCH NEXT FROM dbName
INTO @databasename;

WHILE @@FETCH_STATUS = 0
    BEGIN



        --Generate the stub code.

        SET @sqlCall
            = N'
DECLARE @table_name sysname;
DECLARE @databasename NVARCHAR(1000);
DECLARE @schema NVARCHAR(1000); --= ''Compliance''
DECLARE @object_name NVARCHAR(1000); --= ''vAccountAttributes''
DECLARE @object_id INT;
DECLARE @object_type NVARCHAR(5); --= ''vAccountAttributes''

SET @databasename = N''' + @databasename + N''';

DECLARE synInfo CURSOR FOR
SELECT DatabaseName,
       SchemaName,
       objectname
FROM '                 + @sourceDBName
              + N'.dbo.ListOfSynonyms
WHERE databasename = @databasename;




OPEN synInfo;
FETCH NEXT FROM synInfo
INTO @databasename,
     @schema,
     @object_name;

WHILE @@FETCH_STATUS = 0
    BEGIN


        SELECT @table_name = @schema + ''.'' + @object_name;


        SELECT @object_id = o.[object_id],
               @object_type = o.[type]
        --, o.type --TODO: Case stattment here.
        FROM ' + @databasename + N'.sys.objects o WITH (NOWAIT)
            JOIN ' + @databasename + N'.sys.schemas s WITH (NOWAIT)
                ON o.[schema_id] = s.[schema_id]
        WHERE s.name + ''.'' + o.name = @table_name
              --AND o.[type] IN ( ''U'', ''V'' )
              AND o.is_ms_shipped = 0;

        IF @object_type IN ( ''U'', ''V'' )
            BEGIN

                DECLARE @SQL NVARCHAR(MAX) = N'''';
                WITH index_column
                AS (SELECT ic.[object_id],
                           ic.index_id,
                           ic.is_descending_key,
                           ic.is_included_column,
                           c.name
                    FROM ' + @databasename + N'.sys.index_columns ic WITH (NOWAIT)
                        JOIN ' + @databasename + N'.sys.columns c WITH (NOWAIT)
                            ON ic.[object_id] = c.[object_id]
                               AND ic.column_id = c.column_id
                    WHERE ic.[object_id] = @object_id),
                     fk_columns
                AS (SELECT k.constraint_object_id,
                           cname = c.name,
                           rcname = rc.name
                    FROM ' + @databasename + N'.sys.foreign_key_columns k WITH (NOWAIT)
                        JOIN ' + @databasename + N'.sys.columns rc WITH (NOWAIT)
                            ON rc.[object_id] = k.referenced_object_id
                               AND rc.column_id = k.referenced_column_id
                        JOIN ' + @databasename + N'.sys.columns c WITH (NOWAIT)
                            ON c.[object_id] = k.parent_object_id
                               AND c.column_id = k.parent_column_id
                    WHERE k.parent_object_id = @object_id)
                SELECT @SQL
                    = N''DROP TABLE IF EXISTS stub.'' + ISNULL(@object_name, '''') + N'';'' + CHAR(13) + CHAR(10) + N''GO''
                      + CHAR(13) + CHAR(10) + N''CREATE TABLE stub.'' + ISNULL(@object_name, '''') + CHAR(13) + CHAR(10)
                      + N''('' + CHAR(13) + CHAR(10)
                      + STUFF(
                    (
                        SELECT CHAR(9) + '', ['' + c.name + ''] ''
                               + CASE
                                     WHEN c.is_computed = 1 THEN
                                         ''AS '' + cc.[definition]
                                     ELSE
                                         UPPER(tp.name)
                                         + CASE
                                               WHEN tp.name IN ( ''varchar'', ''char'', ''varbinary'', ''binary'' ) THEN
                                                   ''('' + CASE
                                                             WHEN c.max_length = -1 THEN
                                                                 ''MAX''
                                                             ELSE
                                                                 CAST(c.max_length AS VARCHAR(5))
                                                         END + '')''
                                               WHEN tp.name IN ( ''nvarchar'', ''nchar'' ) THEN
                                                   ''('' + CASE
                                                             WHEN c.max_length = -1 THEN
                                                                 ''MAX''
                                                             ELSE
                                                                 CAST(c.max_length / 2 AS VARCHAR(5))
                                                         END + '')''
                                               WHEN tp.name IN ( ''datetime2'', ''time2'', ''datetimeoffset'' ) THEN
                                                   ''('' + CAST(c.scale AS VARCHAR(5)) + '')''
                                               WHEN tp.name = ''decimal'' THEN
                                                   ''('' + CAST(c.[precision] AS VARCHAR(5)) + '',''
                                                   + CAST(c.scale AS VARCHAR(5)) + '')''
                                               ELSE
                                                   ''''
                                           END +
                            --CASE WHEN c.collation_name IS NOT NULL THEN '' COLLATE '' + c.collation_name ELSE '''' END +
                            CASE
                                WHEN c.is_nullable = 1 THEN
                                    '' NULL''
                                ELSE
                                    '' NOT NULL''
                            END                                          + CASE
                                                                               WHEN dc.[definition] IS NOT NULL THEN
                                                                                   '' DEFAULT'' + dc.[definition]
                                                                               ELSE
                                                                                   ''''
                                                                           END + CASE
                                                                                     WHEN ic.is_identity = 1 THEN
                                                                                         '' IDENTITY(1,1) ''
                                                                                     ELSE
                                                                                         ''''
                                                                                 END
                                 END + CHAR(13) + CHAR(10)
                        FROM ' + @databasename + N'.sys.columns c WITH (NOWAIT)
                            JOIN ' + @databasename + N'.sys.types tp WITH (NOWAIT)
                                ON c.user_type_id = tp.user_type_id
                            LEFT JOIN ' + @databasename + N'.sys.computed_columns cc WITH (NOWAIT)
                                ON c.[object_id] = cc.[object_id]
                                   AND c.column_id = cc.column_id
                            LEFT JOIN ' + @databasename + N'.sys.default_constraints dc WITH (NOWAIT)
                                ON c.default_object_id != 0
                                   AND c.[object_id] = dc.parent_object_id
                                   AND c.column_id = dc.parent_column_id
                            LEFT JOIN ' + @databasename + N'.sys.identity_columns ic WITH (NOWAIT)
                                ON c.is_identity = 1
                                   AND c.[object_id] = ic.[object_id]
                                   AND c.column_id = ic.column_id
                        WHERE c.[object_id] = @object_id
                        ORDER BY c.column_id
                        FOR XML PATH(''''), TYPE
                    ).value(''.'', ''NVARCHAR(MAX)''),
                    1,
                    2,
                    CHAR(9) + '' ''
                             )
                      + N'';'' + CHAR(13) + CHAR(10);

                INSERT INTO ' + @sourceDBName
              + N'.dbo.synonymSQL
                (
					DatabaseName,
                    sql,
                    objtype,
                    objectName
                )
                VALUES
                (   @databasename
					 ,@SQL, -- sql - nvarchar(max)
                    @object_type, @object_name);
            END;

        ELSE IF @object_type = ''P''
                 BEGIN
                     INSERT INTO ' + @sourceDBName
              + N'.dbo.synonymSQL
                     (
						DatabaseName,
                         sql,
                         objectName,
                         objtype
                     )
                     SELECT @databasename
					 ,
					 ''CREATE OR ALTER '' + ROUTINE_TYPE + '' stub.'' + ROUTINE_NAME
                            + SUBSTRING(ROUTINE_DEFINITION, 1, 2) + '' AS '' AS sql,
                            ROUTINE_NAME,
                            @object_type
                     FROM ' + @databasename + N'.INFORMATION_SCHEMA.ROUTINES
                     WHERE ROUTINE_TYPE = ''PROCEDURE''
                           AND ROUTINE_NAME = @object_name
                           AND ROUTINE_DEFINITION NOT LIKE ''%tSQLt%'';

                 END;
      
		ELSE IF @object_type IN ( ''IF'', ''FN'' )
                 BEGIN

                     INSERT INTO ' + @sourceDBName
              + N'.dbo.synonymSQL
                     (
						DatabaseName,
                         sql,
                         objectName,
                         objtype
                     )
                     SELECT 
					 @databasename
					 ,''Use Ajay''''s script for functions'' AS sql
					 ,@object_name 
					 ,@object_type
                     

                 END;

        FETCH NEXT FROM synInfo
        INTO @databasename,
             @schema,
             @object_name;

    END;

CLOSE synInfo;
DEALLOCATE synInfo;';



BEGIN TRY

        EXEC sys.sp_executesql @sqlCall;
END TRY
BEGIN CATCH

	SELECT @sqlCall	

END CATCH


        FETCH NEXT FROM dbName
        INTO @databasename;
    END;

CLOSE dbName;
DEALLOCATE dbName;

--Review the stub code.

SELECT sql
FROM dbo.synonymSQL;


SELECT DatabaseName,
       objectName,
       objtype
FROM dbo.synonymSQL
ORDER BY DatabaseName;
