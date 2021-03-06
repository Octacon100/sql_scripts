/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [iMasterExceptionID]
      ,[iExceptionTypeID]
      ,[iExceptionReasonID]
      ,[vchNotes]
      ,[iReviewStatusID]
      ,[iOverrideID]
      ,[iReviewed]
      ,[vchGUID]
      ,[dtCreateDate]
      ,[iCreatedBy]
      ,[dtLastUpdate]
      ,[iLastUpdateBy]
      ,[iChgStamp]
  FROM [Surveillance].[dbo].[MASTER_EXCEPTION]
  WHERE iExceptionTypeID IN (81, 82)
  ORDER BY dtLastUpdate desc