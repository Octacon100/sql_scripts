--Not needed as it connects to cfn_security.
--use cfn_security
--go

UPDATE dbo.flyway_schema_history
SET checksum = 1934896556
WHERE version = '2023.100'
