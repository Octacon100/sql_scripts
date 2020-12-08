DROP TABLE IF EXISTS #temptable 

CREATE TABLE #temptable ( [version] nvarchar(50), [description] nvarchar(200), [type] nvarchar(20), [script] nvarchar(1000), [checksum] int, [installed_by] nvarchar(100), [installed_on] datetime, [execution_time] int, [success] bit )
INSERT INTO #temptable ( [version], [description], [type], [script], [checksum], [installed_by], [installed_on], [execution_time], [success])
VALUES
(  N'2024.900', N'Update table user login name', N'SQL', N'V2024.900__Update_table_user_login_name.sql', -399984798, N'ADVISOR360CORP\PRTFSBuild.svc', N'2020-11-30T11:06:35.507', 109, 1 )

INSERT INTO 
Clarify.dbo.flyway_schema_history
(
	installed_rank,
    version,
    description,
    type,
    script,
    checksum,
    installed_by,
    installed_on,
    execution_time,
    success
)
SELECT 
	(SELECT MAX(installed_rank) + 1
	FROM clarify.dbo.flyway_schema_history) AS installed_rank,
	version,
    description,
    type,
    script,
    checksum,
    installed_by,
    installed_on,
    execution_time,
    success	
FROM #temptable

DROP TABLE #temptable