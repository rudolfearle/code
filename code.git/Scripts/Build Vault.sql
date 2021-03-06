---- Build the mSCOA Vault from various sources imported manually,  it is important to note the comlumn layout 



USE [mSCOA_Vault]
GO

drop table [dbo].[Cons_Vault]

/****** Object:  Table [dbo].[Cons_Vault]    Script Date: 2018/07/18 08:16:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cons_Vault](
	[mSCOA_Table] [varchar](20) NULL,
	[Account_Number_LongCode] [varchar](38) NULL,
	[GUID] [varchar](36) NULL,
	[PARENT_GUID] [varchar](36) NULL,
	[Version_First_Active] [varchar](12) NULL,
	[Change_Effect] [varchar](38) NULL,
	[Has_Children] [varchar](4) NULL,
	[Posting_Allowed] [varchar](4) NULL,
	[Breakdown_Allowed] [varchar](4) NULL,
	[Level_Name] [varchar](110) NULL,
	[Account_Name] [varchar](350) NULL,
	[Definitions] [varchar](1980) NULL,
	[VAT_Status] [varchar](13) NULL,
	[Principle] [varchar](200) NULL,
	[Applicability] [varchar](32) NULL,
	[LGDB_Import_Level] [varchar](1) NULL,
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
	[AFS_Type] [nvarchar](4) NULL,
	[FinPos/FinPerf] [varchar](210) NULL,
	[AFS_Group] [nvarchar](4) NULL,
	[Current/Non-Current] [varchar](210) NULL,
	[Ledger_Group_Code] [nvarchar](4) NULL,
	[Ledger_Group_Description] [varchar](210) NULL,
	[SAP_Code] [varchar](16) NULL,
	[SAP_Description] [varchar](210) NULL,
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
	[Non_Fin_Group_Code] [nvarchar](10) NULL,
	[Non_Fin_Group_Description] [varchar](210) NULL,
	[Non_Fin_Sub_Group_Code] [nvarchar](10) NULL,
	[Non_Fin_Sub_Group_Description] [varchar](210) NULL,
	[IUDF_Code] [nvarchar](4) NULL,
	[IUDF_description] [varchar](210) NULL,
	[MTSF_Code] [nvarchar](4) NULL,
	[MTSF_description] [varchar](210) NULL,
	[Project_Guid] [varchar](36) NULL,
	[Project_Description] [varchar](210) NULL,
	[Function_Guid] [nvarchar](36) NULL,
	[Function_Description] [varchar](210) NULL,
	[Fund_Guid] [nvarchar](36) NULL,
	[Fund_Description] [varchar](210) NULL,
	[Recommended_Invoice_Guid] [nvarchar](36) NULL,
	[Recommended_Invoice_Description] [varchar](210) NULL,
	[Recommended_Receipt_Guid] [nvarchar](36) NULL,
	[Recommended_Receipt_Description] [varchar](210) NULL
) ON [PRIMARY]
GO


Insert Into  [mSCOA_Vault].[dbo].[Cons_Vault]

( [mSCOA_Table]
,[GUID]
,[PARENT_GUID]
,[Account_Number_LongCode]
,[Account_Name]
,[Posting_Allowed]
,[Breakdown_Allowed]
,[Definitions]
,[VAT_Status]
,[Principle]
,[Applicability]
)
 
 
SELECT 
[SCOAFile]
,[SCOAId]
,[ParentSCOAId]
,[AccountNumber]
,[SCOAAccount]
,[PostingLevel]
,[BreakDownAllowed]
,[DefinitionDescription]
,[VATStatus]
,[Principle]
,[ApplicableTo]

	  
FROM [mSCOA_Vault].[dbo].[SCOA_6.2_20180206]

/*
--- Update NT LG Vendor access mapping table

update dbo.Cons_Vault

SET        dbo.Cons_Vault.Account_Number_LongCode =  dbo.[NT_Published_ Extended_Config].Account_Number__Long_Code__
, dbo.Cons_Vault.PARENT_GUID = dbo.[NT_Published_ Extended_Config].PARENT_GUID 
, dbo.Cons_Vault.Version_First_Active =  dbo.[NT_Published_ Extended_Config].Version_First_Active
, dbo.Cons_Vault.Change_Effect = dbo.[NT_Published_ Extended_Config].Change_Effect
, dbo.Cons_Vault.Has_Children = dbo.[NT_Published_ Extended_Config].Has__Children
, dbo.Cons_Vault.Posting_Allowed = dbo.[NT_Published_ Extended_Config].Posting__Allowed
, dbo.Cons_Vault.Breakdown_Allowed = dbo.[NT_Published_ Extended_Config].Breakdown_Allowed
, dbo.Cons_Vault.Level_Name =  dbo.[NT_Published_ Extended_Config].Level_Name 
, dbo.Cons_Vault.Account_Name = dbo.[NT_Published_ Extended_Config].Account_Name
, dbo.Cons_Vault.A_Schedule_Sheet = dbo.[NT_Published_ Extended_Config].A_Schedule_Capture_Lvl
, dbo.Cons_Vault.A_Schedule_Code =  dbo.[NT_Published_ Extended_Config].A_Schedule_Code 
, dbo.Cons_Vault.A_Schedule_Code_description = dbo.[NT_Published_ Extended_Config].A_Schedule_Code_description
, dbo.Cons_Vault.AFS_Code = dbo.[NT_Published_ Extended_Config].AFS_Code 
, dbo.Cons_Vault.AFS_description = dbo.[NT_Published_ Extended_Config].AFS_description 
, dbo.Cons_Vault.Cashflow_Code = dbo.[NT_Published_ Extended_Config].Cashflow_Code 
, dbo.Cons_Vault.Cash_Flow_Description = dbo.[NT_Published_ Extended_Config].Cash_Flow_Description 
, dbo.Cons_Vault.IUDF_Code = dbo.[NT_Published_ Extended_Config].IUDF_Code 
, dbo.Cons_Vault.IUDF_description =  dbo.[NT_Published_ Extended_Config].IUDF_description 
, dbo.Cons_Vault.MTSF_Code = dbo.[NT_Published_ Extended_Config].MTSF_Code 
, dbo.Cons_Vault.MTSF_description = dbo.[NT_Published_ Extended_Config].MTSF_description 
, dbo.Cons_Vault.Section_71_Code = dbo.[NT_Published_ Extended_Config].BS_Code
, dbo.Cons_Vault.Section_71_Desc = dbo.[NT_Published_ Extended_Config].Bs_Desc

FROM            dbo.Cons_Vault LEFT OUTER JOIN
                         dbo.[NT_Published_ Extended_Config] ON dbo.Cons_Vault.GUID = dbo.[NT_Published_ Extended_Config].GUID


update dbo.Cons_Vault
 Set dbo.Cons_Vault.Section_71_Code = dbo.[NT_Published_ Extended_Config].[OS_Item_Code]
, dbo.Cons_Vault.Section_71_Desc = dbo.[NT_Published_ Extended_Config].[OS_Item_Description]
FROM            dbo.Cons_Vault LEFT OUTER JOIN
                         dbo.[NT_Published_ Extended_Config] ON dbo.Cons_Vault.GUID = dbo.[NT_Published_ Extended_Config].GUID
Where dbo.Cons_Vault.Section_71_Desc  is null


update dbo.Cons_Vault
 Set        dbo.Cons_Vault.Account_Number_LongCode =  dbo.TX.Account_Number__Long_Code_
 , dbo.Cons_Vault.PARENT_GUID = dbo.TX.ParentGUID
 , dbo.Cons_Vault.Change_Effect =  dbo.TX.[6_2_Status]
 , dbo.Cons_Vault.Has_Children =  dbo.TX.[6_2_Has__Children]
 , dbo.Cons_Vault.Posting_Allowed = dbo.TX.[6_2_Posting_Allowed]
 , dbo.Cons_Vault.Breakdown_Allowed = dbo.TX.[6_2_Breakdown_Allowed]
 , dbo.Cons_Vault.Level_Name =dbo.TX.Level_Name 
 , dbo.Cons_Vault.Account_Name = dbo.TX.Account_Name 
 , dbo.Cons_Vault.Section_71_Report = dbo.TX.Section_71_Report
 , dbo.Cons_Vault.Section_71_Code = dbo.TX.Section_71_Code 
 , dbo.Cons_Vault.Section_71_Desc = dbo.TX.Section_71_Desc 
FROM            dbo.Cons_Vault INNER JOIN
                         dbo.TX ON dbo.Cons_Vault.GUID = dbo.TX.GUID



Update dbo.Cons_Vault
SET       [SAP_Code_CoT] = dbo.[COT_6.2_Shortcode].Short_Code
FROM            dbo.Cons_Vault INNER JOIN
                         dbo.[COT_6.2_Shortcode] ON dbo.Cons_Vault.GUID = dbo.[COT_6.2_Shortcode].mSCOA_GUID



update dbo.Cons_Vault
 Set  dbo.Cons_Vault.Section_71_Report = 'OS'
Where [mSCOA_Table] in ('IE','IR','IZ')
			

update dbo.Cons_Vault
 Set  dbo.Cons_Vault.Section_71_Report = 'BS'
Where [mSCOA_Table] in ('IL','IA','NA')
										
	---- Normalise budget spaces in short code								
update [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
  set [Project] = REPLACE(LTRIM(RTRIM([Project])), ' ', '')  
      ,[Function] = REPLACE(LTRIM(RTRIM([Function])), ' ', '')  
      ,[Region] = REPLACE(LTRIM(RTRIM([Region])), ' ', '')  
      ,[Item] = REPLACE(LTRIM(RTRIM([Item])), ' ', '')  
      ,[Costing] = REPLACE(LTRIM(RTRIM([Costing])), ' ', '')  
      ,[Fund] = REPLACE(LTRIM(RTRIM([Fund])), ' ', '')  
	
	
	SELECT [SERIAL_NUMBER] as  [Project]
      ,[Function]
      ,[Fund]
      ,[Item]
	  ,[Costing]
	  ,[Region]
      ,[M01]
      ,[M02]
      ,[M03]
      ,[M04]
      ,[M05]
      ,[M06]
      ,[M07]
      ,[M08]
      ,[M09]
      ,[M10]
      ,[M11]
      ,[M12]
      ,[Budget_Year_2018_19]
      ,[Budget_Year__1_2019_20]
      ,[Budget_Year__2_2020_21]
   into  [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
  FROM [mSCOA_Vault].[dbo].[COT_ORGB2019]
	
---- Adding the 6.2 guids
update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Function]= dbo.[COT_6.2].mSCOA_GUID
FROM            dbo.[COT_6.2] INNER JOIN
                         dbo.COT_ORGB2019_GUID ON dbo.[COT_6.2].Short_Code = dbo.COT_ORGB2019_GUID.[Function]										

update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Fund]= dbo.[COT_6.2].mSCOA_GUID
FROM            dbo.[COT_6.2] INNER JOIN
                         dbo.COT_ORGB2019_GUID ON dbo.[COT_6.2].Short_Code = dbo.COT_ORGB2019_GUID.[Fund]										


update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Item]= dbo.[COT_6.2].mSCOA_GUID
FROM            dbo.[COT_6.2] INNER JOIN
                         dbo.COT_ORGB2019_GUID ON dbo.[COT_6.2].Short_Code = dbo.COT_ORGB2019_GUID.[Item]
						 


update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Region]= dbo.[COT_6.2].mSCOA_GUID
FROM            dbo.[COT_6.2] INNER JOIN
                         dbo.COT_ORGB2019_GUID ON dbo.[COT_6.2].Short_Code = dbo.COT_ORGB2019_GUID.[Region]




update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Costing]= '47c7ba65-c270-4a7f-91ba-3842eb629ddf'

---Project Guid Given By CoT
--update [mSCOA_Vault].[dbo].[CoT_Budget_Extended]
--SET         dbo.CoT_Budget_Extended.Project_Guid = dbo.[COT_6.2_Shortcode].mSCOA_GUID
--FROM            dbo.CoT_Budget_Extended LEFT OUTER JOIN
--                         dbo.[COT_6.2_Shortcode] ON dbo.CoT_Budget_Extended.ShortCode_Project = dbo.[COT_6.2_Shortcode].Short_Code


--- Normalise Money columns



--Update [mSCOA_Vault].[dbo].[CoT_Budget_Extended]

--set [IBY]  = Convert (Money,[IBY]) 


update [mSCOA_Vault].[dbo].[COT_ORGB2019]
  set Budget_Year__2_2020_21 = REPLACE(LTRIM(RTRIM(Budget_Year__2_2020_21)), ')', '')

  

update [mSCOA_Vault].[dbo].[COT_ORGB2019]
  set Budget_Year__2_2020_21 = REPLACE(LTRIM(RTRIM(Budget_Year__2_2020_21)), '(', '-')



update [mSCOA_Vault].[dbo].[COT_ORGB2019]
  set Budget_Year__2_2020_21 = REPLACE(LTRIM(RTRIM(Budget_Year__2_2020_21)), ' ', '')

 
 

Alter table [mSCOA_Vault].[dbo].[COT_ORGB2019] alter column Budget_Year__2_2020_21 Numeric(18,0)

Alter table [mSCOA_Vault].[dbo].[COT_ORGB2019] alter column M10 Numeric(18,0)



--update [mSCOA_Vault].[dbo].[COT_ORGB2019]
--  set [IBY1] = REPLACE(LTRIM(RTRIM([IBY1])), ')', '')

  

--update [mSCOA_Vault].[dbo].[CoT_Budget_Extended]
--  set [IBY1] = REPLACE(LTRIM(RTRIM([IBY1])), '(', '-')



--update [mSCOA_Vault].[dbo].[CoT_Budget_Extended]
--  set [IBY1] = REPLACE(LTRIM(RTRIM([IBY1])), ' ', '')

 
 
--Update [mSCOA_Vault].[dbo].[CoT_Budget_Extended]

--set [IBY1]  = Convert (Money,[IBY1]) 



--update [mSCOA_Vault].[dbo].[CoT_Budget_Extended]
--  set [IBY2] = REPLACE(LTRIM(RTRIM([IBY2])), ')', '')

  

--update [mSCOA_Vault].[dbo].[CoT_Budget_Extended]
--  set [IBY2] = REPLACE(LTRIM(RTRIM([IBY2])), '(', '-')



update [mSCOA_Vault].[dbo].[CoT_Budget_Extended]
  set [IBY2] = REPLACE(LTRIM(RTRIM([IBY2])), ' ', '')


 
Update [mSCOA_Vault].[dbo].[CoT_Budget_Extended]

set [IBY2]  = Convert (Money,[IBY2]) 




Update dbo.Cons_Vault

SET   dbo.Cons_Vault.Account_Name = dbo.[SCOA_6.2_20180206].SCOAAccount

--,[Version_First_Active]   = '6.2_20180206'
--,  dbo.Cons_Vault.PARENT_GUID = dbo.[SCOA_6.2_20180206].ParentSCOAId
--, dbo.Cons_Vault.Definitions= dbo.[SCOA_6.2_20180206].DefinitionDescription
--, dbo.Cons_Vault.Level_Name = dbo.[SCOA_6.2_20180206].ShortDescription
-- , dbo.Cons_Vault.Breakdown_Allowed =  dbo.[SCOA_6.2_20180206].BreakDownAllowed
--  , dbo.Cons_Vault.Posting_Allowed = dbo.[SCOA_6.2_20180206].PostingLevel

FROM            dbo.Cons_Vault INNER JOIN
                         dbo.[SCOA_6.2_20180206] ON dbo.Cons_Vault.GUID = dbo.[SCOA_6.2_20180206].SCOAId



Update dbo.Cons_Vault

SET   [Version_First_Active]   = '6.1-20161103'
,  dbo.Cons_Vault.PARENT_GUID = dbo.[SCOA_6.1_20161103].ParentSCOAId
, dbo.Cons_Vault.Definitions= dbo.[SCOA_6.1_20161103].DefinitionDescription
--, dbo.Cons_Vault.Account_Number_LongCode = dbo.[SCOA_6.1_20161103].SCOAAccount
, dbo.Cons_Vault.Level_Name = dbo.[SCOA_6.1_20161103].ShortDescription
FROM            dbo.Cons_Vault INNER JOIN
                         dbo.[SCOA_6.1_20161103] ON dbo.Cons_Vault.GUID = dbo.[SCOA_6.1_20161103].SCOAId

--- Load the MBRR Main Schedules


Update dbo.Cons_Vault

SET        dbo.Cons_Vault.A_Schedule_Sheet = 'A2A Standard Classification (Budget)'
, dbo.Cons_Vault.A_Schedule_Code = dbo.[A2A Standard Classification].A_Schedule_Code
, dbo.Cons_Vault.A_Schedule_Code_description = dbo.[A2A Standard Classification].A_schedule_Code_description 
, dbo.Cons_Vault.B_Schedule_Sheet = 'B2B Standard Classification (Adjustment Budget)'
, dbo.Cons_Vault.B_Schedule_Code = dbo.[A2A Standard Classification].A_Schedule_Code
, dbo.Cons_Vault.B_Schedule_Code_description = dbo.[A2A Standard Classification].A_schedule_Code_description
, dbo.Cons_Vault.C_Schedule_Sheet = 'C2C Standard Classification (Monthly Actuals)'
, dbo.Cons_Vault.C_Schedule_Code = dbo.[A2A Standard Classification].A_Schedule_Code
, dbo.Cons_Vault.C_Schedule_Code_description = dbo.[A2A Standard Classification].A_schedule_Code_description

FROM            dbo.Cons_Vault INNER JOIN
                         dbo.[A2A Standard Classification] ON dbo.Cons_Vault.GUID = dbo.[A2A Standard Classification].GUID

   
     



Update dbo.Cons_Vault

SET        dbo.Cons_Vault.A_Schedule_Sheet = 'A4 Statement of Financial Performance'
, dbo.Cons_Vault.A_Schedule_Code = dbo.[A4 Statement of Financial Performance].A_Schedule_Code
, dbo.Cons_Vault.A_Schedule_Code_description =  dbo.[A4 Statement of Financial Performance].A_schedule_Code_description
, dbo.Cons_Vault.B_Schedule_Sheet = 'B4 Statement of Financial Performance'
, dbo.Cons_Vault.B_Schedule_Code =  dbo.[A4 Statement of Financial Performance].A_Schedule_Code
, dbo.Cons_Vault.B_Schedule_Code_description =  dbo.[A4 Statement of Financial Performance].A_schedule_Code_description
, dbo.Cons_Vault.C_Schedule_Sheet = 'C4 Statement of Financial Performance'
, dbo.Cons_Vault.C_Schedule_Code = dbo.[A4 Statement of Financial Performance].A_Schedule_Code
, dbo.Cons_Vault.C_Schedule_Code_description =  dbo.[A4 Statement of Financial Performance].A_schedule_Code_description
, dbo.Cons_Vault.D_Schedule_Sheet = 'D2 Statement of Financial Performance'
, dbo.Cons_Vault.D_Schedule_Code = dbo.[A4 Statement of Financial Performance].A_Schedule_Code
, dbo.Cons_Vault.D_Schedule_Code_description =  dbo.[A4 Statement of Financial Performance].A_schedule_Code_description
, dbo.Cons_Vault.E_Schedule_Sheet =  'E2 Statement of Financial Performance'
, dbo.Cons_Vault.E_Schedule_Code = dbo.[A4 Statement of Financial Performance].A_Schedule_Code
, dbo.Cons_Vault.E_Schedule_Code_description =  dbo.[A4 Statement of Financial Performance].A_schedule_Code_description
, dbo.Cons_Vault.F_Schedule_Sheet = 'F2 Statement of Financial Performance'
,dbo.Cons_Vault.F_Schedule_Code = dbo.[A4 Statement of Financial Performance].A_Schedule_Code
, dbo.Cons_Vault.F_Schedule_Code_description =  dbo.[A4 Statement of Financial Performance].A_schedule_Code_description
  From   dbo.Cons_Vault INNER JOIN
                         dbo.[A4 Statement of Financial Performance] ON dbo.Cons_Vault.GUID = dbo.[A4 Statement of Financial Performance].GUID



Update dbo.Cons_Vault

SET        dbo.Cons_Vault.A_Schedule_Sheet = 'A5 Capital_Fund'
, dbo.Cons_Vault.A_Schedule_Code = dbo.[A5 Capital_Fund].A_Schedule_Code
, dbo.Cons_Vault.A_Schedule_Code_description =  dbo.[A5 Capital_Fund].A_schedule_Code_description
, dbo.Cons_Vault.B_Schedule_Sheet = 'B5 Capital_Fund'
, dbo.Cons_Vault.B_Schedule_Code = dbo.[A5 Capital_Fund].A_Schedule_Code
, dbo.Cons_Vault.B_Schedule_Code_description = dbo.[A5 Capital_Fund].A_schedule_Code_description
, dbo.Cons_Vault.C_Schedule_Sheet = 'C5 Capital_Fund'
, dbo.Cons_Vault.C_Schedule_Code = dbo.[A5 Capital_Fund].A_Schedule_Code
, dbo.Cons_Vault.C_Schedule_Code_description =  dbo.[A5 Capital_Fund].A_schedule_Code_description
, dbo.Cons_Vault.D_Schedule_Sheet = 'D3 Capital_Fund'
, dbo.Cons_Vault.D_Schedule_Code = dbo.[A5 Capital_Fund].A_Schedule_Code
, dbo.Cons_Vault.D_Schedule_Code_description =  dbo.[A5 Capital_Fund].A_schedule_Code_description
, dbo.Cons_Vault.E_Schedule_Sheet =  'E3 Capital_Fund'
, dbo.Cons_Vault.E_Schedule_Code = dbo.[A5 Capital_Fund].A_Schedule_Code
, dbo.Cons_Vault.E_Schedule_Code_description =  dbo.[A5 Capital_Fund].A_schedule_Code_description
, dbo.Cons_Vault.F_Schedule_Sheet = 'F3 Capital_Fund'
,dbo.Cons_Vault.F_Schedule_Code = dbo.[A5 Capital_Fund].A_Schedule_Code
, dbo.Cons_Vault.F_Schedule_Code_description =  dbo.[A5 Capital_Fund].A_schedule_Code_description
 FROM            dbo.Cons_Vault INNER JOIN
                         dbo.[A5 Capital_Fund] ON dbo.Cons_Vault.GUID = dbo.[A5 Capital_Fund].GUID




Update dbo.Cons_Vault

SET        dbo.Cons_Vault.A_Schedule_Sheet = 'A6 Statement of Financial Position'
, dbo.Cons_Vault.A_Schedule_Code = dbo.[A6 Statement of Financial Position].A_Schedule_Code
, dbo.Cons_Vault.A_Schedule_Code_description =  dbo.[A6 Statement of Financial Position].A_schedule_Code_description
, dbo.Cons_Vault.B_Schedule_Sheet = 'B6 Statement of Financial Position'
, dbo.Cons_Vault.B_Schedule_Code = dbo.[A6 Statement of Financial Position].A_Schedule_Code
, dbo.Cons_Vault.B_Schedule_Code_description = dbo.[A6 Statement of Financial Position].A_schedule_Code_description
, dbo.Cons_Vault.C_Schedule_Sheet = 'C6 Statement of Financial Position'
, dbo.Cons_Vault.C_Schedule_Code = dbo.[A6 Statement of Financial Position].A_Schedule_Code
, dbo.Cons_Vault.C_Schedule_Code_description =  dbo.[A6 Statement of Financial Position].A_schedule_Code_description
, dbo.Cons_Vault.D_Schedule_Sheet = 'D4 Statement of Financial Position'
, dbo.Cons_Vault.D_Schedule_Code = dbo.[A6 Statement of Financial Position].A_Schedule_Code
, dbo.Cons_Vault.D_Schedule_Code_description =  dbo.[A6 Statement of Financial Position].A_schedule_Code_description
, dbo.Cons_Vault.E_Schedule_Sheet =  'E4 Statement of Financial Position'
, dbo.Cons_Vault.E_Schedule_Code = dbo.[A6 Statement of Financial Position].A_Schedule_Code
, dbo.Cons_Vault.E_Schedule_Code_description =  dbo.[A6 Statement of Financial Position].A_schedule_Code_description
, dbo.Cons_Vault.F_Schedule_Sheet = 'F4 Statement of Financial Position'
,dbo.Cons_Vault.F_Schedule_Code = dbo.[A6 Statement of Financial Position].A_Schedule_Code
, dbo.Cons_Vault.F_Schedule_Code_description =  dbo.[A6 Statement of Financial Position].A_schedule_Code_description
FROM            dbo.Cons_Vault INNER JOIN
                         dbo.[A6 Statement of Financial Position] ON dbo.Cons_Vault.GUID = dbo.[A6 Statement of Financial Position].GUID



Update dbo.Cons_Vault

SET        dbo.Cons_Vault.A_Schedule_Sheet = 'A7 Cash Flow'
, dbo.Cons_Vault.A_Schedule_Code = dbo.[A7 Cash Flow].A_Schedule_Code
, dbo.Cons_Vault.A_Schedule_Code_description =  dbo.[A7 Cash Flow].A_schedule_Code_description
, dbo.Cons_Vault.B_Schedule_Sheet = 'B7 Cash Flow'
, dbo.Cons_Vault.B_Schedule_Code = dbo.[A7 Cash Flow].A_Schedule_Code
, dbo.Cons_Vault.B_Schedule_Code_description = dbo.[A7 Cash Flow].A_schedule_Code_description
, dbo.Cons_Vault.C_Schedule_Sheet = 'C7 Cash Flow'
, dbo.Cons_Vault.C_Schedule_Code = dbo.[A7 Cash Flow].A_Schedule_Code
, dbo.Cons_Vault.C_Schedule_Code_description =  dbo.[A7 Cash Flow].A_schedule_Code_description
, dbo.Cons_Vault.D_Schedule_Sheet = 'D5 Cash Flow'
, dbo.Cons_Vault.D_Schedule_Code = dbo.[A7 Cash Flow].A_Schedule_Code
, dbo.Cons_Vault.D_Schedule_Code_description =  dbo.[A7 Cash Flow].A_schedule_Code_description
, dbo.Cons_Vault.E_Schedule_Sheet =  'E5 Cash Flow'
, dbo.Cons_Vault.E_Schedule_Code = dbo.[A7 Cash Flow].A_Schedule_Code
, dbo.Cons_Vault.E_Schedule_Code_description =  dbo.[A7 Cash Flow].A_schedule_Code_description
, dbo.Cons_Vault.F_Schedule_Sheet = 'F5 Cash Flow'
,dbo.Cons_Vault.F_Schedule_Code = dbo.[A7 Cash Flow].A_Schedule_Code
, dbo.Cons_Vault.F_Schedule_Code_description =  dbo.[A7 Cash Flow].A_schedule_Code_description
 FROM            dbo.Cons_Vault INNER JOIN
                         dbo.[A7 Cash Flow] ON dbo.Cons_Vault.GUID = dbo.[A7 Cash Flow].GUID

		*/				 