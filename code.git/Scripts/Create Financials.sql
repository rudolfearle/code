USE [mSCOA_Vault]
GO

Drop table [mSCOA_Vault].[dbo].[NT_TSH_FINANCIALS]


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [mSCOA_Vault].[dbo].[NT_TSH_FINANCIALS](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	--- Standard Account
	[FINYEAR] [varchar](4) NULL,
	[TBClass] [varchar](20) NULL,
	[Old Account] [varchar](50) NULL,
	[MSC_Code] [varchar](10) NULL,
	[Municipal_Vote] [varchar](210) NULL,
	[Dir_Code] [varchar](10) NULL,
	[Directorate] [varchar](210) NULL,
	[Dept_Code] [varchar](10) NULL,
	[Department] [varchar](210) NULL,
	[GL_Code] [varchar](50) NULL,
	[GL_ITEM_Desc] [varchar](210) NULL,
		
	---Assets ---- Link
	[AssetType] [varchar](100) NULL,
	[AquisitionType] [varchar](100) NULL,
	[WIP] [varchar](1) NULL,
	
	----IDP---- Link
	[IDP_Link_ID] [int] NULL,
	[IUDF_Code] [nvarchar](4) NULL,
	[IUDF_description] [varchar](210) NULL,
	[MTSF_Code] [nvarchar](4) NULL,
	[MTSF_description] [varchar](210) NULL,

	---- ISU ---- Link
	[Devision_Code] [nvarchar](10) NULL,
	[Devision_Description] [varchar](210) NULL,
	[Determination_Code] [nvarchar](10) NULL,
	[Determination_Description] [varchar](210) NULL,
	[Transaction_Code] [nvarchar](10) NULL,
	[Transaction_Decription] [varchar](210) NULL,


	----  mSCOA Atributes---
	[mSCOA_SCode_Project] [varchar](10) NULL,
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
	--- MBRR -- A Schedules -- Parent MUNI -- Reporting Atributes
	--- Main ---
	[Schedule_Sheet] [varchar](20) NULL,
	[Schedule_Code] [nvarchar](4) NULL,
	[Schedule_Code_description] [varchar](210) NULL,
	---  Support Schedule -- A --
	[A_SSchedule_Sheet] [varchar](20) NULL,
	[A_SSchedule_Code] [nvarchar](4) NULL,
	[A_SSchedule_Code_description] [varchar](210) NULL,

	---  Support Schedule -- C --
	[C_SSchedule_Sheet] [varchar](20) NULL,
	[C_SSchedule_Code] [nvarchar](4) NULL,
	[C_SSchedule_Code_description] [varchar](210) NULL,

--- Entities ---

-- D Schedules --
	[D_Schedule_Sheet] [varchar](20) NULL,
	[D_Schedule_Code] [nvarchar](4) NULL,
	[D_Schedule_Code_description] [varchar](210) NULL,
	---  Support Schedule --D--
	[D_SSchedule_Sheet] [varchar](20) NULL,
	[D_SSchedule_Code] [nvarchar](4) NULL,
	[D_SSchedule_Code_description] [varchar](210) NULL,

	---  Support Schedule -- E --
	[E_SSchedule_Sheet] [varchar](20) NULL,
	[E_SSchedule_Code] [nvarchar](4) NULL,
	[E_SSchedule_Code_description] [varchar](210) NULL,

	--- Section71 ---
	[Section_71_Report] [nvarchar](4) NULL,
	[Section_71_Code] [nvarchar](4) NULL,
	[Section_71_Desc] [varchar](80) NULL,

	--- AFS---


	----Financials-----
	[Audit Outcome_3] [money] NULL,
	[Audit Outcome_2] [money] NULL,
	[Audit Outcome_1] [money] NULL,
	[Pre Audit Outcome] [money] NULL,
	[YTD] [money] NULL,
	[Full Year Forecast][money] NULL,
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
	[PM1] [money] NULL,
	[PM2] [money] NULL,
	[PM3] [money] NULL,
	[PM4] [money] NULL,
	[PM5] [money] NULL,
	[PM6] [money] NULL,
	[PM7] [money] NULL,
	[PM8] [money] NULL,
	[PM9] [money] NULL,
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
