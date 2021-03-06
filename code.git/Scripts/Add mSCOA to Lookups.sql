/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [G_L_acct]
      ,[Short_Text]
  FROM [mSCOA_Vault].[dbo].[Lookup_FI_GL]
  

 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add  [GUID] Varchar (36)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add  [GUID_Description] Varchar (210)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add [Project_Guid] Varchar (36)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add [Project_Description] Varchar (210)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add [Function_Guid] Varchar (36)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add [Function_Description] Varchar (210)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add [Fund_Guid] Varchar (36)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add[Fund_Description] Varchar (210)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add[Recommended_Invoice_Guid] Varchar (36)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add[Recommended_Invoice_Description] Varchar (210)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add[Recommended_Receipt_Guid] Varchar (36)
 Alter table [mSCOA_Vault].[dbo].[Lookup_FI_GL] add[Recommended_Receipt_Description] Varchar (210)