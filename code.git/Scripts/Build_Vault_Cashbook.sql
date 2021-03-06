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
						 
Alter Table [Lookup_Vault_Cashbook]
Add Id_Lookup_Vault_Cashbook Int Identity(1, 1)
Go



/****** Object:  Index [PK_Lookup_ISU_Vault]    Script Date: 2018/08/06 17:41:18 ******/
ALTER TABLE [dbo].[Lookup_Vault_Cashbook] ADD  CONSTRAINT [PK_Lookup_Vault_Cashbook] PRIMARY KEY CLUSTERED 
(
	[Id_Lookup_Vault_Cashbook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO