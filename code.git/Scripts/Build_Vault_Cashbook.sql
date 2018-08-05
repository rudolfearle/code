use mSCOA_Vault

Go
Drop Table [dbo].[Lookup_Vault_Cashbook]
go

SELECT 
      [RACCT]
      ,[DOCTY],[DRCRK]
INTO [dbo].[Lookup_Vault_Cashbook]
  FROM [mSCOA_Vault].[dbo].[Load_SPL]

  where RACCT like '113%'

   Group by  [RACCT]
         ,[DOCTY],[DRCRK]

	  order by   [RACCT]
	  ,[DOCTY],[DRCRK]

	  Go


  Alter table [dbo].[Lookup_Vault_Cashbook] Add RACCT_DESC Varchar (100)
  Alter table [dbo].[Lookup_Vault_Cashbook] add [Short_Text] Varchar (200)
  Alter table [dbo].[Lookup_Vault_Cashbook] add [GUID] varchar (36)
  Alter table [dbo].[Lookup_Vault_Cashbook] add [GUID_Description] varchar (260)
  Alter table [dbo].[Lookup_Vault_Cashbook] add [PARENT_GUID] varchar (36)
  Alter table [dbo].[Lookup_Vault_Cashbook] add [PARENT_GUID_Description] varchar (260)
  GO
  

Update   dbo.Lookup_Vault_Cashbook

  SET        dbo.Lookup_Vault_Cashbook.Short_Text = dbo.Lookup_FI_Document_type.[Description]
FROM            dbo.Lookup_Vault_Cashbook LEFT OUTER JOIN
                         dbo.Lookup_FI_Document_type ON dbo.Lookup_Vault_Cashbook.DOCTY = dbo.Lookup_FI_Document_type.Doc__Type

--Alter table dbo.Lookup_Vault_Cashbook Add RACCT_DESC Varchar (100)

Update   dbo.Lookup_Vault_Cashbook

SET        dbo.Lookup_Vault_Cashbook.RACCT_DESC = dbo.Lookup_FI_GL.Short_Text 
FROM            dbo.Lookup_Vault_Cashbook INNER JOIN
                         dbo.Lookup_FI_GL ON dbo.Lookup_Vault_Cashbook.RACCT =dbo.Lookup_FI_GL.G_L_acct

Update   dbo.Lookup_Vault_Cashbook

SET        dbo.Lookup_Vault_Cashbook.DRCRK = 'CR'  
FROM            dbo.Lookup_Vault_Cashbook INNER JOIN
                         dbo.Lookup_FI_GL ON dbo.Lookup_Vault_Cashbook.RACCT =dbo.Lookup_FI_GL.G_L_acct

						 where dbo.Lookup_Vault_Cashbook.DRCRK = 'H'


Update   dbo.Lookup_Vault_Cashbook

SET        dbo.Lookup_Vault_Cashbook.DRCRK = 'DR'  
FROM            dbo.Lookup_Vault_Cashbook INNER JOIN
                         dbo.Lookup_FI_GL ON dbo.Lookup_Vault_Cashbook.RACCT =dbo.Lookup_FI_GL.G_L_acct
						 where dbo.Lookup_Vault_Cashbook.DRCRK = 'S'