EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'CFN_SecurityMML'
GO
use [CFN_SecurityMML];
GO
use [master];
GO
USE [master]
GO
ALTER DATABASE [CFN_SecurityMML] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
/****** Object:  Database [CFN_SecurityMML]    Script Date: 10/9/2020 4:46:07 PM ******/
DROP DATABASE [CFN_SecurityMML]
GO
