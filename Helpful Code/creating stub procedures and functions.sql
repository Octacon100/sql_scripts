USE Surveillance;
GO

SELECT top 10 ROUTINE_NAME,
       ROUTINE_DEFINITION,
       'CREATE OR ALTER ' + ROUTINE_TYPE + ' stub.' + ROUTINE_NAME + SUBSTRING(ROUTINE_DEFINITION, 1, 2) + ' AS ' AS stub_create,
       PATINDEX('%AS%', ROUTINE_DEFINITION) as beginning,
       *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
and ROUTINE_DEFINITION NOT LIKE '%tSQLt%';

SELECT top 10 ROUTINE_NAME,
       ROUTINE_DEFINITION,
       'CREATE OR ALTER ' + ROUTINE_TYPE + ' stub.' + ROUTINE_NAME + ' ' + SUBSTRING(ROUTINE_DEFINITION, PATINDEX('%(%', ROUTINE_DEFINITION), PATINDEX('%AS%', ROUTINE_DEFINITION) - PATINDEX('%(%', ROUTINE_DEFINITION)) + ' AS ' + RIGHT(ROUTINE_DEFINITION, PATINDEX('%NRUTER%', REVERSE(ROUTINE_DEFINITION)) + LEN('RETURN') ) AS stub_create,
       PATINDEX('%AS%', ROUTINE_DEFINITION) as beginningAs,
       PATINDEX('%(%', ROUTINE_DEFINITION) as beginningBracket,
       PATINDEX('%)%', ROUTINE_DEFINITION) as endBracket,
       PATINDEX('%NRUTER%', REVERSE(ROUTINE_DEFINITION)) as lastReturn,  --NRUTER is return backwards
       RIGHT(ROUTINE_DEFINITION, PATINDEX('%NRUTER%', REVERSE(ROUTINE_DEFINITION)) + LEN('RETURN') ) as returnscript,
       *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'FUNCTION'
and ROUTINE_DEFINITION NOT LIKE '%tSQLt%';


-- SELECT DISTINCT ROUTINE_TYPE
-- FROM INFORMATION_SCHEMA.ROUTINES


--SELECT pro.name, par.name, TYPE_NAME(par.user_type_id),  * from sys.parameters par
--inner join sys.procedures pro on par.object_id = pro.object_id 
--inner join sys.types t ON par.system_type_id = t.system_type_id AND par.user_type_id = t.user_type_id
----where procedures.name = 'sp_name'