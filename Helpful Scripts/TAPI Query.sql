SELECT top 100 *
  FROM [Tenant].[tenant].[Setting]
  WHERE path like '%ContactInfo%' OR [KEY] LIKE '%QTRHelpUrl%'