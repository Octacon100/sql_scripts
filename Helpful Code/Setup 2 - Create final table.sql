use consolidation
go

DROP TABLE IF EXISTS dbo.account

CREATE TABLE [dbo].[Account](
	[iAccountID] [INT] NULL,
	[vchSource] [VARCHAR](10) NULL,
	[vchAccountSource] [VARCHAR](10) NULL,
	[vchMgtCompany] [VARCHAR](250) NULL,
	[vchProduct] [VARCHAR](513) NULL,
	[vchBranchId] [VARCHAR](9) NULL,
	[vchAccountID] [VARCHAR](20) NULL,
	[vchAccountNumber] [VARCHAR](50) NULL,
	[AcctReg] [VARCHAR](133) NULL,
	[dtOpened] [DATETIME] NULL,
	[vchPlanID] [VARCHAR](10) NULL,
	[AcctType] [VARCHAR](250) NULL,
	[iNAFID] [INT] NULL,
	[vchCusip] [VARCHAR](10) NULL,
	[vchFundCode] [VARCHAR](7) NULL,
	[vchFundCompanyCode] [VARCHAR](10) NULL,
	[vchStatus] [VARCHAR](250) NULL,
	[vchStatusCode] [VARCHAR](2) NULL,
	[iHHID] [INT] NULL,
	[vchPlanStatusCode] [CHAR](1) NULL,
	[vchAcctKey] [VARCHAR](60) NULL,
	[vchHHName] [VARCHAR](50) NULL,
	[vchAcctRegLine1] [VARCHAR](40) NULL,
	[vchAcctRegLine2] [VARCHAR](40) NULL,
	[vchAcctRegLine3] [VARCHAR](40) NULL,
	[vchAcctRegLine4] [VARCHAR](40) NULL,
	[vchAcctRegLine5] [VARCHAR](40) NULL,
	[vchAcctRegLine6] [VARCHAR](40) NULL,
	[vchNFSAccount] [VARCHAR](20) NULL,
	[vchLineCode] [CHAR](1) NULL,
	[vchSocialCode] [VARCHAR](3) NULL,
	[vchTaxIDCode] [VARCHAR](3) NULL,
	[vchNAFAccountNumber] [VARCHAR](20) NULL,
	[vchOwnerTypeDesc] [VARCHAR](30) NULL,
	[vchShortName] [VARCHAR](15) NULL,
	[iJoin2client] [INT] NULL,
	[dtLastUpdate] [DATETIME] NULL,
	[iConsAccountid] [INT] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[dtInsert] [DATETIME] NULL,
	[nNetWorth] [NUMERIC](18, 2) NULL,
	[vchSponsorRepID] [VARCHAR](50) NULL,
	[vchRepName] [VARCHAR](65) NULL,
	[vchTaxIDNumber] [VARCHAR](15) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY NONCLUSTERED 
(
	[iConsAccountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
