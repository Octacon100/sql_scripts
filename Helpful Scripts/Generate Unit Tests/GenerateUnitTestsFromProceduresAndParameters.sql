DECLARE @newLine VARCHAR(4) = CHAR(13)+CHAR(10)

select 
s.name + '.' + p.name + '.sql' as fileName,
    'CREATE OR ALTER PROCEDURE testSprocTesting.[test ' + s.name + '.' + p.name + ' works] ' + @newLine +
'AS ' + @newLine +
'BEGIN ' + @newLine +
' ' + @newLine +
    'EXEC tSQLt.ExpectNoException @Message= ''The ' + s.name + '.' + p.name + ' sproc errored out.'' ' + @newLine +
    ' ' + @newLine +
    'EXEC ' + s.name + '.' + p.name + ' ' + (Select ISNULL(STRING_AGG(par.name + ' = ' + CASE 
    WHEN t.name like '%char%' or t.name like '%text%' then '''test'''
    WHEN t.name like '%int%' or t.name in ('bit', 'decimal', 'float', 'money', 'numeric', 'real', 'smallmoney') then '0'
    WHEN t.name like '%date%' or t.name in ('timestamp') then '''19000101'''
    ELSE '''Please enter this yourself'''
    END 
    + 
    --OUTPUT Check
    CASE WHEN par.is_output = 1 THEN ' OUTPUT '
        ELSE ''  
        END
    , ', ') -- <-- Separator here.
     , '')
    from sys.parameters par INNER JOIN sys.types t on par.system_type_id = t.system_type_id where par.object_id = p.object_id ) + ' ' + @newLine + 
' ' + @newLine + '
END '  + @newLine as createScript
from sys.procedures p
inner join sys.schemas s 
on p.schema_id = s.schema_id
where s.name not in ('testSprocTesting', 'tSQLt')
--If you want to only generate unit tests for certain sprocs.
and p.object_id in 
(
    OBJECT_ID('Insurance.cfn_UserDeltaSummaryGet')--,
-- OBJECT_ID('dbo.sp_Users_Get'),
-- OBJECT_ID('dbo.sp_Associations_Get'),
-- OBJECT_ID('dbo.cfn_UserPreference_Retrieve'),
-- OBJECT_ID('dbo.cfn_UserLogin_Retrieve'),
-- OBJECT_ID('dbo.cfn_Investor360_ClientRetrieveByHHID'),
-- OBJECT_ID('dbo.cfn_Permission_Get'),
-- OBJECT_ID('dbo.cfn_SiteServiceModelGet'),
-- OBJECT_ID('dbo.cfn_User_Login_Update'),
-- OBJECT_ID('dbo.cfn_GetEmployeeAutoLogin'),
-- OBJECT_ID('dbo.cfn_Investor360_ClientAdd_Beta'),
-- OBJECT_ID('dbo.cfn_User_Login'),
-- OBJECT_ID('dbo.sp_Associations_Add'),
-- OBJECT_ID('dbo.cfn_Permission_Update')
)
--Or if you just want to generate tests for sprocs that don't have tests
and not exists
(
    SELECT 1
    from sys.procedures
    inner join sys.schemas s 
    on p.schema_id = s.schema_id
    where s.name = 'testSprocTesting'
    and p.name like (s.name + '.' + p.name)
)
-- --Check schemas involved

-- SELECT distinct s.name
-- from sys.procedures p
-- inner join sys.schemas s 
-- on p.schema_id = s.schema_id
-- where s.name not in ('testSprocTesting', 'tSQLt')


--Checking parameters 
SELECT par.*
from sys.procedures p
inner join sys.schemas s 
on p.schema_id = s.schema_id
INNER JOIN sys.parameters PAR
on par.object_id = p.object_id
where s.name not in ('testSprocTesting', 'tSQLt')

-- --Check your types

--   select distinct t.name,
--  CASE 
--     WHEN t.name like '%char%' or t.name like '%text%' then '''test'''
--     WHEN t.name like '%int%' or t.name in ('bit', 'decimal', 'float', 'money', 'numeric', 'real', 'smallmoney') then '0'
--     WHEN t.name like '%date%' or t.name in ('timestamp') then '''19000101'''
--     ELSE '''Please enter this yourself'''
--     END 
--  FROM sys.types T
