USE [mSCOA_Vault]
GO

/****** Object:  Table [dbo].[Lookup_ISU_Vault]    Script Date: 2018/08/04 08:37:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Lookup_ISU_Vault](
	[RATE_CAT] [varchar](50) NULL,
	[DESC] [varchar](50) NULL,
	[Division] [varchar](2) NULL,
	[Name] [varchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[MainCode] [nvarchar](50) NULL,
	[Mains] [nvarchar](50) NULL,
	[SubCode] [nvarchar](50) NULL,
	[Sub] [nvarchar](50) NULL,
	[Doc_Type] [nvarchar](50) NULL,
	[Div__FiCa] [nvarchar](50) NULL,
	[FiCa_Mains] [nvarchar](50) NULL,
	[Subs_FiCa] [nvarchar](50) NULL,
	[DbtCnt_GL] [int] NULL,
	[Revenue_GL] [int] NULL,
	[SAP_Code] [varchar](16) NULL,
	[SAP_Description] [varchar](210) NULL,
	[Non_Fin_Group_Code] [nvarchar](10) NULL,
	[Non_Fin_Group_Description] [varchar](210) NULL,
	[Non_Fin_Sub_Group_Code] [nvarchar](10) NULL,
	[Non_Fin_Sub_Group_Description] [varchar](210) NULL,
	[Project_Guid] [varchar](36) NULL,
	[Project_Description] [varchar](210) NULL,
	[Function_Guid] [nvarchar](36) NULL,
	[Function_Description] [varchar](210) NULL,
	[Fund_Guid] [nvarchar](36) NULL,
	[Fund_Description] [varchar](210) NULL,
	[Region_Guid] [nvarchar](36) NULL,
	[Region_Description] [varchar](210) NULL,
	[Costing_Guid] [nvarchar](36) NULL,
	[Costing_Description] [varchar](210) NULL,
	[Recommended_Invoice_Guid] [nvarchar](36) NULL,
	[Recommended_Invoice_Description] [varchar](210) NULL,
	[Recommended_Receipt_Guid] [nvarchar](36) NULL,
	[Recommended_Receipt_Description] [varchar](210) NULL
) ON [PRIMARY]
GO


