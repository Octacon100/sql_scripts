DROP TABLE IF EXISTS stub.Suitability;
GO
CREATE TABLE stub.Suitability
(
	  [dtTransmissionCreationDate] DATETIME NULL
	, [vchBranch] VARCHAR(5) NULL
	, [vchAccountID] VARCHAR(10) NULL
	, [vchAccountNumber] VARCHAR(20) NULL
	, [vchUpdateCode] VARCHAR(2) NULL
	, [dtUpdateDate] DATETIME NULL
	, [vchSuitabilityStatus] VARCHAR(2) NULL
	, [vchInvestObjective] VARCHAR(5) NULL
	, [vchInvestmentObjective1] VARCHAR(5) NULL
	, [vchInvestmentObjectiveRank1] VARCHAR(2) NULL
	, [vchInvestmentObjective2] VARCHAR(2) NULL
	, [vchInvestmentObjectiveRank2] VARCHAR(2) NULL
	, [vchInvestmentObjective3] VARCHAR(2) NULL
	, [vchInvestmentObjectiveRank3] VARCHAR(2) NULL
	, [vchInvestmentObjective4] VARCHAR(2) NULL
	, [vchInvestmentObjectiveRank4] VARCHAR(2) NULL
	, [vchInvestmentObjective5] VARCHAR(2) NULL
	, [vchInvestmentObjectiveRank5] VARCHAR(2) NULL
	, [vchInvestmentObjective6] VARCHAR(2) NULL
	, [vchInvestmentObjectiveRank6] VARCHAR(2) NULL
	, [vchInvestmentObjectiveOtherFreeForm] VARCHAR(30) NULL
	, [vchRegRep] VARCHAR(5) NULL
	, [vchAnnualIncome] VARCHAR(2) NULL
	, [mAnnualIncomeDollars] MONEY NULL
	, [vchEstimatedNetWorth] VARCHAR(2) NULL
	, [mEstimatedNetWorthDollars] MONEY NULL
	, [vchEstimatedLiquidNetWorth] VARCHAR(2) NULL
	, [mEstimatedLiquidNetWorthDollars] MONEY NULL
	, [vchMaritalStatus] VARCHAR(2) NULL
	, [vchNumberOfDependants] VARCHAR(3) NULL
	, [cRiskTolerance] CHAR(1) NULL
	, [vchRiskToleranceFreeForm] VARCHAR(25) NULL
	, [vchTaxBracket] VARCHAR(2) NULL
	, [cTimeHorizon] CHAR(1) NULL
	, [LastReviewDate] DATE NULL
	, [vchInvestmentKnowledge] VARCHAR(2) NULL
	, [vchTimeHorizonFreeForm] VARCHAR(24) NULL
	, [cAnnualExpenses] CHAR(1) NULL
	, [cSpecialExpenses] CHAR(1) NULL
	, [cSpecialExpensesTimeFrame] CHAR(1) NULL
	, [cInvestmentPurpose] CHAR(1) NULL
	, [vchInvestmentPurposetext] VARCHAR(32) NULL
	, [cStockKnowledge] CHAR(2) NULL
	, [cStockTranCount] CHAR(1) NULL
	, [cBondKnowledge] CHAR(2) NULL
	, [cBondTranCount] CHAR(1) NULL
	, [cShortTermKnowledge] CHAR(2) NULL
	, [cShortTermTranCount] CHAR(1) NULL
	, [cMutualFundKnowledge] CHAR(2) NULL
	, [cMutualFundTranCount] CHAR(1) NULL
	, [cOptionsKnowledge] CHAR(2) NULL
	, [cOptionsTranCount] CHAR(1) NULL
	, [cVariableContractKnowledge] CHAR(2) NULL
	, [cVariableContractTranCount] CHAR(1) NULL
	, [cLPKnowledge] CHAR(2) NULL
	, [cLPTranCount] CHAR(1) NULL
	, [cFuturesKnowledge] CHAR(2) NULL
	, [cFuturesTranCount] CHAR(1) NULL
	, [cAltInvKnowledge] CHAR(2) NULL
	, [cAltInvTranCount] CHAR(1) NULL
	, [cAnnuityKnowledge] CHAR(2) NULL
	, [cAnnuityTranCount] CHAR(1) NULL
	, [cMarginKnowledge] CHAR(2) NULL
	, [cMarginTranCount] CHAR(1) NULL
	, [cForeignCurrencyKnowledge] CHAR(2) NULL
	, [cForeignCurrencyTranCount] CHAR(1) NULL
	, [cForeignSecurityKnowledge] CHAR(2) NULL
	, [cForeignSecurityTranCount] CHAR(1) NULL
	, [cConsultingBroker] CHAR(1) NULL
	, [cConsultingOwnDecisions] CHAR(1) NULL
	, [cConsultingFamilyFriends] CHAR(1) NULL
	, [mAssetsHeldAwayAmount] MONEY NULL
	, [dStockHeldAwayPercent] DECIMAL(3,0) NULL
	, [dBondHeldAwayPercent] DECIMAL(3,0) NULL
	, [dShortTermHeldAwayPercent] DECIMAL(3,0) NULL
	, [dMutualFundsAwayPercent] DECIMAL(3,0) NULL
	, [dOptionsAwayPercent] DECIMAL(3,0) NULL
	, [dVariableContractsAwayPercent] DECIMAL(3,0) NULL
	, [dLPAwayPercent] DECIMAL(3,0) NULL
	, [dFuturesAwayPercent] DECIMAL(3,0) NULL
	, [dAltInvAwayPercent] DECIMAL(3,0) NULL
	, [dAnnuityAwayPercent] DECIMAL(3,0) NULL
	, [dForeignCurrencyAwayPercent] DECIMAL(3,0) NULL
	, [dForeignSecurityAwayPercent] DECIMAL(3,0) NULL
	, [dOtherAwayPercent] DECIMAL(3,0) NULL
	, [vchOtherAwayFreeForm] VARCHAR(64) NULL
	, [iUID] INT NULL
	, [ProductKnowledgeANA] BIT NULL
	, [AssetsHeldAwayANA] BIT NULL
	, [FundingSource] CHAR(1) NULL
	, [FundingSourceOther] VARCHAR(32) NULL
	, [FinancialInformationShow] BIT NULL
	, [dtDateOfBirth] DATETIME NULL
	, [vchDateOfBirth] VARCHAR(10) NULL
	, [ScrambleStatus_dtDateOfBirth] BIT NULL
	, [ScrambleStatus_vchDateOfBirth] BIT NULL
)
;
DROP TABLE IF EXISTS stub.AccountPERSHING;
GO
CREATE TABLE stub.AccountPERSHING
(
	  [iAccountID] INT NOT NULL IDENTITY(1,1) 
	, [vchAccountNumber] VARCHAR(9) NULL
	, [vchIntrodBrokerNumber] VARCHAR(3) NULL
	, [vchInvestmentProfessional] VARCHAR(3) NULL
	, [vchShortName] VARCHAR(10) NULL
	, [cTransactionType] CHAR(1) NULL
	, [cAutoUserTitled] CHAR(1) NULL
	, [cAccountTypeCode] CHAR(1) NULL
	, [cTaxIDType] CHAR(1) NULL
	, [vchRegType] VARCHAR(4) NULL
	, [cNumberedInd] CHAR(1) NULL
	, [cNumberRegLines] CHAR(1) NULL
	, [vchRegLine1] VARCHAR(32) NULL
	, [vchRegLine2] VARCHAR(32) NULL
	, [vchRegLine3] VARCHAR(32) NULL
	, [vchRegLine4] VARCHAR(32) NULL
	, [vchRegLine5] VARCHAR(32) NULL
	, [vchRegLine6] VARCHAR(32) NULL
	, [cUSCitizen] CHAR(1) NULL
	, [cMarriedInd] CHAR(1) NULL
	, [vchTenancyState] VARCHAR(2) NULL
	, [vchJointTenancy] VARCHAR(4) NULL
	, [dtAgreeExecutionDate] DATETIME NULL
	, [vchNumberTenants] VARCHAR(2) NULL
	, [vchStateGiftGiven] VARCHAR(2) NULL
	, [dtDateGiftGive] DATETIME NULL
	, [nTerminateAge] NUMERIC NULL
	, [cGiftManner] CHAR(1) NULL
	, [cTrustType] CHAR(1) NULL
	, [dtTrustEstablishedDate] DATETIME NULL
	, [dtAmendedDate] DATETIME NULL
	, [cTrusteeIndAction] CHAR(1) NULL
	, [dtAccountOpened] DATETIME NULL
	, [dtAccountUpdated] DATETIME NULL
	, [cAccountStatusInd] CHAR(1) NULL
	, [dtPendingClosedDate] DATETIME NULL
	, [dtAccountClosed] DATETIME NULL
	, [dtLastTradeActivity] DATETIME NULL
	, [dtAccountReActivated] DATETIME NULL
	, [dtAccountReOpened] DATETIME NULL
	, [cProceeds] CHAR(1) NULL
	, [cTransferInstructions] CHAR(1) NULL
	, [cIncomeInstructions] CHAR(1) NULL
	, [vchNumberOfConfirms] VARCHAR(2) NULL
	, [vchNumberOfStatements] VARCHAR(2) NULL
	, [cInvestmentObjectiveTransCode] CHAR(1) NULL
	, [vchComments] VARCHAR(26) NULL
	, [vchEmployerShortName] VARCHAR(15) NULL
	, [vchEmployerCusip] VARCHAR(9) NULL
	, [vchEmployerSymbol] VARCHAR(9) NULL
	, [cMarginPrivRevoked] CHAR(1) NULL
	, [dtStatementReview] DATETIME NULL
	, [cMarginPapersOnFile] CHAR(1) NULL
	, [cOptionPapersOnFile] CHAR(1) NULL
	, [cInvestProfDiscretionGranted] CHAR(1) NULL
	, [cInvestAdvDiscretionGranted] CHAR(1) NULL
	, [cThirdPartyDiscretionGranted] CHAR(1) NULL
	, [vchThirdPartyName] VARCHAR(15) NULL
	, [cRiskFactorCode] CHAR(1) NULL
	, [vchInvestObjectiveCode] VARCHAR(4) NULL
	, [cOptionEquities] CHAR(1) NULL
	, [cOptionIndex] CHAR(1) NULL
	, [cOptionDebt] CHAR(1) NULL
	, [cOptionCurrency] CHAR(1) NULL
	, [cOptionLevel1] CHAR(1) NULL
	, [cOptionLevel2] CHAR(1) NULL
	, [cOptionLevel3] CHAR(1) NULL
	, [cOptionLevel4] CHAR(1) NULL
	, [nOptionCallLimits] NUMERIC NULL
	, [nOptionPutLimits] NUMERIC NULL
	, [nOptionTotalPutCallLimits] NUMERIC NULL
	, [cNonUSDollarTrading] CHAR(1) NULL
	, [cNonCustomerInd] CHAR(1) NULL
	, [vchThirdPartyFeeInd] VARCHAR(2) NULL
	, [dtThirdPartyFeeApproval] DATETIME NULL
	, [vchCommissionSchedule] VARCHAR(2) NULL
	, [vchGroupIndex] VARCHAR(5) NULL
	, [vchMoneyManagerID] VARCHAR(3) NULL
	, [vchMoneyManagerObjectiveID] VARCHAR(3) NULL
	, [vchDTCIDConfirmNumberNonCOD] VARCHAR(5) NULL
	, [vchCapsMasterMnemonic] VARCHAR(9) NULL
	, [vchEmployeeID] VARCHAR(8) NULL
	, [cPrimeBrokerFreeFundInd] CHAR(1) NULL
	, [cFeeBasedAccountInd] CHAR(1) NULL
	, [vchBillingType] VARCHAR(3) NULL
	, [dtFeeBasedTerminationDate] DATETIME NULL
	, [cEquifaxCreditCheckInd] CHAR(1) NULL
	, [vchSelfDirectd401KPlanName] VARCHAR(32) NULL
	, [vchSelfDirected401KAccountType] VARCHAR(32) NULL
	, [vchPlanType] VARCHAR(2) NULL
	, [vchPlanNumber] VARCHAR(10) NULL
	, [vchEmployeeEmpRelativeInd] VARCHAR(4) NULL
	, [nCommissionPercentDiscount] NUMERIC NULL
	, [c12B1FeeBlockingInd] CHAR(1) NULL
	, [vchNameInvProfSignedNewAcctForm] VARCHAR(15) NULL
	, [dtInvProfSignedNewAcctForm] DATETIME NULL
	, [vchNamePrincipalSignedNewAcctForm] VARCHAR(15) NULL
	, [dtPrincipleSignedNewAcctForm] DATETIME NULL
	, [cPoliticallyExposedPersonInd] CHAR(1) NULL
	, [cPrivateBankingAcctInd] CHAR(1) NULL
	, [cForeignBankAcctInd] CHAR(1) NULL
	, [vchInitialSourceFunds] VARCHAR(4) NULL
	, [vchUSAPatriotActExemptReason] VARCHAR(4) NULL
	, [vchCountryOfCitizenship] VARCHAR(2) NULL
	, [vchCountryOfResidence] VARCHAR(2) NULL
	, [vchFileName] VARCHAR(50) NULL
	, [dtAccountInsert] DATETIME NULL
	, [dtAccountUpdate] DATETIME NULL
	, [vchPlanID] VARCHAR(15) NULL
	, [vchAcctKey] VARCHAR(60) NULL
	, [vchplanstatuscode] VARCHAR(1) NULL
	, [iHHID] INT NULL
	, [vchHHName] VARCHAR(50) NULL
	, [iNAFID] INT NULL
	, [dtBirthDate] DATETIME NULL
	, [dtMinorsBirthDate] DATETIME NULL
	, [vchTaxIDNumber] VARCHAR(9) NULL
	, [ScrambleStatus_vchTaxIdNumber] BIT NULL
	, [ScrambleStatus_dtBirthDate] BIT NULL
	, [ScrambleStatus_dtMinorsBirthDate] BIT NULL
)
;
DROP TABLE IF EXISTS stub.BRCusip;
GO
CREATE TABLE stub.BRCusip
(
	  [iID] INT NOT NULL IDENTITY(1,1) 
	, [vchCusip] VARCHAR(50) NOT NULL
	, [vchFundCode] VARCHAR(50) NOT NULL
	, [iProductID] INT NULL
)
;
--Accounts.dbo.cfn_AddressDisplayFormatneeds a different way as it is a FN
DROP TABLE IF EXISTS stub.vAccountDirectRegLines;
GO
CREATE TABLE stub.vAccountDirectRegLines
(
	  [vchSource] VARCHAR(40) NULL
	, [vchAcctKey] VARCHAR(60) NULL
	, [vchAcctReg1] VARCHAR(40) NULL
	, [vchAcctReg2] VARCHAR(40) NULL
	, [vchAcctReg3] VARCHAR(40) NULL
)
;
DROP TABLE IF EXISTS stub.vAccountHouseholds;
GO
CREATE TABLE stub.vAccountHouseholds
(
	  [vchAccountNumber] VARCHAR(50) NULL
	, [vchSSNumber] VARCHAR(15) NULL
	, [vchssncode] VARCHAR(5) NULL
	, [vchPrimaryIndic] VARCHAR(2) NULL
	, [vchSource] VARCHAR(40) NULL
	, [vchStreet] VARCHAR(80) NULL
	, [vchPostCode] VARCHAR(5) NULL
	, [vchAcctKey] VARCHAR(60) NULL
)
;
DROP TABLE IF EXISTS stub.vAccountSearchDirectOnly;
GO
CREATE TABLE stub.vAccountSearchDirectOnly
(
	  [iaccountid] INT NOT NULL
	, [vchSource] VARCHAR(40) NULL
	, [vchMgtCompany] VARCHAR(250) NULL
	, [vchAccountID] VARCHAR(20) NULL
	, [vchTaxIdNumber] VARCHAR(15) NULL
	, [AcctReg1] VARCHAR(40) NULL
	, [AcctReg2] VARCHAR(40) NULL
	, [AcctReg3] VARCHAR(40) NULL
	, [vchplanid] VARCHAR(10) NULL
	, [iNAFid] INT NULL
	, [vchCusip] VARCHAR(10) NULL
	, [vchNFSAccount] VARCHAR(20) NULL
	, [vchBranchID] VARCHAR(9) NULL
	, [vchLineCode] VARCHAR(1) NULL
	, [vchFundCompanyName] VARCHAR(10) NULL
	, [vchSocialCode] VARCHAR(3) NULL
	, [vchTaxIDcode] VARCHAR(1) NULL
	, [vchAcctKey] VARCHAR(60) NULL
	, [vchHHName] VARCHAR(50) NULL
	, [iHHID] INT NULL
	, [dtAcctOpened] DATETIME NULL
)
;
DROP TABLE IF EXISTS stub.vAccountSearchDirectOpen;
GO
CREATE TABLE stub.vAccountSearchDirectOpen
(
	  [iaccountid] INT NOT NULL
	, [vchSource] VARCHAR(40) NULL
	, [vchMgtCompany] VARCHAR(250) NULL
	, [vchAccountID] VARCHAR(20) NULL
	, [vchTaxIdNumber] VARCHAR(15) NULL
	, [AcctReg1] VARCHAR(40) NULL
	, [AcctReg2] VARCHAR(40) NULL
	, [AcctReg3] VARCHAR(40) NULL
	, [vchplanid] VARCHAR(10) NULL
	, [iNAFid] INT NULL
	, [vchNAFAcctNum] VARCHAR(20) NULL
	, [vchCusip] VARCHAR(10) NULL
	, [vchFundcode] VARCHAR(7) NULL
	, [vchNFSAccount] VARCHAR(20) NULL
	, [vchBranchID] VARCHAR(9) NULL
	, [vchLineCode] VARCHAR(1) NULL
	, [vchFundCompanyName] VARCHAR(10) NULL
	, [vchSocialCode] VARCHAR(3) NULL
	, [vchTaxIDcode] VARCHAR(1) NULL
	, [vchAcctKey] VARCHAR(60) NULL
)
;
DROP TABLE IF EXISTS stub.vClient;
GO
CREATE TABLE stub.vClient
(
	  [vchSource] VARCHAR(40) NULL
	, [iclientid] INT NOT NULL
	, [vchBranchId] VARCHAR(5) NULL
	, [vchAccountID] VARCHAR(10) NULL
	, [vchAccountNumber] VARCHAR(20) NULL
	, [vchRegRep2Id] VARCHAR(20) NULL
	, [iAccountCUSTID] INT NULL
	, [vchRecordType] VARCHAR(5) NULL
	, [dtTrustDate] DATETIME NULL
	, [vchMinorState] VARCHAR(3) NULL
	, [vchSearchName] VARCHAR(50) NULL
	, [vchBusinessTrustName] VARCHAR(80) NULL
	, [vchFFRXREF] VARCHAR(10) NULL
	, [vchPrimaryIndic] VARCHAR(2) NULL
	, [vchPrimaryIndic_decode] VARCHAR(22) NOT NULL
	, [vchDisplayName] VARCHAR(163) NULL
	, [vchNameType] VARCHAR(10) NULL
	, [vchNameType_decode] VARCHAR(6) NULL
	, [vchCustRecordSegment] VARCHAR(3) NULL
	, [cMailIndicator] CHAR(1) NULL
	, [cLegalIndicator] CHAR(1) NULL
	, [cAFFIndicator] CHAR(1) NULL
	, [cDayTelIndicator] CHAR(1) NULL
	, [cNTETelIndicator] CHAR(1) NULL
	, [cNumberofCustomers] CHAR(1) NULL
	, [vchCustStateID] VARCHAR(30) NULL
	, [cCustStateIdType] CHAR(1) NULL
	, [cCustStateIssued] CHAR(2) NULL
	, [cBrokerAffiliation] CHAR(1) NULL
	, [vchEmployeeOcupation] VARCHAR(50) NULL
	, [vchPrefix] VARCHAR(12) NULL
	, [vchSuffix] VARCHAR(12) NULL
	, [vchFirstName] VARCHAR(50) NULL
	, [vchMiddleName] VARCHAR(50) NULL
	, [vchLastName] VARCHAR(50) NULL
	, [vchRelationshipCode] VARCHAR(50) NULL
	, [vchSSNCode] VARCHAR(5) NULL
	, [vchSSNCode_decode] VARCHAR(8) NULL
	, [vchSSNumber] VARCHAR(20) NULL
	, [dtDateofBirth] DATETIME NULL
	, [cPhoneType] VARCHAR(1) NULL
	, [cPhoneFormat] CHAR(1) NULL
	, [vchPhoneNumber] VARCHAR(25) NULL
	, [vchPhoneExt] VARCHAR(10) NULL
	, [vchPhonePIN] VARCHAR(10) NULL
	, [vchContactName] VARCHAR(20) NULL
	, [vchPriority] VARCHAR(5) NULL
	, [cPhoneType2] VARCHAR(1) NULL
	, [cPhoneFormat2] CHAR(1) NULL
	, [vchPhoneNumber2] VARCHAR(20) NULL
	, [vchPhoneExt2] VARCHAR(5) NULL
	, [vchPhonePIN2] VARCHAR(10) NULL
	, [vchContactName2] VARCHAR(20) NULL
	, [vchPriority2] VARCHAR(5) NULL
	, [vchMailRecordSegment] VARCHAR(3) NULL
	, [vchMailAddressType] VARCHAR(5) NULL
	, [vchMailLabel1] VARCHAR(35) NULL
	, [vchMailLabel2] VARCHAR(35) NULL
	, [vchMailMailTo] VARCHAR(40) NULL
	, [vchMailAddress1] VARCHAR(50) NULL
	, [vchMailAddress2] VARCHAR(50) NULL
	, [vchMailPOBox] VARCHAR(10) NULL
	, [vchMailCity] VARCHAR(50) NULL
	, [vchMailState] VARCHAR(50) NULL
	, [vchMailZipCode] VARCHAR(20) NULL
	, [vchMailExtendedZip] VARCHAR(10) NULL
	, [vchMailProvince] VARCHAR(30) NULL
	, [vchMailAddressFormat] VARCHAR(2) NULL
	, [vchMailCountryCode] VARCHAR(5) NULL
	, [vchMailIntPOCode] VARCHAR(10) NULL
	, [tiMailBookInfo] INT NOT NULL
	, [vchLegalAddressType] VARCHAR(5) NULL
	, [vchLegalLabel1] VARCHAR(35) NULL
	, [vchLegalLabel2] VARCHAR(35) NULL
	, [vchLegalMailTo] VARCHAR(40) NULL
	, [vchLegalAddress1] VARCHAR(50) NULL
	, [vchLegalAddress2] VARCHAR(50) NULL
	, [vchLegalPOBox] VARCHAR(10) NULL
	, [vchLegalCity] VARCHAR(50) NULL
	, [vchLegalState] VARCHAR(50) NULL
	, [vchLegalZipCode] VARCHAR(20) NULL
	, [vchLegalExtendedZip] VARCHAR(10) NULL
	, [vchLegalProvince] VARCHAR(30) NULL
	, [vchLegalAddressFormat] VARCHAR(2) NULL
	, [vchLegalCountryCode] VARCHAR(20) NULL
	, [vchLegalIntPOCode] VARCHAR(10) NULL
	, [tiLegalBookInfo] INT NOT NULL
	, [vchAffilAddressType] VARCHAR(5) NULL
	, [vchAffilFirmName] VARCHAR(50) NULL
	, [vchAffilFirmType] VARCHAR(2) NULL
	, [vchAffilLabel2] VARCHAR(35) NULL
	, [vchAffilMailTo] VARCHAR(40) NULL
	, [vchAffilAddress1] VARCHAR(40) NULL
	, [vchAffilAddress2] VARCHAR(40) NULL
	, [vchAffilPOBox] VARCHAR(10) NULL
	, [vchAffilCity] VARCHAR(30) NULL
	, [vchAffilState] VARCHAR(5) NULL
	, [vchAffilZipCode] VARCHAR(15) NULL
	, [vchAffilExtendedZip] VARCHAR(10) NULL
	, [vchAffilProvince] VARCHAR(30) NULL
	, [vchAffilAddressFormat] VARCHAR(2) NULL
	, [vchAffilCountryCode] VARCHAR(5) NULL
	, [vchAffilCountry] VARCHAR(50) NULL
	, [vchAffilIntPOCode] VARCHAR(10) NULL
	, [iBookID] INT NULL
	, [iEmployerID] INT NULL
	, [vchEmpOccupation] VARCHAR(50) NULL
	, [vchEmploymentStatus] VARCHAR(2) NULL
	, [vchEmpIncomeSource] VARCHAR(50) NULL
	, [vchEmpAddress1] VARCHAR(40) NULL
	, [vchEmpAddress2] VARCHAR(40) NULL
	, [vchEmpAddress3] VARCHAR(40) NULL
	, [vchEmpCity] VARCHAR(30) NULL
	, [vchEmpState] VARCHAR(5) NULL
	, [vchEmpZip1] VARCHAR(15) NULL
	, [vchEmpZip2] VARCHAR(10) NULL
	, [dtEmpLastUpdate] DATETIME NULL
	, [dtEmpInsertDate] DATETIME NULL
	, [iControl1ControlId] INT NULL
	, [vchControl1Relationship] VARCHAR(2) NULL
	, [vchControl1Company] VARCHAR(50) NULL
	, [vchControl1Cusip] VARCHAR(9) NULL
	, [dtControl1LastUpdate] DATETIME NULL
	, [dtControl1Insert] DATETIME NULL
	, [iControl2ControlId] INT NULL
	, [vchControl2Relationship] VARCHAR(2) NULL
	, [vchControl2Company] VARCHAR(50) NULL
	, [vchControl2Cusip] VARCHAR(9) NULL
	, [dtControl2LastUpdate] DATETIME NULL
	, [dtControl2Insert] DATETIME NULL
	, [iControl3ControlId] INT NULL
	, [vchControl3Relationship] VARCHAR(2) NULL
	, [vchControl3Company] VARCHAR(50) NULL
	, [vchControl3Cusip] VARCHAR(9) NULL
	, [dtControl3LastUpdate] DATETIME NULL
	, [dtControl3Insert] DATETIME NULL
	, [CitzCountry] VARCHAR(10) NULL
	, [CitzLicNo] VARCHAR(30) NULL
	, [CitzPassport] VARCHAR(30) NULL
	, [CitzState] VARCHAR(5) NULL
)
;
DROP TABLE IF EXISTS stub.CodeValues;
GO
CREATE TABLE stub.CodeValues
(
	  [iCodeID] INT NOT NULL IDENTITY(1,1) 
	, [vchSource] VARCHAR(20) NULL
	, [vchCodeType] VARCHAR(40) NOT NULL
	, [vchCodeValue] VARCHAR(40) NULL
	, [vchCodeDesc1] VARCHAR(250) NULL
	, [vchCodeDesc2] VARCHAR(250) NULL
	, [iCodeValue] INT NULL
	, [tiDeactive] TINYINT NULL DEFAULT((0))
	, [tiShowUI] TINYINT NULL DEFAULT((0))
	, [tiUIOrder] TINYINT NULL
	, [vchCodeDesc3] VARCHAR(250) NULL
)
;
DROP TABLE IF EXISTS stub.nfnameaddr_books;
GO
CREATE TABLE stub.nfnameaddr_books
(
	  [dtTransmissionCreationDate] DATETIME NULL
	, [vchBranch] VARCHAR(5) NULL
	, [vchAccountID] VARCHAR(10) NULL
	, [vchAccountNumber] VARCHAR(15) NULL
	, [vchCustRecordSegment] VARCHAR(3) NULL
	, [vchFFRXREF] VARCHAR(10) NULL
	, [cMailIndicator] CHAR(1) NULL
	, [cLegalIndicator] CHAR(1) NULL
	, [cAFFIndicator] CHAR(1) NULL
	, [cDayTelIndicator] CHAR(1) NULL
	, [cNTETelIndicator] CHAR(1) NULL
	, [cNumberofCustomers] CHAR(1) NULL
	, [vchCustStateID] VARCHAR(30) NULL
	, [cCustStateIdType] CHAR(1) NULL
	, [cCustStateIssued] CHAR(2) NULL
	, [cBrokerAffiliation] CHAR(1) NULL
	, [vchEmployeeOcupation] VARCHAR(35) NULL
	, [dtLastMaintDate] DATETIME NULL
	, [vchUpdateUser] VARCHAR(10) NULL
	, [vchUpdateTimeStamp] VARCHAR(30) NULL
	, [cNameFormat] CHAR(1) NULL
	, [vchNamePrefix] VARCHAR(10) NULL
	, [vchNameSuffix] VARCHAR(10) NULL
	, [vchFirstName] VARCHAR(25) NULL
	, [vchMiddleName] VARCHAR(10) NULL
	, [vchLastName] VARCHAR(30) NULL
	, [vchRelCode] VARCHAR(5) NULL
	, [cIRSCode] CHAR(1) NULL
	, [cPhoneType] CHAR(1) NULL
	, [cPhoneFormat] CHAR(1) NULL
	, [vchPhoneNumber] VARCHAR(15) NULL
	, [vchPhoneExt] VARCHAR(5) NULL
	, [vchPhonePIN] VARCHAR(10) NULL
	, [vchContactName] VARCHAR(20) NULL
	, [vchPriority] VARCHAR(5) NULL
	, [vchUpdateUser2] VARCHAR(10) NULL
	, [vchUpdateTimeStamp2] VARCHAR(30) NULL
	, [cPhoneType2] CHAR(1) NULL
	, [cPhoneFormat2] CHAR(1) NULL
	, [vchPhoneNumber2] VARCHAR(15) NULL
	, [vchPhoneExt2] VARCHAR(5) NULL
	, [vchPhonePIN2] VARCHAR(10) NULL
	, [vchContactName2] VARCHAR(20) NULL
	, [vchPriority2] VARCHAR(5) NULL
	, [vchUpdateUser3] VARCHAR(10) NULL
	, [vchUpdateTimeStamp3] VARCHAR(30) NULL
	, [vchMailRecordSegment] VARCHAR(3) NULL
	, [vchMailAddressType] VARCHAR(5) NULL
	, [vchMailLabel1] VARCHAR(35) NULL
	, [vchMailLabel2] VARCHAR(35) NULL
	, [vchMailMailTo] VARCHAR(35) NULL
	, [vchMailAddress1] VARCHAR(35) NULL
	, [vchMailAddress2] VARCHAR(35) NULL
	, [vchMailPOBox] VARCHAR(10) NULL
	, [vchMailCity] VARCHAR(30) NULL
	, [vchMailState] VARCHAR(5) NULL
	, [vchMailZipCode] VARCHAR(5) NULL
	, [vchMailExtendedZip] VARCHAR(5) NULL
	, [vchMailProvince] VARCHAR(30) NULL
	, [dtMailLastMaintDate] DATETIME NULL
	, [vchMailAddressFormat] VARCHAR(2) NULL
	, [vchMailCountryCode] VARCHAR(5) NULL
	, [vchMailCountry] VARCHAR(50) NULL
	, [vchMailIntPOCode] VARCHAR(10) NULL
	, [vchMailUpdateUser] VARCHAR(10) NULL
	, [vchMailUpdateTimeStamp] VARCHAR(30) NULL
	, [vchLegalRecordSegment] VARCHAR(3) NULL
	, [vchLegalAddressType] VARCHAR(5) NULL
	, [vchLegalLabel1] VARCHAR(35) NULL
	, [vchLegalLabel2] VARCHAR(35) NULL
	, [vchLegalMailTo] VARCHAR(35) NULL
	, [vchLegalAddress1] VARCHAR(35) NULL
	, [vchLegalAddress2] VARCHAR(35) NULL
	, [vchLegalPOBox] VARCHAR(10) NULL
	, [vchLegalCity] VARCHAR(30) NULL
	, [vchLegalState] VARCHAR(5) NULL
	, [vchLegalZipCode] VARCHAR(5) NULL
	, [vchLegalExtendedZip] VARCHAR(5) NULL
	, [vchLegalProvince] VARCHAR(30) NULL
	, [dtLegalLastMaintDate] DATETIME NULL
	, [vchLegalAddressFormat] VARCHAR(2) NULL
	, [vchLegalCountryCode] VARCHAR(5) NULL
	, [vchLegalCountry] VARCHAR(50) NULL
	, [vchLegalIntPOCode] VARCHAR(10) NULL
	, [vchLegalUpdateUser] VARCHAR(10) NULL
	, [vchLegalUpdateTimeStamp] VARCHAR(30) NULL
	, [vchAffilRecordSegment] VARCHAR(3) NULL
	, [vchAffilAddressType] VARCHAR(5) NULL
	, [vchAffilLabel1] VARCHAR(35) NULL
	, [vchAffilLabel2] VARCHAR(35) NULL
	, [vchAffilMailTo] VARCHAR(35) NULL
	, [vchAffilAddress1] VARCHAR(35) NULL
	, [vchAffilAddress2] VARCHAR(35) NULL
	, [vchAffilPOBox] VARCHAR(10) NULL
	, [vchAffilCity] VARCHAR(30) NULL
	, [vchAffilState] VARCHAR(5) NULL
	, [vchAffilZipCode] VARCHAR(5) NULL
	, [vchAffilExtendedZip] VARCHAR(5) NULL
	, [vchAffilProvince] VARCHAR(30) NULL
	, [dtAffilLastMaintDate] DATETIME NULL
	, [vchAffilAddressFormat] VARCHAR(2) NULL
	, [vchAffilCountryCode] VARCHAR(5) NULL
	, [vchAffilCountry] VARCHAR(50) NULL
	, [vchAffilIntPOCode] VARCHAR(10) NULL
	, [vchAffilUpdateUser] VARCHAR(10) NULL
	, [vchAffilUpdateTimeStamp] VARCHAR(30) NULL
	, [dtInsertUpdate] DATETIME NULL
	, [iBookID] INT NOT NULL IDENTITY(1,1) 
	, [ImportExecutionID] BIGINT NULL
	, [vchCitizenOrganizationCountry] VARCHAR(3) NULL
	, [vchMailAutoAddressUpdateIndicator] CHAR(1) NULL
	, [vchMailNCOAAddressUpdateIndicator] CHAR(1) NULL
	, [vchLegalAutoAddressUpdateIndicator] CHAR(1) NULL
	, [vchLegalNCOAAddressUpdateIndicator] CHAR(1) NULL
	, [dtBirthDate] DATETIME NULL
	, [vchTaxIDNumber] VARCHAR(15) NULL
	, [ScrambleStatus_dtBirthDate] BIT NULL
	, [ScrambleStatus_vchTaxIDNumber] BIT NULL
)
;
DROP TABLE IF EXISTS stub.nfnameaddr_cust;
GO
CREATE TABLE stub.nfnameaddr_cust
(
	  [dtTransmissionDate] DATETIME NULL
	, [vchBranchId] VARCHAR(5) NULL
	, [vchAccountID] VARCHAR(10) NULL
	, [vchAccountNumber] VARCHAR(20) NULL
	, [vchRecordType] VARCHAR(5) NULL
	, [vchConfirmsNumber] VARCHAR(5) NULL
	, [vchStatementsNumber] VARCHAR(5) NULL
	, [vchTaxIdCode] VARCHAR(2) NULL
	, [vchPostCode] VARCHAR(10) NULL
	, [vchRegionCode] VARCHAR(5) NULL
	, [vchShortName] VARCHAR(15) NULL
	, [vchTransferLegend] VARCHAR(2) NULL
	, [vchManagedAccountIndic] VARCHAR(2) NULL
	, [vchUpdateCode] VARCHAR(2) NULL
	, [dtLastUpdateDate] DATETIME NULL
	, [vchRegRepId] VARCHAR(20) NULL
	, [vchTradingAuthority] VARCHAR(2) NULL
	, [vchEmployeeCode] VARCHAR(2) NULL
	, [vchCitizenshipCode] VARCHAR(2) NULL
	, [vchCountryCitizen] VARCHAR(5) NULL
	, [vchDoNotPurgeCode] VARCHAR(2) NULL
	, [vchAccountClass] VARCHAR(5) NULL
	, [vchProceedsInst] VARCHAR(2) NULL
	, [vchSecuritiesInst] VARCHAR(2) NULL
	, [vchCashDivInst] VARCHAR(2) NULL
	, [vchNOBOIndicator] VARCHAR(2) NULL
	, [vchCommissionClass] VARCHAR(2) NULL
	, [vchCommissionDiscount] VARCHAR(10) NULL
	, [vchCommissionSchedule] VARCHAR(3) NULL
	, [vchParentBranchId] VARCHAR(5) NULL
	, [vchParentAccount] VARCHAR(10) NULL
	, [vchAgencyCode] VARCHAR(10) NULL
	, [vchRegRep2Id] VARCHAR(10) NULL
	, [vchNapRap] VARCHAR(1) NULL
	, [dtNapRapDate] DATETIME NULL
	, [vchInstDeliveryCode] VARCHAR(2) NULL
	, [vchInstDeliveryNumber] VARCHAR(10) NULL
	, [vchAgentBankNumber] VARCHAR(10) NULL
	, [vchMailListCode] VARCHAR(5) NULL
	, [dtDateAcctOpened] DATETIME NULL
	, [vchRestrictionCode] VARCHAR(2) NULL
	, [vchInvestmentClub] VARCHAR(2) NULL
	, [vchJointAccount] VARCHAR(2) NULL
	, [vchCorporateAgrmnt] VARCHAR(2) NULL
	, [vchPartnershipAgrmnt] VARCHAR(2) NULL
	, [vchMarginAgrmnt] VARCHAR(2) NULL
	, [vchOptionStatus] VARCHAR(2) NULL
	, [vchOptionAgrmnt] VARCHAR(2) NULL
	, [vchLoanAgrmnt] VARCHAR(2) NULL
	, [vchFiduciaryAgrmnt] VARCHAR(2) NULL
	, [vchNewAccountPapers] VARCHAR(3) NULL
	, [vchSegregationCode] VARCHAR(2) NULL
	, [dtAbandonPropertyDate] DATETIME NULL
	, [vchPreferredCustCode] VARCHAR(5) NULL
	, [vchExtendZipCode] VARCHAR(15) NULL
	, [vchNumAddressLines] VARCHAR(2) NULL
	, [vchAddressLine1] VARCHAR(35) NULL
	, [vchAddressLine2] VARCHAR(35) NULL
	, [vchAddressLine3] VARCHAR(35) NULL
	, [vchAddressLine4] VARCHAR(35) NULL
	, [vchAddressLine5] VARCHAR(35) NULL
	, [vchAddressLine6] VARCHAR(35) NULL
	, [vchRegType] VARCHAR(10) NULL
	, [vchProductLevel] VARCHAR(3) NULL
	, [dtInsertUpdate] DATETIME NULL
	, [iAccountCUSTID] INT NOT NULL IDENTITY(1,1) 
	, [vchHHName] VARCHAR(50) NULL
	, [iHHID] INT NULL
	, [bIsPPS] BIT NULL
	, [vchOmnibusCode] VARCHAR(2) NULL
	, [iPPSContractid] INT NULL
	, [vchMoneyMoveAuth_Level] VARCHAR(1) NULL
	, [vchCorpTaxStatusInd] VARCHAR(1) NULL
	, [vchCostBasisDisposalMethodCode] VARCHAR(4) NULL
	, [ImportExecutionID] BIGINT NULL
	, [vchRecordNumber] VARCHAR(3) NULL
	, [vchSeparateAccountManagerIndicator] CHAR(1) NULL
	, [vchDividendRoundoutInstructionCode] CHAR(1) NULL
	, [vchCorporateTaxStatus] CHAR(1) NULL
	, [vchSpecialMarginRate] VARCHAR(5) NULL
	, [vchBypassMiscFeeIndicator] CHAR(1) NULL
	, [vchAdvisorReportingIndicator] CHAR(1) NULL
	, [vchLateTradeIndicator] CHAR(1) NULL
	, [vchMarginSweepCode] CHAR(1) NULL
	, [vchSetupFeeIndicator] CHAR(1) NULL
	, [vchProductLevelSubtypeCode] CHAR(1) NULL
	, [vchW8FormCode] CHAR(1) NULL
	, [dtW8CertificationDate] DATE NULL
	, [vchAccountSourceCode] VARCHAR(3) NULL
	, [vchBDAParentAccountNumber] VARCHAR(9) NULL
	, [vchNetAssetValueIndicator] CHAR(1) NULL
	, [vchPlanNameCode] VARCHAR(5) NULL
	, [vchTeamCode] VARCHAR(3) NULL
	, [vchFiagAccountIndicator] CHAR(1) NULL
	, [vchProxyVoteIndicator] CHAR(1) NULL
	, [vchPrimeBrokerIndicator] CHAR(1) NULL
	, [vchTransferAgentFeeCode] VARCHAR(3) NULL
	, [vchTransferAgentManagementFeeCode] VARCHAR(3) NULL
	, [vchAccountRegulatoryCode] VARCHAR(2) NULL
	, [vchExchangeIndicator] CHAR(1) NULL
	, [vchCashManagementFeeScheduleCode] VARCHAR(2) NULL
	, [vchMultipleMarginIndicator] CHAR(1) NULL
	, [vchAssetDistributionAccountCode] CHAR(1) NULL
	, [vchConfirmPrintCode] CHAR(1) NULL
	, [vchFamilyOfficeTypeCode] CHAR(1) NULL
	, [vchShadosuiteDvpCode] CHAR(1) NULL
	, [vchVendorCode] VARCHAR(2) NULL
	, [vchChargebackTypeCode] CHAR(1) NULL
	, [vchCashMovementTypeCode] CHAR(1) NULL
	, [vchFuturesStatusCode] CHAR(1) NULL
	, [vchBrokerDealerSoldCode] CHAR(1) NULL
	, [vchFeeAuthorizationCode] CHAR(1) NULL
	, [vchMutualFundFeeRebateCode] CHAR(1) NULL
	, [vchSpecialAccountUsageCode] VARCHAR(5) NULL
	, [vchTradeAwayEligibleCode] CHAR(1) NULL
	, [vchCoverdellSpecialNeedsIndicator] CHAR(1) NULL
	, [vchMultipleMarginModelCode] CHAR(1) NULL
	, [vchMutualFundInvestmentIRAIndicator] CHAR(1) NULL
	, [vchTrustAccounting] CHAR(1) NULL
	, [vchTrustServiceProviderTLA] CHAR(1) NULL
	, [vchSpecialProductPapers] CHAR(1) NULL
	, [vchPortfolioMarginIndicator] CHAR(1) NULL
	, [vchMoneyMarketAccountDesignation] CHAR(1) NULL
	, [vchOasysAccessCode] VARCHAR(12) NULL
	, [vchOasysInstitution] VARCHAR(8) NULL
	, [vchMasterSecurityLendingAgreementIndicator] CHAR(1) NULL
	, [vchDVPSuppressionIndicator] CHAR(1) NULL
	, [vchMultiCurrencyAccount] CHAR(1) NULL
	, [vchFiduciaryApproachCode] VARCHAR(2) NULL
	, [vchFiduciaryApproachLastUpdateDate] VARCHAR(8) NULL
	, [ProductClass] VARCHAR(8) NULL
	, [PlatformSource] VARCHAR(8) NULL
	, [dtBirthDate] DATETIME NULL
	, [vchDateOfBirth] VARCHAR(10) NULL
	, [vchTaxIdNumber] VARCHAR(15) NULL
	, [ScrambleStatus_dtBirthDate] BIT NULL
	, [ScrambleStatus_vchDateOfBirth] BIT NULL
	, [ScrambleStatus_vchTaxIdNumber] BIT NULL
)
;
DROP TABLE IF EXISTS stub.vBeneficiary_Decode;
GO
CREATE TABLE stub.vBeneficiary_Decode
(
	  [vchAccountNumber] VARCHAR(50) NULL
	, [vchClientFirstName] VARCHAR(100) NULL
	, [vchClientLastName] VARCHAR(100) NULL
	, [dtChangeDate] DATETIME NULL
	, [vchApplicationIndic] VARCHAR(5) NULL
	, [vchBeneficiaryStatus] VARCHAR(5) NULL
	, [vchNumberofBenefs] TINYINT NULL
	, [vchRecordType] TINYINT NULL
	, [vchBenIndic] VARCHAR(5) NULL
	, [vchBenName] VARCHAR(50) NULL
	, [vchBenSSN] VARCHAR(10) NULL
	, [vchBenSpouseIndic] VARCHAR(1) NULL
	, [vchBenSharePercentage] VARCHAR(10) NULL
	, [vchBenDOB] DATETIME NULL
	, [vchBenAddress] VARCHAR(100) NULL
	, [vchBenCity] VARCHAR(50) NULL
	, [vchBenState] VARCHAR(2) NULL
	, [vchBenZipCode] VARCHAR(10) NULL
	, [vchRepID] VARCHAR(50) NULL
	, [iAcctClosed] TINYINT NULL
	, [vchBenIndic_decode] VARCHAR(10) NULL
	, [vchBenSpouseIndic_decode] VARCHAR(10) NULL
	, [vchApplicationIndic_decode] VARCHAR(29) NULL
	, [vchPerStirpes] VARCHAR(1) NOT NULL
)
;
DROP TABLE IF EXISTS stub.CLIENT;
GO
CREATE TABLE stub.CLIENT
(
	  [iClientID] INT NOT NULL IDENTITY(1,1) 
	, [vchBusinessTrustName] VARCHAR(80) NULL
	, [vchFirstName] VARCHAR(25) NULL
	, [vchMiddleName] VARCHAR(25) NULL
	, [vchLastName] VARCHAR(30) NULL
	, [vchPrefix] VARCHAR(12) NULL
	, [vchSuffix] VARCHAR(12) NULL
	, [vchSSNCode] VARCHAR(5) NULL
	, [vchNameType] VARCHAR(10) NULL
	, [vchHomePhone] VARCHAR(20) NULL
	, [vchWorkPhone] VARCHAR(20) NULL
	, [dtinserted] DATETIME NULL DEFAULT(getdate())
	, [dtupdated] DATETIME NULL DEFAULT(getdate())
	, [dtTransmissionDate] DATETIME NULL
	, [vchPlanID] VARCHAR(20) NULL
	, [iLockRecord] TINYINT NULL
	, [tiAffiliated] TINYINT NULL
	, [iNAFID] INT NOT NULL
	, [vchPrimaryIndicator] VARCHAR(1) NULL
	, [vchOccupation] VARCHAR(50) NULL
	, [vchNFSAccount] VARCHAR(10) NULL
	, [vchSearchName] VARCHAR(50) NULL
	, [vchRelationshipCode] VARCHAR(50) NULL
	, [vchWorkPhoneExt] VARCHAR(10) NULL
	, [CitzCountry] VARCHAR(10) NULL
	, [CitzLicNo] VARCHAR(30) NULL
	, [CitzPassport] VARCHAR(30) NULL
	, [CitzState] VARCHAR(5) NULL
	, [dtTrustDate] DATETIME NULL
	, [dtDateOfBirth] DATETIME NULL
	, [vchEmail] VARCHAR(50) NULL
	, [vchSSNumber] VARCHAR(15) NULL
	, [ScrambleStatus_dtDateOfBirth] BIT NULL
	, [ScrambleStatus_vchEmail] BIT NULL
	, [ScrambleStatus_vchSSNumber] BIT NULL
)
;
DROP TABLE IF EXISTS stub.NAFAutoLinkSSCodes;
GO
CREATE TABLE stub.NAFAutoLinkSSCodes
(
	  [iSSCodeID] INT NOT NULL IDENTITY(1,1) 
	, [vchCompanyCode] VARCHAR(20) NULL
	, [vchSSCode] VARCHAR(10) NULL
	, [vchSSCode2] VARCHAR(10) NULL
	, [vchDescription] VARCHAR(100) NULL
	, [vchreg1] VARCHAR(10) NULL
	, [vchreg2] VARCHAR(10) NULL
	, [vchSource] VARCHAR(5) NULL
	, [iExcludeFromROA] TINYINT NULL
)
;
DROP TABLE IF EXISTS stub.ClientAddress;
GO
CREATE TABLE stub.ClientAddress
(
	  [iClientAddID] INT NOT NULL IDENTITY(1,1) 
	, [iClientID] INT NOT NULL
	, [iNAFID] INT NOT NULL
	, [vchLegalAddress1] VARCHAR(40) NULL
	, [vchLegalAddress2] VARCHAR(40) NULL
	, [vchLegalAddress3] VARCHAR(40) NULL
	, [vchLegalCity] VARCHAR(30) NULL
	, [vchLegalState] VARCHAR(5) NULL
	, [vchLegalZip] VARCHAR(15) NULL
	, [vchLegalZipPlus4] VARCHAR(10) NULL
	, [vchLegalCountry] VARCHAR(20) NULL
	, [vchMailingAddress1] VARCHAR(40) NULL
	, [vchMailingAddress2] VARCHAR(40) NULL
	, [vchMailingAddress3] VARCHAR(40) NULL
	, [vchMailingCity] VARCHAR(30) NULL
	, [vchMailingState] VARCHAR(5) NULL
	, [vchMailingZip] VARCHAR(15) NULL
	, [vchMailingZipPlus4] VARCHAR(10) NULL
	, [vchMailingCountry] VARCHAR(5) NULL
	, [dtLastUpdate] DATETIME NULL DEFAULT(getdate())
	, [vchNFSAccount] VARCHAR(10) NULL
	, [vchLegalAttention] VARCHAR(40) NULL
	, [vchMailingAttention] VARCHAR(40) NULL
)
;
DROP TABLE IF EXISTS stub.EasyFillClients;
GO
CREATE TABLE stub.EasyFillClients
(
	  [iclientid] INT NOT NULL IDENTITY(1,1) 
	, [vchPrefix] VARCHAR(10) NULL
	, [vchFirstName] VARCHAR(50) NOT NULL
	, [vchMiddleName] VARCHAR(50) NULL
	, [vchLastName] VARCHAR(50) NOT NULL
	, [vchSuffix] VARCHAR(10) NULL
	, [vchAddress1] VARCHAR(50) NULL
	, [vchAddress2] VARCHAR(50) NULL
	, [vchCity] VARCHAR(50) NULL
	, [vchState] VARCHAR(50) NULL
	, [vchZip] VARCHAR(20) NULL
	, [vchHomePhone] VARCHAR(20) NULL
	, [vchWorkPhone] VARCHAR(25) NULL
	, [dtInsert] DATETIME NULL
	, [iobjid2site] INT NOT NULL
	, [vchCompanyName] VARCHAR(50) NULL
	, [vchBirthPlace] VARCHAR(50) NULL
	, [vchOccupation] VARCHAR(50) NULL
	, [vchEmpStatus] VARCHAR(50) NULL
	, [vchEmpAddress1] VARCHAR(50) NULL
	, [vchEmpAddress2] VARCHAR(50) NULL
	, [vchEmpCity] VARCHAR(50) NULL
	, [vchEmpState] VARCHAR(5) NULL
	, [vchEmpZip] VARCHAR(50) NULL
	, [vchIncomeSource] VARCHAR(50) NULL
	, [dtBirth] DATETIME NULL
	, [vchEmail] VARCHAR(50) NULL
	, [vchSSN] VARCHAR(20) NULL
	, [ScrambleStatus_dtBirth] BIT NULL
	, [ScrambleStatus_vchEmail] BIT NULL
	, [ScrambleStatus_vchSSN] BIT NULL
)
;
DROP TABLE IF EXISTS stub.Fidelity_Trades_PSR;
GO
CREATE TABLE stub.Fidelity_Trades_PSR
(
	  [TradeID] INT NOT NULL IDENTITY(1,1) 
	, [dtInsert] DATETIME NULL
	, [vchSymbol] VARCHAR(9) NULL
	, [vchCusip] VARCHAR(9) NULL
	, [vchSecType] VARCHAR(1) NULL
	, [vchSecDescription1] VARCHAR(20) NULL
	, [vchSecDescription2] VARCHAR(20) NULL
	, [vchSecDescription3] VARCHAR(20) NULL
	, [vchSecDescription4] VARCHAR(20) NULL
	, [vchSecDescription5] VARCHAR(20) NULL
	, [vchSecDescription6] VARCHAR(20) NULL
	, [vchBuySell] VARCHAR(1) NULL
	, [vchAccountType] VARCHAR(1) NULL
	, [vchAccountNumber] VARCHAR(9) NULL
	, [vchBroker] VARCHAR(8) NULL
	, [mPrice] NUMERIC NULL
	, [dTradeQuantity] NUMERIC NULL
	, [mCommission] NUMERIC NULL
	, [mPrincipal] NUMERIC NULL
	, [dtTradeDate] DATETIME NULL
	, [dtSettlementDate] DATETIME NULL
	, [mAccruedInterest] NUMERIC NULL
	, [mNet] NUMERIC NULL
	, [vchCancel] VARCHAR(1) NULL
	, [vchCorrect] VARCHAR(1) NULL
	, [vchFirstName] VARCHAR(12) NULL
	, [vchMiddleName] VARCHAR(10) NULL
	, [vchLastName] VARCHAR(25) NULL
)
;
DROP TABLE IF EXISTS stub.NAF;
GO
CREATE TABLE stub.NAF
(
	  [iNAFID] INT NOT NULL IDENTITY(1,1) 
	, [vchRegType] VARCHAR(10) NULL
	, [vchInvestObjective] VARCHAR(5) NULL
	, [vchAnnualIncome] VARCHAR(5) NULL
	, [vchEstNetWorth] VARCHAR(5) NULL
	, [vchEstLiquidNetWorth] VARCHAR(5) NULL
	, [vchTaxBracket] VARCHAR(2) NULL
	, [vchMaritalStatus] VARCHAR(2) NULL
	, [vchNumDependents] VARCHAR(3) NULL
	, [vchInvestKnowledge] VARCHAR(2) NULL
	, [dtApplication] DATETIME NULL
	, [vchPlanID] VARCHAR(10) NULL
	, [vchWorkPhone] VARCHAR(25) NULL
	, [vchHomePhone] VARCHAR(25) NULL
	, [vchMailingFlag] VARCHAR(1) NULL
	, [dtLastUpdate] DATETIME NULL DEFAULT(getdate())
	, [vchNFSAccount] VARCHAR(20) NULL
	, [dtLastMailing] DATETIME NULL
	, [vchAppStatus] VARCHAR(3) NULL DEFAULT('T')
	, [dtLastRAP] DATETIME NULL
	, [vchRapStatus] VARCHAR(3) NULL
	, [vchAcctReg1] VARCHAR(50) NULL
	, [vchAcctReg2] VARCHAR(50) NULL
	, [vchNAFAcctNum] VARCHAR(20) NULL
	, [iPPSContractid] INT NULL
	, [iUID] INT NULL
	, [Relationship] INT NULL
	, [RelatedTo] INT NULL
	, [Charitable] BIT NOT NULL DEFAULT((0))
	, [Title1Erisa] BIT NULL
	, [CorporationType] CHAR(1) NULL
	, [dtBirthDate] DATETIME NULL
	, [ScrambleStatus_dtBirthDate] BIT NULL
)
;
DROP TABLE IF EXISTS stub.nafaddress;
GO
CREATE TABLE stub.nafaddress
(
	  [iNAFAddID] INT NOT NULL IDENTITY(1,1) 
	, [iNAFID] INT NOT NULL
	, [vchLegalAddress1] VARCHAR(40) NULL
	, [vchLegalAddress2] VARCHAR(40) NULL
	, [vchLegalAddress3] VARCHAR(40) NULL
	, [vchLegalCity] VARCHAR(30) NULL
	, [vchLegalState] VARCHAR(5) NULL
	, [vchLegalZip] VARCHAR(15) NULL
	, [vchLegalZipPlus4] VARCHAR(10) NULL
	, [vchLegalCountry] VARCHAR(5) NULL
	, [vchMailingAddress1] VARCHAR(40) NULL
	, [vchMailingAddress2] VARCHAR(40) NULL
	, [vchMailingAddress3] VARCHAR(40) NULL
	, [vchMailingCity] VARCHAR(30) NULL
	, [vchMailingState] VARCHAR(5) NULL
	, [vchMailingZip] VARCHAR(15) NULL
	, [vchMailingZipPlus4] VARCHAR(10) NULL
	, [vchMailingCountry] VARCHAR(5) NULL
	, [dtLastUpdate] DATETIME NULL DEFAULT(getdate())
	, [vchNFSAccount] VARCHAR(10) NULL
)
;
DROP TABLE IF EXISTS stub.nfnameaddr_fbsi;
GO
CREATE TABLE stub.nfnameaddr_fbsi
(
	  [dtTransmissionDate] DATETIME NULL
	, [vchBranchId] VARCHAR(5) NULL
	, [vchAccountID] VARCHAR(10) NULL
	, [vchAccountNumber] VARCHAR(15) NULL
	, [vchRecordType] VARCHAR(3) NULL
	, [vchCallBackNo] VARCHAR(10) NULL
	, [vchCallBackName] VARCHAR(20) NULL
	, [vchTransFund] VARCHAR(3) NULL
	, [vchFFIndicator] VARCHAR(1) NULL
	, [vchTradingAuthCode] VARCHAR(1) NULL
	, [vchTradingAuthName] VARCHAR(32) NULL
	, [vchTradingAuthCode2] VARCHAR(1) NULL
	, [vchTradingAuthName2] VARCHAR(32) NULL
	, [vchTradingAuthCode3] VARCHAR(1) NULL
	, [vchTradingAuthName3] VARCHAR(32) NULL
	, [vchCallBackNo2] VARCHAR(10) NULL
	, [vchCallBackName2] VARCHAR(20) NULL
	, [vchABANumber] VARCHAR(9) NULL
	, [vchCustBankAcctNo] VARCHAR(17) NULL
	, [vchCustBankAcctType] VARCHAR(1) NULL
	, [vchFundSymbol] VARCHAR(9) NULL
	, [dtInsertUpdate] DATETIME NULL
	, [iAccountFBSIID] INT NOT NULL IDENTITY(1,1) 
	, [ImportExecutionID] BIGINT NULL
)
;
DROP TABLE IF EXISTS stub.nfs_ffr;
GO
CREATE TABLE stub.nfs_ffr
(
	  [dtTransmissionDate] DATETIME NULL
	, [vchBranchId] VARCHAR(5) NULL
	, [vchAccountID] VARCHAR(10) NULL
	, [vchAccountNumber] VARCHAR(20) NULL
	, [vchRecordType] VARCHAR(5) NULL
	, [dtTrustDate] DATETIME NULL
	, [vchMinorState] VARCHAR(3) NULL
	, [vchAddressType] VARCHAR(2) NULL
	, [vchAddressLine1] VARCHAR(32) NULL
	, [vchAddressLine2] VARCHAR(32) NULL
	, [vchAddressLine3] VARCHAR(32) NULL
	, [vchCity] VARCHAR(30) NULL
	, [vchRegionCode] VARCHAR(5) NULL
	, [vchPostCode] VARCHAR(15) NULL
	, [vchCountryCode] VARCHAR(5) NULL
	, [vchProvinceCode] VARCHAR(20) NULL
	, [vchNameCount] VARCHAR(5) NULL
	, [vchNameType] VARCHAR(2) NULL
	, [vchPrimaryIndic] VARCHAR(2) NULL
	, [vchBusinessTrustName] VARCHAR(80) NULL
	, [vchFirstName] VARCHAR(25) NULL
	, [vchMiddleName] VARCHAR(15) NULL
	, [vchLastName] VARCHAR(30) NULL
	, [vchSearchName] VARCHAR(50) NULL
	, [vchPrefix] VARCHAR(10) NULL
	, [vchSuffix] VARCHAR(12) NULL
	, [vchRelationshipCode] VARCHAR(5) NULL
	, [vchSSNCode] VARCHAR(2) NULL
	, [vchFFRXREF] VARCHAR(10) NULL
	, [dtInsertUpdate] DATETIME NULL
	, [iFFRID] INT NOT NULL IDENTITY(1,1) 
	, [vchFixedFormatTrustedContactStatusCode] CHAR(1) NULL
	, [vchRelationshipCodeFull] VARCHAR(5) NULL
	, [dtDateofBirth] DATETIME NULL
	, [vchSSNumber] VARCHAR(15) NULL
	, [ScrambleStatus_dtDateofBirth] BIT NULL
	, [ScrambleStatus_vchSSNumber] BIT NULL
)
;
DROP TABLE IF EXISTS stub.nfnameaddr_legl;
GO
CREATE TABLE stub.nfnameaddr_legl
(
	  [dtTransmissionCreationDate] DATETIME NULL
	, [vchBranch] VARCHAR(5) NULL
	, [vchAccountID] VARCHAR(10) NULL
	, [vchAccountNumber] VARCHAR(60) NULL
	, [vchRecordSegment] VARCHAR(3) NULL
	, [vchAddressType] VARCHAR(5) NULL
	, [vchMailTo] VARCHAR(35) NULL
	, [vchAddress1] VARCHAR(35) NULL
	, [vchAddress2] VARCHAR(35) NULL
	, [vchPOBox] VARCHAR(10) NULL
	, [vchCity] VARCHAR(50) NULL
	, [vchState] VARCHAR(5) NULL
	, [vchZipCode] VARCHAR(5) NULL
	, [vchExtendedZip] VARCHAR(5) NULL
	, [vchProvince] VARCHAR(30) NULL
	, [dtLastMaintDate] DATETIME NULL
	, [vchAddressFormat] VARCHAR(2) NULL
	, [vchCountryCode] VARCHAR(5) NULL
	, [vchCountry] VARCHAR(50) NULL
	, [vchIntPOCode] VARCHAR(10) NULL
	, [vchUpdateUser] VARCHAR(10) NULL
	, [vchUpdateTimeStamp] VARCHAR(30) NULL
	, [dtInsertUpdate] DATETIME NULL
	, [iLEGLID] INT NOT NULL IDENTITY(1,1) 
	, [ImportExecutionID] BIGINT NULL
	, [vchAutoAddressUpdateIndicator] CHAR(1) NULL
	, [vchSeasonalAddressTypeCode] VARCHAR(2) NULL
	, [vchSeasonalAddressStatusCode] CHAR(1) NULL
	, [vchSeasonalAddressStartDate] VARCHAR(8) NULL
	, [vchSeasonalAddressEndDate] VARCHAR(8) NULL
	, [vchSeasonAddressAutoAddressUpdateIndicator] CHAR(1) NULL
	, [vchSeasonAddressNCOAAddressUpdateIndicator] CHAR(1) NULL
	, [vchSeasonAddressFixedFormatAddressLine1] VARCHAR(32) NULL
	, [vchSeasonAddressFixedFormatAddressLine2] VARCHAR(32) NULL
	, [vchSeasonAddressFixedFormatAddressLine3] VARCHAR(32) NULL
	, [vchSeasonAddressForeignAddressCode] CHAR(1) NULL
	, [vchSeasonAddressFixedFormatCityName] VARCHAR(30) NULL
	, [vchSeasonAddressFixedFormatState] VARCHAR(2) NULL
	, [vchSeasonAddressFixedFormatPostalCode] VARCHAR(9) NULL
	, [vchSeasonAddressFixedFormatProvince] VARCHAR(15) NULL
	, [vchSeasonAddressStateCountryCode] VARCHAR(3) NULL
	, [vchSeasonAddressUpdateUser] VARCHAR(10) NULL
	, [vchSeasonAddressLastUpdateDate] VARCHAR(8) NULL
)
;
