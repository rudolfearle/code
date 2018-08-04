use mSCOA_Vault
Go


truncate table dbo.NT_TSH_FINANCIALS


insert into dbo.NT_TSH_FINANCIALS (
dbo.NT_TSH_FINANCIALS.MSC_Code
, dbo.NT_TSH_FINANCIALS.GL_Code
, dbo.NT_TSH_FINANCIALS.GL_ITEM_Desc
, dbo.NT_TSH_FINANCIALS.[mSCOA_SCode_Item]
, dbo.NT_TSH_FINANCIALS.ORGB
, dbo.NT_TSH_FINANCIALS.ITY1
, dbo.NT_TSH_FINANCIALS.ITY2)

SELECT  dbo.COT_Budget_Load.CC
, dbo.COT_Budget_Load.Current_GL_No_
, dbo.COT_Budget_Load.[GL_Description]
, dbo.COT_Budget_Load.ITEM_DEBIT_Short_Code
, Sum(dbo.COT_Budget_Load.Final_Budget_2018_19) As [1]
, Sum(dbo.COT_Budget_Load.Final_Budget__2019_20) As [2]
, Sum(dbo.COT_Budget_Load.Final_Budget__2020_21) as [3]
FROM            dbo.COT_Budget_Load 

Group by dbo.COT_Budget_Load.CC
, dbo.COT_Budget_Load.Current_GL_No_
, dbo.COT_Budget_Load.[GL_Description]
, dbo.COT_Budget_Load.ITEM_DEBIT_Short_Code

Alter table  dbo.NT_TSH_FINANCIALS alter Column mSCOA_SCode_Project Varchar (16)

update  dbo.NT_TSH_FINANCIALS
SET dbo.NT_TSH_FINANCIALS.mSCOA_SCode_Project = dbo.COT_BPC.Project
, dbo.NT_TSH_FINANCIALS.mSCOA_SCode_Function =  dbo.COT_BPC.[Function]
, dbo.NT_TSH_FINANCIALS.mSCOA_SCode_Item = dbo.COT_BPC.Item
, dbo.NT_TSH_FINANCIALS.mSCOA_SCode_Fund = dbo.COT_BPC.Fund
, dbo.NT_TSH_FINANCIALS.mSCOA_SCode_Region = dbo.COT_BPC.Region
FROM            dbo.NT_TSH_FINANCIALS LEFT OUTER JOIN
                         dbo.COT_BPC ON dbo.NT_TSH_FINANCIALS.MSC_Code = dbo.COT_BPC.MSC AND dbo.NT_TSH_FINANCIALS.mSCOA_SCode_Item = dbo.COT_BPC.Item


						 


update dbo.NT_TSH_FINANCIALS
SET  dbo.NT_TSH_FINANCIALS.[mSCOA_Project_Guid]= dbo.[Cons_Vault]. GUID
,[mSCOA_LCode_Project] = dbo.[Cons_Vault].[Account_Number_LongCode]
,[mSCOA_Project] = dbo.[Cons_Vault].[Account_Name]
From   dbo.NT_TSH_FINANCIALS LEFT outer JOIN
                         dbo.Cons_Vault ON dbo.NT_TSH_FINANCIALS.mSCOA_Project_Guid = dbo.Cons_Vault.GUID

update dbo.NT_TSH_FINANCIALS
SET     dbo.NT_TSH_FINANCIALS.[mSCOA_Function_Guid]= dbo.[Cons_Vault]. GUID
,[mSCOA_LCode_Function] = dbo.[Cons_Vault].[Account_Number_LongCode]
,[mSCOA_Function] = dbo.[Cons_Vault].[Account_Name]
From   dbo.NT_TSH_FINANCIALS LEFT outer JOIN
                         dbo.Cons_Vault ON dbo.NT_TSH_FINANCIALS.[mSCOA_Function_Guid] = dbo.Cons_Vault.GUID									

update dbo.NT_TSH_FINANCIALS
SET     dbo.NT_TSH_FINANCIALS.[mSCOA_Fund_Guid]= dbo.[Cons_Vault]. GUID
,[mSCOA_LCode_Fund] = dbo.[Cons_Vault].[Account_Number_LongCode]
,[mSCOA_Fund] = dbo.[Cons_Vault].[Account_Name]
From   dbo.NT_TSH_FINANCIALS LEFT outer JOIN
                         dbo.Cons_Vault ON dbo.NT_TSH_FINANCIALS.mSCOA_Fund_Guid = dbo.Cons_Vault.GUID									


update dbo.NT_TSH_FINANCIALS
SET    dbo.NT_TSH_FINANCIALS.[mSCOA_Item_Guid]= dbo.[Cons_Vault]. GUID
,[mSCOA_LCode_Item] = dbo.[Cons_Vault].[Account_Number_LongCode]
,[mSCOA_Item] =  dbo.[Cons_Vault].[Account_Name]
From   dbo.NT_TSH_FINANCIALS LEFT outer JOIN
                         dbo.Cons_Vault ON dbo.NT_TSH_FINANCIALS.mSCOA_Item_Guid = dbo.Cons_Vault.GUID
						 


update dbo.NT_TSH_FINANCIALS
SET    dbo.NT_TSH_FINANCIALS.[mSCOA_Region_Guid] = dbo.[Cons_Vault].GUID
,[mSCOA_LCode_Region] = dbo.[Cons_Vault].[Account_Number_LongCode]
,[mSCOA_Region] = dbo.[Cons_Vault].[Account_Name]
From   dbo.NT_TSH_FINANCIALS LEFT outer JOIN
                         dbo.Cons_Vault ON dbo.NT_TSH_FINANCIALS.mSCOA_Region_Guid = dbo.Cons_Vault.GUID




update dbo.NT_TSH_FINANCIALS
SET   dbo.NT_TSH_FINANCIALS.[mSCOA_Costing_Guid] = '47c7ba65-c270-4a7f-91ba-3842eb629ddf'
,[mSCOA_LCode_Costing] = 'CO001000000000000000000000000000000000'
,[mSCOA_Costing] = 'Default'


Drop Table T1

SELECT       SUM(dbo.COT_M11.Amount) AS Amount,[Function] , [Item]
Into T1
FROM           dbo.COT_M11 
GROUP BY [Function], [Item]


Delete from T1 where Amount is null
