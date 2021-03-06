USE [mSCOA_Vault]


--Drop Table [dbo].[String_Load_Staging]
--- manual load from Submitted string file 
/*[dbo].[String_Load_Staging](
	--[column1] [varchar](4) NOT NULL,
	--[column2] [varchar](4) NOT NULL,
	--[column3] [varchar](3) NOT NULL,
	--[column4] [varchar](42) NOT NULL,
	--[column5] [varchar](36) NOT NULL,
	--[column6] [varchar](36) NOT NULL,
	--[column7] [varchar](36) NOT NULL,
	--[column8] [varchar](36) NOT NULL,
	--[column9] [varchar](36) NOT NULL,
	--[column10] [numeric](18,0) NOT NULL
	if reject look for '||' in text file
	*/

Delete [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
--FROM            dbo.String_Load_Staging INNER JOIN
--                         dbo.Z_FinReporting_DB ON dbo.String_Load_Staging.column1 = dbo.Z_FinReporting_DB.Municipality AND dbo.String_Load_Staging.column2 = dbo.Z_FinReporting_DB.FinYR_End AND 
--                         dbo.String_Load_Staging.column3 = dbo.Z_FinReporting_DB.Period


	insert into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
	 ([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])


SELECT  [column1] as [Municipality]
      ,[column2] as [FinYR_End]
      ,[column3] as [Period]
      ,[column4] as [Project]
      ,[column5] as [Function]
      ,[column6] as [Item]
      ,[column7] as [Fund]
      ,[column8] as [Costing]
      ,[column9] as [Region]
      ,[column10] as [Amount]

	 
FROM [mSCOA_Vault].[dbo].[String_Load_Staging]




---- Sanity Tests
Drop Table [mSCOA_Vault].[dbo].[Z_Sanity_DB]


SELECT    dbo.Z_FinReporting_DB.Municipality
, dbo.Z_FinReporting_DB.FinYR_End
, dbo.Z_FinReporting_DB.[Period]
, dbo.Z_FinReporting_DB.Project
, dbo.Cons_Vault.[Account_Number_LongCode] as Project_LongCode
, dbo.Cons_Vault.Account_Name as Project_Name
, dbo.Z_FinReporting_DB.Item
 , dbo.Cons_Vault.[Account_Number_LongCode] as Item_LongCode
, dbo.Cons_Vault.Account_Name as Item_Name
 , dbo.Z_FinReporting_DB.[Function]
 , dbo.Cons_Vault.[Account_Number_LongCode] as Function_LongCode
, dbo.Cons_Vault.Account_Name as Function_Name
, dbo.Z_FinReporting_DB.Fund
 , dbo.Cons_Vault.[Account_Number_LongCode]  as Fund_LongCode
, dbo.Cons_Vault.Account_Name as Fund_Name
, dbo.Z_FinReporting_DB.Costing
 , dbo.Cons_Vault.[Account_Number_LongCode] as  Cost_LongCode
, dbo.Cons_Vault.Account_Name As Cost_Name
, dbo.Z_FinReporting_DB.Region
 , dbo.Cons_Vault.[Account_Number_LongCode]  as Region_LongCode
, dbo.Cons_Vault.Account_Name as Region_Name
, dbo.Z_FinReporting_DB.Amount

Into Z_Sanity_DB

FROM   dbo.Z_FinReporting_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_FinReporting_DB.Project = dbo.Cons_Vault.GUID

Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Project_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Project_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.Project = dbo.Cons_Vault.GUID

						 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Item_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Item_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.Item = dbo.Cons_Vault.GUID

						 					 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Function_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Function_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.[Function] = dbo.Cons_Vault.GUID


						 						 					 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Function_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Function_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.[Function] = dbo.Cons_Vault.GUID

						 					 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Fund_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Fund_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.[Fund] = dbo.Cons_Vault.GUID


						 
						 					 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Cost_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Cost_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.[Costing] = dbo.Cons_Vault.GUID


						 
						 					 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Region_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Region_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.[Region] = dbo.Cons_Vault.GUID

--- Investment Monitoring
SELECT 
      [MunCode]
      ,[YearEnd]
      ,[Period]
      ,[InvestmentNo]
      ,[MunRefNo]
      ,[StartDate]
      ,[PlannedEndDate]
      ,[InvestmentTerm]
      ,[TermValue]
      ,[CommissionPaid]
      ,[CommisionRecipient]
      ,[CapitalGuarantee]
      ,[Commited]
      ,[InvestmentType]
      ,[InvestmentGroup]
      ,[Investmentinstitution]
      ,[TypeOfInterest]
      ,[TimingOfInterestPayment]
      ,[InterestRatePerAnnum]
      ,[MSCOA_Interest]
      ,[InterestThisQrt]
      ,[MSCOA_BeginBalance]
      ,[BalanceBeginOfQrt]
      ,[MSCOA_Withdrawal]
      ,[WithdrawalThisQrt]
      ,[MSCOA_TopUp]
      ,[TopUpThisQrt]
      ,[MSCOA_EndBalance]
      ,[BalanceCreatedEndOfQrt]

	  into [mSCOA_Vault].[dbo].[NTString_IM]
  FROM [mSCOA_Vault].[dbo].[NT_Investments]