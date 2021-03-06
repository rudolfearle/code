/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [CC]
      ,[Current_GL_No_]
      ,[ITEM_DEBIT_Short_Code]
      ,[Scoa_Desc]
      ,[Final_Budget_2018_19]
      ,[Final_Budget__2019_20]
      ,[Final_Budget__2020_21]
  FROM [mSCOA_Vault].[dbo].[COT_Budget_Load]

  --Alter Table  [mSCOA_Vault].[dbo].[COT_Budget_Load] add [Project] Varchar(42)
  --Alter Table  [mSCOA_Vault].[dbo].[COT_Budget_Load] add [Function] Varchar(36)
  --Alter Table  [mSCOA_Vault].[dbo].[COT_Budget_Load] add [Item] Varchar(36)
  --Alter Table  [mSCOA_Vault].[dbo].[COT_Budget_Load] add [Fund] Varchar(36)
  --Alter Table  [mSCOA_Vault].[dbo].[COT_Budget_Load] add [Costing] Varchar(36)
  --Alter Table  [mSCOA_Vault].[dbo].[COT_Budget_Load] add [Region] Varchar(36)

Alter table  [dbo].[COT_BPC] alter column  [M01] Money
Alter table  [dbo].[COT_BPC] alter column  [M02] Money
Alter table  [dbo].[COT_BPC] alter column   [M03] Money
Alter table  [dbo].[COT_BPC] alter column   [M04] Money
Alter table  [dbo].[COT_BPC] alter column  [M05] Money
Alter table  [dbo].[COT_BPC] alter column  [M06] Money
Alter table  [dbo].[COT_BPC] alter column  [M07] Money
Alter table  [dbo].[COT_BPC] alter column  [M08] Money
Alter table  [dbo].[COT_BPC] alter column  [M09] Money
Alter table  [dbo].[COT_BPC] alter column  [M10] Money
Alter table  [dbo].[COT_BPC] alter column  [M11] Money
Alter table  [dbo].[COT_BPC] alter column  [M12] Money
Alter table  [dbo].[COT_BPC] alter column  [Budget]Money
Alter table  [dbo].[COT_BPC] alter column  [Budget_1]Money
Alter table  [dbo].[COT_BPC] alter column  [Budget_2]Money
Alter table  [dbo].[COT_Budget_Load] alter column  [Final_Budget_2018_19] Money
Alter table  [dbo].[COT_Budget_Load] alter column  [Final_Budget__2019_20]Money
Alter table  [dbo].[COT_Budget_Load] alter column  [Final_Budget__2020_21]Money

 Update dbo.COT_Budget_Load
 SET [CC] = Replace([CC],'MSC','')

  Update dbo.COT_Budget_Load
  SET        dbo.COT_Budget_Load.[Function] = dbo.COT_ORGB2019.[Function] 
FROM            dbo.COT_Budget_Load LEFT OUTER JOIN
                         dbo.COT_ORGB2019 ON dbo.COT_Budget_Load.CC = dbo.COT_ORGB2019.MSC

Update dbo.COT_Budget_Load
 SET [Final_Budget_2018_19] = Round([Final_Budget_2018_19], 0)
 ,[Final_Budget__2019_20] = Round([Final_Budget__2019_20],0)
 ,[Final_Budget__2020_21]= Round([Final_Budget__2020_21],0)

 Update [dbo].[COT_BPC]
 SET  [Budget]= Round([Budget], 0)
 ,[Budget_2] = Round([Budget_2],0)
 ,[Budget_1]= Round([Budget_1],0)




  Select  [CC]
      , [Current_GL_No_]
      ,[ITEM_DEBIT_Short_Code]
      ,[Scoa_Desc]
      ,Sum([Final_Budget_2018_19]) as Amount
	   FROM [mSCOA_Vault].[dbo].[COT_Budget_Load]
	  Group By  [CC]
      ,[Current_GL_No_]
      ,[ITEM_DEBIT_Short_Code]
      ,[Scoa_Desc]

	  Order by Item_debit_Short_Code