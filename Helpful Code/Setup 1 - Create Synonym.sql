
/****** Object:  Synonym [dbo].[Account]    Script Date: 7/15/2020 12:58:55 PM ******/
IF EXISTS (SELECT * FROM sys.synonyms WHERE name = N'Account' AND schema_id = SCHEMA_ID(N'dbo'))
	DROP SYNONYM [dbo].[Account]

CREATE SYNONYM [dbo].[Account] FOR [Consolidation].[dbo].[Account]
GO
