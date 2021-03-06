Use mSCOA_Vault
GO

 Update [mSCOA_Vault].[dbo].[FACT_ORGB2019_OPEX]
	  set [Budget_Year_2018_19] = 0


	  where [Budget_Year_2018_19] Like  ' -   '

Update  [dbo].[Lookup_Vault]
SET GUID_DESC = dbo.Cons_Vault.Account_Name
FROM            dbo.Cons_Vault RIGHT OUTER JOIN
                         dbo.Lookup_Vault ON dbo.Cons_Vault.GUID = dbo.Lookup_Vault.mSCOA_GUID


Update  [dbo].[Lookup_Vault]
SET dbo.Lookup_Vault.Short_Code_DESC = dbo.Lookup_FI_GL.Short_Text
FROM            dbo.Lookup_Vault INNER JOIN
                         dbo.Lookup_FI_GL ON dbo.Lookup_Vault.G_L_Account = dbo.Lookup_FI_GL.G_L_acct



Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_OPEX] alter column [Budget_Year_2018_19] Float
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_OPEX] alter column [ITEM] varchar (10)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_OPEX] alter column  [PROJECT] varchar (16)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_OPEX] alter column [COSTING] varchar (12)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_OPEX] alter column [FUNCTION] varchar (10)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_OPEX] alter column [FUND] varchar (10)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_OPEX] alter column [REGION] varchar (10)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_OPEX] alter column [MSC] varchar (10)

Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_CAPEX] alter column [Budget_Year_2018_19] Float
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_CAPEX] alter column [ITEM] varchar (10)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_CAPEX] alter column  [PROJECT] varchar (18)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_CAPEX] alter column [COSTING] varchar (14)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_CAPEX] alter column [FUNCTION] varchar (14)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_CAPEX] alter column [FUND] varchar (14)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_CAPEX] alter column [REGION] varchar (14)
Alter table [mSCOA_Vault].[dbo].[FACT_ORGB2019_CAPEX] alter column [MSC] varchar (14)

Alter table [mSCOA_Vault].[dbo].[Stageing_SPL] alter column[mSCOA_SCode_Project]varchar (22)
Alter table [mSCOA_Vault].[dbo].[Stageing_SPL] alter column[mSCOA_SCode_Function]varchar (14)
Alter table [mSCOA_Vault].[dbo].[Stageing_SPL] alter column[mSCOA_SCode_Item]varchar (14)
Alter table [mSCOA_Vault].[dbo].[Stageing_SPL] alter column[mSCOA_SCode_Fund]varchar (14)
Alter table [mSCOA_Vault].[dbo].[Stageing_SPL] alter column[mSCOA_SCode_Costing]varchar (14)
Alter table [mSCOA_Vault].[dbo].[Stageing_SPL] alter column[mSCOA_SCode_Region]varchar (14)

Alter table [mSCOA_Vault].[dbo].[Reporting] alter column[mSCOA_SCode_Project]varchar (22)
Alter table [mSCOA_Vault].[dbo].[Reporting] alter column[mSCOA_SCode_Function]varchar (14)
Alter table [mSCOA_Vault].[dbo].[Reporting] alter column[mSCOA_SCode_Item]varchar (14)
Alter table [mSCOA_Vault].[dbo].[Reporting] alter column[mSCOA_SCode_Fund]varchar (14)
Alter table [mSCOA_Vault].[dbo].[Reporting] alter column[mSCOA_SCode_Costing]varchar (14)
Alter table [mSCOA_Vault].[dbo].[Reporting] alter column[mSCOA_SCode_Region]varchar (14)



Delete [mSCOA_Vault].[dbo].[Reporting]

 

Insert into  [mSCOA_Vault].[dbo].[Reporting] ([FINYEAR],
[MSC_Code],
[mSCOA_SCode_Item],
[mSCOA_SCode_Project],[mSCOA_SCode_Function],[mSCOA_SCode_Fund],[mSCOA_SCode_Region],[mSCOA_SCode_Costing],
[PM01],
[PM02],
[PM03],
[PM04],
[PM05],
[PM06],
[PM07],
[PM08],
[PM09],
[PM10],
[PM11],
[PM12],
[ORGB],
[ITY1],
[ITY2])


SELECT '2019' 
      ,[MSC]
      ,[ITEM]
	  ,[PROJECT],[FUNCTION],[FUND],[REGION],[COSTING]
      ,Sum([M01]) as M01
      ,Sum([M02]) as M02
      ,Sum([M03]) as M03
      ,Sum([M04]) as M04
      ,Sum([M05]) as M05
      ,Sum([M06]) as M06
      ,Sum([M07]) as M07
      ,Sum([M08]) as M08
      ,Sum([M09]) as M09
      ,Sum([M10]) as M10
      ,Sum([M11]) as M11
      ,Sum([M12]) as M12
      ,Sum([Budget_Year_2018_19]) as ORGB
      ,Sum([Budget_Year__1_2019_20]) as ITY1
      ,Sum([Budget_Year__2_2020_21]) as ITY2
  FROM [mSCOA_Vault].[dbo].[FACT_ORGB2019_OPEX]

   Group by  [MSC],[ITEM],[PROJECT],[FUNCTION],[FUND],[REGION],[COSTING]




Insert into  [mSCOA_Vault].[dbo].[Reporting] ([FINYEAR],
[MSC_Code],
[mSCOA_SCode_Item],
[mSCOA_SCode_Project],[mSCOA_SCode_Function],[mSCOA_SCode_Fund],[mSCOA_SCode_Region],[mSCOA_SCode_Costing],
[PM01],
[PM02],
[PM03],
[PM04],
[PM05],
[PM06],
[PM07],
[PM08],
[PM09],
[PM10],
[PM11],
[PM12],
[ORGB],
[ITY1],
[ITY2])


SELECT '2019' 
      ,[MSC]
      ,[ITEM]
	  ,[PROJECT],[FUNCTION],[FUND],[REGION],[COSTING]
      ,Sum([M01]) as M01
      ,Sum([M02]) as M02
      ,Sum([M03]) as M03
      ,Sum([M04]) as M04
      ,Sum([M05]) as M05
      ,Sum([M06]) as M06
      ,Sum([M07]) as M07
      ,Sum([M08]) as M08
      ,Sum([M09]) as M09
      ,Sum([M10]) as M10
      ,Sum([M11]) as M11
      ,Sum([M12]) as M12
      ,Sum([Budget_Year_2018_19]) as ORGB
      ,Sum([Budget_Year__1_2019_20]) as ITY1
      ,Sum([Budget_Year__2_2020_21]) as ITY2
  FROM [mSCOA_Vault].[dbo].[FACT_ORGB2019_CAPEX]

   Group by  [MSC],[ITEM],[PROJECT],[FUNCTION],[FUND],[REGION],[COSTING]	 


--   INSERT INTO  [mSCOA_Vault].[dbo].[Reporting] ([FINYEAR],[Old Account],[MSC_Code],[mSCOA_SCode_Project],[mSCOA_SCode_Function],[mSCOA_SCode_Item],[mSCOA_SCode_Fund],[mSCOA_SCode_Costing],[mSCOA_SCode_Region]
--,[mSCOA_Project],[mSCOA_Function],[mSCOA_Item],[mSCOA_Fund],[mSCOA_Costing],[mSCOA_Region_Guid]
--,Sum([M01])as M01
--,Sum([M02])as M02 
--,Sum([M03])as M03
--,Sum([M04])as M04
--,Sum([M05])as M05
--,Sum([M06])as M06
--,Sum([M07])as M07
--,Sum([M08])as M08
--,Sum([M09])as M09
--,Sum([M10])as M10
--,Sum([M11])as M11
--,Sum([M12])as M12
--,Sum([M13])as M13
--,Sum([M14])as M14
--,Sum([M15])as M15)
--  SELECT [FINYEAR] ,[Old Account] ,[MSC_Code],[mSCOA_SCode_Project] ,[mSCOA_SCode_Function] ,[mSCOA_SCode_Item] ,[mSCOA_SCode_Fund],[mSCOA_SCode_Costing],[mSCOA_SCode_Region],[mSCOA_Project_Guid]
--	  ,[mSCOA_Function_Guid] ,[mSCOA_Item_Guid],[mSCOA_Fund_Guid] ,[mSCOA_Costing_Guid] ,[mSCOA_Region_Guid]
--      ,case [FINMONTH] when 1 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 2 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 3 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 4 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 5 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 6 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 7 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 8 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 9 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 10 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 11 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 12 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 13 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 14 then [AMOUNT] else 0 end
--	  ,case [FINMONTH] when 15 then [AMOUNT] else 0 end
--  FROM [mSCOA_Vault].[dbo].[Stageing_SPL]

-- Group by  [FINYEAR],[Old Account],[MSC_Code],[mSCOA_SCode_Project],[mSCOA_SCode_Function],[mSCOA_SCode_Item],[mSCOA_SCode_Fund],[mSCOA_SCode_Costing],[mSCOA_SCode_Region]
--,[mSCOA_Project],[mSCOA_Function],[mSCOA_Item],[mSCOA_Fund],[mSCOA_Costing],[mSCOA_Region_Guid]

INSERT INTO  [mSCOA_Vault].[dbo].[Reporting] ([FINYEAR],[Old Account],[MSC_Code],[mSCOA_SCode_Project],[mSCOA_SCode_Function],[mSCOA_SCode_Item],[mSCOA_SCode_Fund],[mSCOA_SCode_Costing],[mSCOA_SCode_Region]
,[mSCOA_Project],[mSCOA_Function],[mSCOA_Item],[mSCOA_Fund],[mSCOA_Costing],[mSCOA_Region_Guid]
,[M01],[M02],[M03],[M04],[M05],[M06],[M07],[M08],[M09],[M10],[M11],[M12],[M13],[M14],[M15])
  SELECT [FINYEAR] ,[Old Account] ,[MSC_Code],[mSCOA_SCode_Project] ,[mSCOA_SCode_Function] ,[mSCOA_SCode_Item] ,[mSCOA_SCode_Fund],[mSCOA_SCode_Costing],[mSCOA_SCode_Region],[mSCOA_Project_Guid]
	  ,[mSCOA_Function_Guid] ,[mSCOA_Item_Guid],[mSCOA_Fund_Guid] ,[mSCOA_Costing_Guid] ,[mSCOA_Region_Guid]
      ,case [FINMONTH] when 1 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 2 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 3 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 4 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 5 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 6 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 7 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 8 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 9 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 10 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 11 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 12 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 13 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 14 then [AMOUNT] else 0 end
	  ,case [FINMONTH] when 15 then [AMOUNT] else 0 end
  FROM [mSCOA_Vault].[dbo].[Stageing_SPL]


Update [mSCOA_Vault].[dbo].[Reporting]
SET dbo.Reporting.mSCOA_Project_Guid = dbo.Lookup_Vault.mSCOA_GUID
FROM            dbo.Reporting INNER JOIN
                         dbo.Lookup_Vault ON dbo.Reporting.mSCOA_SCode_Project = dbo.Lookup_Vault.Short_Code

Update [mSCOA_Vault].[dbo].[Reporting]
SET dbo.Reporting.IUDF_Code = dbo.Cons_Vault.IUDF_Code
 , dbo.Reporting.IUDF_description = dbo.Cons_Vault.IUDF_description 
 , dbo.Reporting.MTSF_Code = dbo.Cons_Vault.MTSF_Code 
 , dbo.Reporting.MTSF_description =  dbo.Cons_Vault.MTSF_description 
 , dbo.Reporting.mSCOA_LCode_Project =  dbo.Cons_Vault.Account_Number_LongCode
 , dbo.Reporting.mSCOA_Project = dbo.Cons_Vault.Account_Name
FROM            dbo.Reporting INNER JOIN
                         dbo.Cons_Vault ON dbo.Reporting.mSCOA_Project_Guid = dbo.Cons_Vault.GUID

Update [mSCOA_Vault].dbo.Cons_Vault
SET        dbo.Cons_Vault.Schedule_Sheet = dbo.FACT_NT_Mapping.Schedule
, dbo.Cons_Vault.Schedule_Code = dbo.FACT_NT_Mapping.Schedule_Code 
, dbo.Cons_Vault.Code_description = dbo.FACT_NT_Mapping.Code_description 
FROM            dbo.Cons_Vault LEFT OUTER JOIN
                         dbo.FACT_NT_Mapping ON dbo.Cons_Vault.GUID = dbo.FACT_NT_Mapping.GUID



						 
Update [mSCOA_Vault].[dbo].[Reporting]

Set  dbo.Reporting.mSCOA_Item_Guid = dbo.Lookup_Vault.mSCOA_GUID
FROM            dbo.Reporting INNER JOIN
                         dbo.Lookup_Vault ON dbo.Reporting.mSCOA_SCode_Item = dbo.Lookup_Vault.Short_Code

						 
Update [mSCOA_Vault].[dbo].[Reporting]

Set  dbo.Reporting.mSCOA_Item_Guid = dbo.Lookup_Vault.mSCOA_GUID
FROM            dbo.Reporting INNER JOIN
                         dbo.Lookup_Vault ON dbo.Reporting.[Old Account]= dbo.Lookup_Vault.[G_L_Account]
Where dbo.Reporting.mSCOA_Item_Guid is NULL



						 
Update [mSCOA_Vault].[dbo].[Reporting]
SET    dbo.Reporting.mSCOA_Item		=	dbo.Cons_Vault.Account_Name
, dbo.Reporting.Schedule_Sheet      =	dbo.Cons_Vault.Schedule_Sheet 
, dbo.Reporting.Schedule_Code       =	dbo.Cons_Vault.Schedule_Code 
, dbo.Reporting.Code_description    =	dbo.Cons_Vault.Code_description 
FROM            dbo.Reporting LEFT OUTER JOIN
                         dbo.Cons_Vault ON dbo.Reporting.mSCOA_Item_Guid = dbo.Cons_Vault.GUID


