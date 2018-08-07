USE [mSCOA_Vault]
GO

/** Object:  Table [dbo].[Lookup_Vault_Budget_2Segment_Combo]    Script Date: 2018/08/07 18:50:38 **/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Lookup_Vault_Budget_2Segment_Combo](
	[Current_ECC_Structure] [nvarchar](50) NULL,
	[New_GL] [nvarchar](50) NULL,
	[CC] [nvarchar](50) NULL,
	[Current_GL_No_] [nvarchar](50) NULL,
	[GL_Description] [nvarchar](50) NULL,
	[TB_TYPE] [nvarchar](50) NULL,
	[GRAP1_Cat] [nvarchar](50) NULL,
	[Short_Code] [nvarchar](50) NULL,
	[ITEM_GUID] [nvarchar](50) NULL,
	[GL] [nvarchar](50) NULL,
	[mSCOA_Account] [nvarchar](300) NULL,
	[Costing_Desc] [varchar](300) NULL,
	[Fund_Desc] [varchar](300) NULL,
	[Project_SC] [varchar](50) NULL,
	[Project_GUID] [varchar](50) NULL,
	[Project_Desc] [varchar](300) NULL,
	[Region_SC] [varchar](50) NULL,
	[Region_GUID] [varchar](50) NULL,
	[Region_Desc] [varchar](300) NULL,
	[Costing_SC] [varchar](50) NULL,
	[Costing_GUID] [varchar](50) NULL,
	[ECC_Structure_Desc] [varchar](200) NULL,
	[CC_Desc] [varchar](200) NULL,
	[Function_GUID] [varchar](50) NULL,
	[Function_Desc] [varchar](300) NULL,
	[Fund_SC] [varchar](50) NULL,
	[Fund_GUID] [varchar](50) NULL
) ON [PRIMARY]
GO

Alter Table [Lookup_Vault_Budget_2Segment_Combo]
Add Id_Lookup_Vault_Budget_2Segment_Combo Int Identity(1, 1)
Go



/****** Object:  Index [PK_Lookup_ISU_Vault]    Script Date: 2018/08/06 17:41:18 ******/
ALTER TABLE [dbo].[Lookup_Vault_Budget_2Segment_Combo] ADD  CONSTRAINT [PK_Lookup_Vault_Budget_2Segment_Combo] PRIMARY KEY CLUSTERED 
(
	[Id_Lookup_Vault_Budget_2Segment_Combo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

  --Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add ECC_Structure_Desc Varchar (200)
  -- Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add CC_Desc Varchar (200)
  --  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Function_GUID]  Varchar (50)
	 -- Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Function_Desc]  Varchar (300)
	 --     Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Fund_SC] Varchar (50)
		--  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Fund_GUID]  Varchar(50)
	 -- Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Fund_Desc]  Varchar(300)
	 --         Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Project_SC]  Varchar(50)
		--  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Project_GUID]  Varchar (50)
	 -- Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Project_Desc]  Varchar(300)
	 --     Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Region_SC] Varchar(50)
		--  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Region_GUID] Varchar(50)
	 -- Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Region_Desc] Varchar(300)
	 --     Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Costing_SC]Varchar (50)
		--  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Costing_GUID] Varchar(50)
	 -- Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Costing_Desc] Varchar(300)


	  Update dbo.Lookup_Vault

	  SET        dbo.Lookup_Vault.Short_Code = dbo.Lookup_Vault_Budget_2Segment_Combo.Short_Code 
	  , dbo.Lookup_Vault.G_L_Account =  dbo.Lookup_Vault_Budget_2Segment_Combo.New_GL
FROM            dbo.Lookup_Vault LEFT OUTER JOIN
                         dbo.Lookup_Vault_Budget_2Segment_Combo ON dbo.Lookup_Vault.mSCOA_GUID = dbo.Lookup_Vault_Budget_2Segment_Combo.ITEM_GUID

 Update dbo.Lookup_Vault_Budget_2Segment_Combo
SET        dbo.Lookup_Vault_Budget_2Segment_Combo.Project_SC = dbo.FACT_ORGB2019_OPEX.PROJECT
, dbo.Lookup_Vault_Budget_2Segment_Combo.Region_SC =  dbo.FACT_ORGB2019_OPEX.REGION
, dbo.Lookup_Vault_Budget_2Segment_Combo.Costing_SC =  dbo.FACT_ORGB2019_OPEX.COSTING
, dbo.Lookup_Vault_Budget_2Segment_Combo.Fund_SC =  dbo.FACT_ORGB2019_OPEX.FUND
FROM            dbo.Lookup_Vault_Budget_2Segment_Combo LEFT OUTER JOIN
                         dbo.FACT_ORGB2019_OPEX ON dbo.Lookup_Vault_Budget_2Segment_Combo.CC = dbo.FACT_ORGB2019_OPEX.MSC
						 
						  AND dbo.Lookup_Vault_Budget_2Segment_Combo.Short_Code = dbo.FACT_ORGB2019_OPEX.ITEM

 Update dbo.Lookup_Vault_Budget_2Segment_Combo
SET        dbo.Lookup_Vault_Budget_2Segment_Combo.ITEM_GUID = dbo.Lookup_Vault.mSCOA_GUID
, dbo.Lookup_Vault_Budget_2Segment_Combo.mSCOA_Account= dbo.Lookup_Vault.GUID_DESC
FROM            dbo.Lookup_Vault_Budget_2Segment_Combo LEFT OUTER JOIN
                         dbo.Lookup_Vault ON dbo.Lookup_Vault_Budget_2Segment_Combo.Short_Code = dbo.Lookup_Vault.Short_Code

Update dbo.Lookup_Vault_Budget_2Segment_Combo
SET      dbo.Lookup_Vault_Budget_2Segment_Combo.Project_GUID=  dbo.Lookup_Vault.mSCOA_GUID
, dbo.Lookup_Vault_Budget_2Segment_Combo.Project_Desc= dbo.Lookup_Vault.GUID_DESC
FROM            dbo.Lookup_Vault_Budget_2Segment_Combo LEFT OUTER JOIN
                         dbo.Lookup_Vault ON dbo.Lookup_Vault_Budget_2Segment_Combo.Project_SC = dbo.Lookup_Vault.Short_Code


Update dbo.Lookup_Vault_Budget_2Segment_Combo
SET         dbo.Lookup_Vault_Budget_2Segment_Combo.Region_GUID = dbo.Lookup_Vault.mSCOA_GUID
, dbo.Lookup_Vault_Budget_2Segment_Combo.Region_Desc=  dbo.Lookup_Vault.GUID_DESC
FROM            dbo.Lookup_Vault_Budget_2Segment_Combo LEFT OUTER JOIN
                         dbo.Lookup_Vault ON dbo.Lookup_Vault_Budget_2Segment_Combo.Region_SC = dbo.Lookup_Vault.Short_Code


Update dbo.Lookup_Vault_Budget_2Segment_Combo
SET         dbo.Lookup_Vault_Budget_2Segment_Combo.Fund_GUID= dbo.Lookup_Vault.mSCOA_GUID
, dbo.Lookup_Vault_Budget_2Segment_Combo.Fund_Desc = dbo.Lookup_Vault.GUID_DESC
FROM            dbo.Lookup_Vault_Budget_2Segment_Combo LEFT OUTER JOIN
                         dbo.Lookup_Vault ON dbo.Lookup_Vault_Budget_2Segment_Combo.Fund_SC = dbo.Lookup_Vault.Short_Code
