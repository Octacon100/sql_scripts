SELECT *
FROM clarify.dbo.flyway_schema_history
ORDER BY TRY_CAST(version AS DECIMAL(10,5)) DESC