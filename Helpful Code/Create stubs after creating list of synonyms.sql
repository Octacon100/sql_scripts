--Databases 
--Accounts
--CFN_Security
--CFNAccountDB
--COMMWEB
--Consolidation
--DBA
--EndecaWarehouse
--Financials
--Maintenance
--msdb
--PositionsD
--PPS
--PRODUCT_MASTER
--PRODUCT_MASTER_STAGING
--REP
--Thomson
--Trades

--Run this stuff after you've used a db with synonyms
USE Trades;
GO


DECLARE @table_name sysname;
DECLARE @databasename NVARCHAR(1000);
DECLARE @schema NVARCHAR(1000); --= 'Compliance'
DECLARE @object_name NVARCHAR(1000); --= 'vAccountAttributes'
DECLARE @object_id INT;
DECLARE @object_type NVARCHAR(5); --= 'vAccountAttributes'

SET @databasename = 'Trades'

DECLARE synInfo CURSOR FOR
SELECT DatabaseName,
       SchemaName,
       objectname
FROM Surveillance.dbo.ListOfSynonyms
WHERE databasename = @databasename;

DROP TABLE IF EXISTS #tempSQL;

CREATE TABLE #tempSQL
(
    sql NVARCHAR(MAX)
	,objectName NVARCHAR(1000)
	,objtype NVARCHAR(5)
);


OPEN synInfo;
FETCH NEXT FROM synInfo
INTO @databasename,
     @schema,
     @object_name;

WHILE @@FETCH_STATUS = 0
BEGIN


    SELECT @table_name = @schema + '.' + @object_name;


    SELECT @object_id = o.[object_id],
           @object_type = o.[type]
    --, o.type --TODO: Case stattment here.
    FROM sys.objects o WITH (NOWAIT)
        JOIN sys.schemas s WITH (NOWAIT)
            ON o.[schema_id] = s.[schema_id]
    WHERE s.name + '.' + o.name = @table_name
          --AND o.[type] IN ( 'U', 'V' )
          AND o.is_ms_shipped = 0;

    IF @object_type IN ( 'U', 'V' )
    BEGIN

        DECLARE @SQL NVARCHAR(MAX) = N'';
        WITH index_column
        AS (SELECT ic.[object_id],
                   ic.index_id,
                   ic.is_descending_key,
                   ic.is_included_column,
                   c.name
            FROM sys.index_columns ic WITH (NOWAIT)
                JOIN sys.columns c WITH (NOWAIT)
                    ON ic.[object_id] = c.[object_id]
                       AND ic.column_id = c.column_id
            WHERE ic.[object_id] = @object_id),
             fk_columns
        AS (SELECT k.constraint_object_id,
                   cname = c.name,
                   rcname = rc.name
            FROM sys.foreign_key_columns k WITH (NOWAIT)
                JOIN sys.columns rc WITH (NOWAIT)
                    ON rc.[object_id] = k.referenced_object_id
                       AND rc.column_id = k.referenced_column_id
                JOIN sys.columns c WITH (NOWAIT)
                    ON c.[object_id] = k.parent_object_id
                       AND c.column_id = k.parent_column_id
            WHERE k.parent_object_id = @object_id)
        SELECT @SQL
            = N'DROP TABLE IF EXISTS stub.' + ISNULL(@object_name, '') + N';' + CHAR(13) + CHAR(10) + N'GO' + CHAR(13)
              + CHAR(10) + N'CREATE TABLE stub.' + ISNULL(@object_name, '') + CHAR(13) + CHAR(10) + N'(' + CHAR(13)
              + CHAR(10)
              + STUFF(
            (
                SELECT CHAR(9) + ', [' + c.name + '] '
                       + CASE
                             WHEN c.is_computed = 1 THEN
                                 'AS ' + cc.[definition]
                             ELSE
                                 UPPER(tp.name)
                                 + CASE
                                       WHEN tp.name IN ( 'varchar', 'char', 'varbinary', 'binary' ) THEN
                                           '(' + CASE
                                                     WHEN c.max_length = -1 THEN
                                                         'MAX'
                                                     ELSE
                                                         CAST(c.max_length AS VARCHAR(5))
                                                 END + ')'
                                       WHEN tp.name IN ( 'nvarchar', 'nchar' ) THEN
                                           '(' + CASE
                                                     WHEN c.max_length = -1 THEN
                                                         'MAX'
                                                     ELSE
                                                         CAST(c.max_length / 2 AS VARCHAR(5))
                                                 END + ')'
                                       WHEN tp.name IN ( 'datetime2', 'time2', 'datetimeoffset' ) THEN
                                           '(' + CAST(c.scale AS VARCHAR(5)) + ')'
                                       WHEN tp.name = 'decimal' THEN
                                           '(' + CAST(c.[precision] AS VARCHAR(5)) + ',' + CAST(c.scale AS VARCHAR(5))
                                           + ')'
                                       ELSE
                                           ''
                                   END +
                    --CASE WHEN c.collation_name IS NOT NULL THEN ' COLLATE ' + c.collation_name ELSE '' END +
                    CASE
                        WHEN c.is_nullable = 1 THEN
                            ' NULL'
                        ELSE
                            ' NOT NULL'
                    END                                          + CASE
                                                                       WHEN dc.[definition] IS NOT NULL THEN
                                                                           ' DEFAULT' + dc.[definition]
                                                                       ELSE
                                                                           ''
                                                                   END + CASE
                                                                             WHEN ic.is_identity = 1 THEN
                                                                                 ' IDENTITY(1,1) '
                                                                             ELSE
                                                                                 ''
                                                                         END
                         END + CHAR(13) + CHAR(10)
                FROM sys.columns c WITH (NOWAIT)
                    JOIN sys.types tp WITH (NOWAIT)
                        ON c.user_type_id = tp.user_type_id
                    LEFT JOIN sys.computed_columns cc WITH (NOWAIT)
                        ON c.[object_id] = cc.[object_id]
                           AND c.column_id = cc.column_id
                    LEFT JOIN sys.default_constraints dc WITH (NOWAIT)
                        ON c.default_object_id != 0
                           AND c.[object_id] = dc.parent_object_id
                           AND c.column_id = dc.parent_column_id
                    LEFT JOIN sys.identity_columns ic WITH (NOWAIT)
                        ON c.is_identity = 1
                           AND c.[object_id] = ic.[object_id]
                           AND c.column_id = ic.column_id
                WHERE c.[object_id] = @object_id
                ORDER BY c.column_id
                FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)'),
            1,
            2,
            CHAR(9) + ' '
                     )
              --Constraints
              --+ ISNULL((SELECT CHAR(9) + ', CONSTRAINT [' + k.name + '] PRIMARY KEY (' + 
              --        (SELECT STUFF((
              --             SELECT ', [' + c.name + '] ' + CASE WHEN ic.is_descending_key = 1 THEN 'DESC' ELSE 'ASC' END
              --             FROM sys.index_columns ic WITH (NOWAIT)
              --             JOIN sys.columns c WITH (NOWAIT) ON c.[object_id] = ic.[object_id] AND c.column_id = ic.column_id
              --             WHERE ic.is_included_column = 0
              --                 AND ic.[object_id] = k.parent_object_id 
              --                 AND ic.index_id = k.unique_index_id     
              --             FOR XML PATH(N''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ''))
              --+ ')' + CHAR(13) + CHAR(10)
              --FROM sys.key_constraints k WITH (NOWAIT)
              --WHERE k.parent_object_id = @object_id 
              --    AND k.[type] = 'PK'), '') 
              + N')' + CHAR(13)
              + CHAR(10)
              --Foreign Keys
              --+ ISNULL((SELECT (
              --SELECT CHAR(13) + CHAR(10) +
              --     'ALTER TABLE ' + @object_name + ' WITH' 
              --    + CASE WHEN fk.is_not_trusted = 1 
              --        THEN ' NOCHECK' 
              --        ELSE ' CHECK' 
              --      END + 
              --      ' ADD CONSTRAINT [' + fk.name  + '] FOREIGN KEY(' 
              --      + STUFF((
              --        SELECT ', [' + k.cname + ']'
              --        FROM fk_columns k
              --        WHERE k.constraint_object_id = fk.[object_id]
              --        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')
              --       + ')' +
              --      ' REFERENCES [' + SCHEMA_NAME(ro.[schema_id]) + '].[' + ro.name + '] ('
              --      + STUFF((
              --        SELECT ', [' + k.rcname + ']'
              --        FROM fk_columns k
              --        WHERE k.constraint_object_id = fk.[object_id]
              --        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')
              --       + ')'
              --    + CASE 
              --        WHEN fk.delete_referential_action = 1 THEN ' ON DELETE CASCADE' 
              --        WHEN fk.delete_referential_action = 2 THEN ' ON DELETE SET NULL'
              --        WHEN fk.delete_referential_action = 3 THEN ' ON DELETE SET DEFAULT' 
              --        ELSE '' 
              --      END
              --    + CASE 
              --        WHEN fk.update_referential_action = 1 THEN ' ON UPDATE CASCADE'
              --        WHEN fk.update_referential_action = 2 THEN ' ON UPDATE SET NULL'
              --        WHEN fk.update_referential_action = 3 THEN ' ON UPDATE SET DEFAULT'  
              --        ELSE '' 
              --      END 
              --    + CHAR(13) + CHAR(10) + 'ALTER TABLE ' + @object_name + ' CHECK CONSTRAINT [' + fk.name  + ']' + CHAR(13) + CHAR(10)
              --FROM sys.foreign_keys fk WITH (NOWAIT)
              --JOIN sys.objects ro WITH (NOWAIT) ON ro.[object_id] = fk.referenced_object_id
              --WHERE fk.parent_object_id = @object_id
              --FOR XML PATH(N''), TYPE).value('.', 'NVARCHAR(MAX)')), '')
              --Indexes
              --+ ISNULL(((SELECT
              --     CHAR(13) + CHAR(10) + 'CREATE' + CASE WHEN i.is_unique = 1 THEN ' UNIQUE' ELSE '' END 
              --            + ' NONCLUSTERED INDEX [' + i.name + '] ON ' + @object_name + ' (' +
              --            STUFF((
              --            SELECT ', [' + c.name + ']' + CASE WHEN c.is_descending_key = 1 THEN ' DESC' ELSE ' ASC' END
              --            FROM index_column c
              --            WHERE c.is_included_column = 0
              --                AND c.index_id = i.index_id
              --            FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') + ')'  
              --            + ISNULL(CHAR(13) + CHAR(10) + 'INCLUDE (' + 
              --                STUFF((
              --                SELECT ', [' + c.name + ']'
              --                FROM index_column c
              --                WHERE c.is_included_column = 1
              --                    AND c.index_id = i.index_id
              --                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') + ')', '')  + CHAR(13) + CHAR(10)
              --    FROM sys.indexes i WITH (NOWAIT)
              --    WHERE i.[object_id] = @object_id
              --        AND i.is_primary_key = 0
              --        AND i.[type] = 2
              --    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)')
              --), '') 
              + N';' + CHAR(13) + CHAR(10);

        INSERT INTO #tempSQL
        (
            sql
			,objtype
			,objectName
        )
        VALUES
        (@SQL -- sql - nvarchar(max)
		
		,@object_type
		,@object_name
            );
    END;

    ELSE
    BEGIN

		INSERT INTO #tempSQL
        (
            sql
			,objectName
			,objtype
        )
        VALUES
        (
			'--' + @databasename + '.' + @schema + '.' + @object_name + 'needs a different way as it is a ' + @object_type
			,@object_name
			,@object_type
            );

    END;

    FETCH NEXT FROM synInfo
    INTO @databasename,
         @schema,
         @object_name;

END;

CLOSE synInfo;
DEALLOCATE synInfo;

--EXEC sys.sp_executesql @SQL

--SELECT RIGHT(sql,1), * FROM #tempSQL WHERE RIGHT(sql,2) = '; '

SELECT sql
FROM #tempSQL


SELECT @databasename, objectName, objtype
FROM #tempSQL
