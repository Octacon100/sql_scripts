--DECLARE @schema VARCHAR(MAX);
--  DECLARE @schema1 VARCHAR(MAX);
  
EXEC master.dbo.sp_WhoIsActive 
                                 @get_plans = 1               -- tinyint
                                 
