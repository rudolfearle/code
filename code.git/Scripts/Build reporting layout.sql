USE [mSCOA_Vault]
GO

/****** Object:  Table [dbo].[Reporting_Fin]    Script Date: 2018/07/19 10:25:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reporting](
	
	[FINYEAR] [varchar](4) NULL,
	[AFS_Type] [nvarchar](4) NULL,
	[FinPos/FinPerf] [varchar](7) NULL,
	[AFS_Group] [nvarchar](4) NULL,
	[Current/Non-Current] [varchar](12) NULL,
	[Ledger_Group_Code] [nvarchar](4) NULL,
	[Ledger_Group_Description] [varchar](210) NULL,
	[Old Account] [varchar](50) NULL,
	[MSC_Code] [varchar](10) NULL,
	[Municipal_Vote] [varchar](210) NULL,
	[Dir_Code] [varchar](10) NULL,
	[Directorate] [varchar](210) NULL,
	[Dept_Code] [varchar](10) NULL,
	[Department] [varchar](210) NULL,
	[GL_Code] [varchar](50) NULL,
	[GL_ITEM_Desc] [varchar](210) NULL,
	[AssetType] [varchar](100) NULL,
	[AquisitionType] [varchar](100) NULL,
	[WIP] [varchar](1) NULL,
	[IDP_Link_ID] [int] NULL,
	[IUDF_Code] [nvarchar](4) NULL,
	[IUDF_description] [varchar](210) NULL,
	[MTSF_Code] [nvarchar](4) NULL,
	[MTSF_description] [varchar](210) NULL,
	[Devision_Code] [nvarchar](10) NULL,
	[Devision_Decription] [varchar](210) NULL,
	[ADID_Code] [nvarchar](10) NULL,
	[ADID_Description] [varchar](210) NULL,
	[Mains_Code] [nvarchar](10) NULL,
	[Mains_Decription] [varchar](210) NULL,
	[Subs_Code] [nvarchar](10) NULL,
	[Subs_Decription] [varchar](210) NULL,
	[Transaction_Code] [nvarchar](10) NULL,
	[Transaction_Decription] [varchar](210) NULL,
	[Non_Fin_NTCode] [nvarchar](10) NULL,
	[Non_Fin_NTCode_Description] [varchar](210) NULL,
	[Non_Fin_Sub_Custgrpcde] [nvarchar](10) NULL,
	[Non_Fin_Sub_Custgrpcde_Description] [varchar](210) NULL,
	[mSCOA_SCode_Project] [varchar](16) NULL,
	[mSCOA_SCode_Function] [varchar](10) NULL,
	[mSCOA_SCode_Item] [varchar](10) NULL,
	[mSCOA_SCode_Fund] [varchar](10) NULL,
	[mSCOA_SCode_Costing] [varchar](10) NULL,
	[mSCOA_SCode_Region] [varchar](10) NULL,
	[mSCOA_LCode_Project] [varchar](38) NULL,
	[mSCOA_LCode_Function] [varchar](38) NULL,
	[mSCOA_LCode_Item] [varchar](38) NULL,
	[mSCOA_LCode_Fund] [varchar](38) NULL,
	[mSCOA_LCode_Costing] [varchar](38) NULL,
	[mSCOA_LCode_Region] [varchar](38) NULL,
	[mSCOA_Project] [varchar](210) NULL,
	[mSCOA_Function] [varchar](210) NULL,
	[mSCOA_Item] [varchar](210) NULL,
	[mSCOA_Fund] [varchar](210) NULL,
	[mSCOA_Costing] [varchar](210) NULL,
	[mSCOA_Region] [varchar](210) NULL,
	[mSCOA_Project_Guid] [varchar](36) NULL,
	[mSCOA_Function_Guid] [varchar](36) NULL,
	[mSCOA_Item_Guid] [varchar](36) NULL,
	[mSCOA_Fund_Guid] [varchar](36) NULL,
	[mSCOA_Costing_Guid] [varchar](36) NULL,
	[mSCOA_Region_Guid] [varchar](36) NULL,
	[Schedule_Sheet] [varchar](80) NULL,
	[Schedule_Code] [nvarchar](4) NULL,
	[Code_description] [varchar](210) NULL,
	[Sub_Schedule_Sheet] [varchar](80) NULL,
	[Sub_Schedule_Code] [nvarchar](4) NULL,
	[Sub_Code_description] [varchar](210) NULL,
	[Entity_Schedule_Sheet] [varchar](80) NULL,
	[Entity_Schedule_Code] [nvarchar](4) NULL,
	[Entity_Code_description] [varchar](210) NULL,
	[Entity_Sub_Schedule_Sheet] [varchar](80) NULL,
	[Entity_Sub_Schedule_Code] [nvarchar](4) NULL,
	[Entity_Sub__Code_description] [varchar](210) NULL,
	[Section_71_Report] [nvarchar](4) NULL,
	[Section_71_Code] [nvarchar](4) NULL,
	[Section_71_Desc] [varchar](80) NULL,
	[Cashflow_Alt_Code] [nvarchar](4) NULL,
	[Cash_Alt_Flow_Description] [varchar](210) NULL,
	[Audit Outcome_3] [money] NULL,
	[Audit Outcome_2] [money] NULL,
	[Audit Outcome_1] [money] NULL,
	[Pre Audit Outcome] [money] NULL,
	[YTD] [money] NULL,
	[Full Year Forecast] [money] NULL,
	[ADJB] [money] NULL,
	[TABB] [money] NULL,
	[ORGB] [money] NULL,
	[ITY1] [money] NULL,
	[ITY2] [money] NULL,
	[M01] [money] NULL,
	[M02] [money] NULL,
	[M03] [money] NULL,
	[M04] [money] NULL,
	[M05] [money] NULL,
	[M06] [money] NULL,
	[M07] [money] NULL,
	[M08] [money] NULL,
	[M09] [money] NULL,
	[M10] [money] NULL,
	[M11] [money] NULL,
	[M12] [money] NULL,
	[Budget_Q1] [money] NULL,
	[Budget_Q2] [money] NULL,
	[Budget_Q3] [money] NULL,
	[Budget_Q4] [money] NULL,
	[Actual_Q1] [money] NULL,
	[Actual_Q2] [money] NULL,
	[Actual_Q3] [money] NULL,
	[Actual_Q4] [money] NULL,
	[Budget_Half_Year] [money] NULL,
	[Actual_Half_Year] [money] NULL,
	[FINYR] [varchar](4) NULL,
	[PM01] [money] NULL,
	[PM02] [money] NULL,
	[PM03] [money] NULL,
	[PM04] [money] NULL,
	[PM05] [money] NULL,
	[PM06] [money] NULL,
	[PM07] [money] NULL,
	[PM08] [money] NULL,
	[PM09] [money] NULL,
	[PM10] [money] NULL,
	[PM11] [money] NULL,
	[PM12] [money] NULL,
	[AM1] [money] NULL,
	[AM2] [money] NULL,
	[AM3] [money] NULL,
	[AM4] [money] NULL,
	[AM5] [money] NULL,
	[AM6] [money] NULL,
	[AM7] [money] NULL,
	[AM8] [money] NULL,
	[AM9] [money] NULL,
	[AM10] [money] NULL,
	[AM11] [money] NULL,
	[AM12] [money] NULL,
	[TM1] [money] NULL,
	[TM2] [money] NULL,
	[TM3] [money] NULL,
	[TM4] [money] NULL,
	[TM5] [money] NULL,
	[TM6] [money] NULL,
	[TM7] [money] NULL,
	[TM8] [money] NULL,
	[TM9] [money] NULL,
	[TM10] [money] NULL,
	[TM11] [money] NULL,
	[TM12] [money] NULL
) ON [PRIMARY]
GO


