SELECT dp.name
    , perms.class_desc
    , perms.permission_name
    , perms.state_desc
FROM sys.database_permissions perms
    INNER JOIN sys.database_principals dp ON perms.grantee_principal_id = dp.principal_id 
WHERE dp.name LIKE '%Access InternalReports%'