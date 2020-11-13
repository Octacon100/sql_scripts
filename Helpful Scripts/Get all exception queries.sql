/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [iExceptionLoadID]
      ,[iExceptionTypeID]
      ,[dtLastRunDate]
      ,[dtNextRunDate]
      ,[vchLoadProcedureName]
      ,[dtCreateDate]
      ,[iCreatedBy]
      ,[dtLastUpdate]
      ,[iLastUpdateBy]
      ,[iChgStamp]
      ,[bActive]
      ,[vchFrequency]
      ,[bRunOffHour]
  FROM [Surveillance].[dbo].[EXCEPTION_LOAD]