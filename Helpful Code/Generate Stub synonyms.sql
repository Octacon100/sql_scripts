SELECT 'DROP SYNONYM iF EXISTS ' + S.NAME + '.' + syn.name + '; CREATE SYNONYM '+ s.name + '.' + syn.name + ' FOR stub.' + syn.name + '; '
FROM sys.synonyms syn
INNER JOIN sys.schemas s
ON syn.schema_id = s.schema_id