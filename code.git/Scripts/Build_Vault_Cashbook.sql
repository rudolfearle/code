use mSCOA_Vault

Go

SELECT 
      [RACCT]
      ,[DOCTY]
INTO [dbo].[Lookup_Vault_Cashbook]
  FROM [mSCOA_Vault].[dbo].[Load_SPL_2018_12_1]

  where RACCT like '113%'

   Group by  [RACCT]

      ,[DOCTY]

	  order by   [RACCT]
	  ,[DOCTY]

	  Go

  Alter table [dbo].[Lookup_Vault_Cashbook] add [Short_Text] Varchar (200)
  Alter table [dbo].[Lookup_Vault_Cashbook] add [GUID] varchar (36)
  Alter table [dbo].[Lookup_Vault_Cashbook] add [GUID_Description] varchar (260)
  Alter table [dbo].[Lookup_Vault_Cashbook] add [PARENT_GUID] varchar (36)
  Alter table [dbo].[Lookup_Vault_Cashbook] add [PARENT_GUID_Description] varchar (260)