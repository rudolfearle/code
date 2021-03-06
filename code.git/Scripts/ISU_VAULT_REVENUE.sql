--SELECT  [Division]
--,[Name] as Division_Name
--,[RATE_CAT]
--,[DESC] as [RATE_CAT_DESC]
--,[Recommended_Invoice_Guid] as[Item_Guid]
--,[Recommended_Invoice_Description] as [Item_Description]
--,[Recommended_Receipt_Guid] as [Item_Contra_Guid]
--,[Recommended_Receipt_Description] as [Item_Contra_Description]
--,[Revenue_GL]
--,[Project_Guid]
--,[Project_Description]
--,[Function_Guid]  As MSC
--, NULL as [Function_Guid]
--,[Function_Description]
--,[Fund_Guid]
--,[Fund_Description]

--Into [Lookup_Vault_ISU_Revenue]
--FROM [mSCOA_Vault].[dbo].[Lookup_Vault_ISU]

--where Revenue_GL like'%81%' and Division is not null and RATE_CAT is not null
--Group by [Division]
--,[Name]
--,[RATE_CAT]
--,[DESC]
--,[Revenue_GL]
--,[Function_Guid]
--,[Function_Description]
--,[Fund_Guid]
--,[Fund_Description]
--,[Project_Guid]
--,[Project_Description]
--,[Recommended_Invoice_Guid]
--,[Recommended_Invoice_Description] 
--,[Recommended_Receipt_Guid] 
--, [Recommended_Receipt_Description] 
--order by  Division, Revenue_GL,3

--Alter table [Lookup_Vault_ISU_Revenue] alter column [Function_Guid] nvarchar(36)
--Alter table [Lookup_Vault_ISU_Revenue] add [Region_Guid] nvarchar(36)
--Alter table [Lookup_Vault_ISU_Revenue] add [Region_Description] varchar(210)
--Alter table [Lookup_Vault_ISU_Revenue] add [Costing_Guid] nvarchar(36)
--Alter table [Lookup_Vault_ISU_Revenue] add [Costing_Description] varchar(210)
--Alter table [Lookup_Vault_ISU_Revenue] add [Item_Parent_Guid] nvarchar(36)
--Alter table [Lookup_Vault_ISU_Revenue] add [Item_Parent_Description] varchar(210)
--Alter table [Lookup_Vault_ISU_Revenue] alter column [Revenue_GL] varchar(20)
--Update [Lookup_Vault_ISU_Revenue]

--Set [Costing_Guid] = '47c7ba65-c270-4a7f-91ba-3842eb629ddf'
--,[Project_Guid] = '63348e37-464e-4ac0-a13a-e577838ff961'
--,[Region_Guid] = '3ce8062f-cb25-4338-9eec-a3cf3c4a936c'

Update [Lookup_Vault_ISU_Revenue]
SET        dbo.Lookup_Vault_ISU_Revenue.Item_Guid =  dbo.Lookup_Vault.mSCOA_GUID
, dbo.Lookup_Vault_ISU_Revenue.Item_Description = dbo.Cons_Vault.Account_Name
,  dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
FROM            dbo.Lookup_Vault_ISU_Revenue left outer JOIN
                         dbo.Lookup_Vault ON dbo.Lookup_Vault_ISU_Revenue.Revenue_GL = dbo.Lookup_Vault.G_L_Account Left outer Join
                         dbo.Cons_Vault ON dbo.Lookup_Vault.mSCOA_GUID = dbo.Cons_Vault.GUID


--Select * from [Lookup_Vault_ISU_Revenue]



Update [Lookup_Vault_ISU_Revenue]
Set  [Function_Guid] = 'd0a8c200-23d4-4309-8ea5-97922584a36d'
,[Function_Description] = 'Function:Energy Sources:Core Function:Electricity'
,[Fund_Guid] = '94f2296d-bb2b-4274-99f3-84051815e481'
,[Fund_Description]  = 'Fund:Operational:Revenue:General Revenue:Service Charges:Electricity'
,[Item_Contra_Parent_Guid] = '21778190-f668-4ca1-8f56-87243df6a5dc'
,[Item_Contra_Parent_Description] = 'Assets:Current Assets:Trade and other Receivables from Exchange Transactions:Trading Service and Customer Service Debtors:Electricity'
,[Item_Parent_Guid] = 'a54d2d13-1693-4ccc-979f-cf59e2e5973b'
,[Item_Parent_Description] = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales'
Where Division = '01'

--Select [Guid],PARENT_GUID,Account_Name, Account_Number_LongCode from Cons_Vault

--Where Account_Name like '%Elect%' and Account_Number_LongCode like 'IR%'
--Where Account_Name like '%Customer Service Debtors:Elect%' and Account_Number_LongCode like 'IA%'
--Where Account_Name like 'Revenue:Exchange Revenue:Service Charges:Elec%' and Account_Number_LongCode like 'IA%'
--Where Guid = 'a54d2d13-1693-4ccc-979f-cf59e2e5973b'
--order by Account_Number_LongCode

Update  dbo.Lookup_Vault_ISU_Revenue
Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = '72ad9d30-c8be-4e84-8d38-228c348057a6'
, dbo.Lookup_Vault_ISU_Revenue.Item_Description = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales:Domestic High'
FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
WHERE        (dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC LIKE '%DOM%') AND (dbo.Cons_Vault.Account_Name LIKE '%DOM%')
  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')

Update  dbo.Lookup_Vault_ISU_Revenue
Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = '9a4d6cb3-9af0-4c71-ae23-6231fa5cbf22'
, dbo.Lookup_Vault_ISU_Revenue.Item_Description = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales:Time of Use Tariffs'
FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('E_11KV_TOU','E_LOWV_TOU'))
  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')


  Update  dbo.Lookup_Vault_ISU_Revenue
Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = '58db275c-ad12-4ea4-a951-d0176b964f1e'
, dbo.Lookup_Vault_ISU_Revenue.Item_Description = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales:Industrial  more than (11 000 Volts) (High Voltage)'
FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('E_11KV',''))
  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')

    Update  dbo.Lookup_Vault_ISU_Revenue
Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = '07da2c2a-5280-4206-93c7-95aa7f054a9d'
, dbo.Lookup_Vault_ISU_Revenue.Item_Description = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales:Sports Grounds/Churches/Holiday/Old-age homes/Schools'
FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('',''))
  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')


  
    Update  dbo.Lookup_Vault_ISU_Revenue
Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = '4dfec93b-618b-40ee-b504-690516b9fb4e'
, dbo.Lookup_Vault_ISU_Revenue.Item_Description = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales:Agricultural High'
FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('E_FARM_3C','ETEMF3C68','ETEMF1C68','ETEMP3C68'))
  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')

      Update  dbo.Lookup_Vault_ISU_Revenue
Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = 'cc0d51d7-bece-4d30-a096-5b34b6652437'
, dbo.Lookup_Vault_ISU_Revenue.Item_Description = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales:Agricultural Low'
FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('E_FARM_1C','E_B_FARM','ETEMF3C24'))
  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')

   Update  dbo.Lookup_Vault_ISU_Revenue
Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = 'cf2d3395-4cc0-4002-b806-5fe70a6d30df'
, dbo.Lookup_Vault_ISU_Revenue.Item_Description = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales:Agricultural Medium'
FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('ETEMF1C46','ETEMF3C46'))
  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')


 
    Update  dbo.Lookup_Vault_ISU_Revenue
Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = 'e7b2cf47-ac8d-4a72-8bc2-79c7920e8253'
, dbo.Lookup_Vault_ISU_Revenue.Item_Description = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales:Industrial (400 Volts) (Low Voltage)'
FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('E_LOWV','E_LOWV_TOU'))
  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')

  Update  dbo.Lookup_Vault_ISU_Revenue
Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = '920f4721-c889-4b75-bbf4-4b5653cc7709'
, dbo.Lookup_Vault_ISU_Revenue.Item_Description = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales:Domestic Low'
FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('E_B_DOM','E_DOM_1C','ENDOM1C20','ETEMD1C20','ETEMD3C20'))
  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')


--SELECT       dbo.Cons_Vault.GUID
--, dbo.Cons_Vault.Account_Name

--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE        (dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC not LIKE '%DOM%') AND (dbo.Cons_Vault.Account_Name not LIKE '%DOM%')
--  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')
--  Group by  dbo.Cons_Vault.GUID
--, dbo.Cons_Vault.Account_Name

--  Order by 2

  
--SELECT       
-- dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT
--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE        (dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC not LIKE '%DOM%') AND (dbo.Cons_Vault.Account_Name not LIKE '%DOM%')
--  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')
--  Group by  dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT

--  Order by 2


Update [Lookup_Vault_ISU_Revenue]
Set  [Function_Guid] = '2d32384d-4dba-4870-9ac0-bbfec6f0151b'
,[Function_Description] = 'Function:Water Management:Core Function:Water Distribution'
,[Fund_Guid] = '52a60eaf-aaaf-4b60-8200-0a88bb64e70f'
,[Fund_Description]  = 'Fund:Operational:Revenue:General Revenue:Service Charges:Water'
,[Item_Contra_Parent_Guid] = 'e13552f5-b7a6-43d0-840c-0f06a02d47a9'
,[Item_Contra_Parent_Description] = 'Assets:Current Assets:Inventory:Water:Authorised Consumption:Billed Authorised Consumption:Billed Metered Consumption'
,[Item_Parent_Guid] = '3c2a5d90-f58e-48c9-8df1-a0747ddf2a51'
,[Item_Parent_Description] = 'Revenue:Exchange Revenue:Service Charges:Water'
,[Item_Guid] = 'f51dcc20-d9f6-496d-8a33-8ddef122df99'
, [Item_Description] = 'Revenue:Exchange Revenue:Service Charges:Water:Sale'
Where Division = '03'

--Select [Guid], PARENT_GUID,Account_Name from Cons_Vault
----Where Account_Name like '%Water%' and Account_Number_LongCode like 'Fx%' order by 2

--Where Account_Name like '%Water%' and Account_Number_LongCode like 'IA%'
----Where Account_Name like '%Customer Service Debtors:%' and Account_Number_LongCode like 'IA%'
----Where Account_Name like 'Revenue:Exchange Revenue:Service Charges:Elec%' and Account_Number_LongCode like 'IA%'
----Where Guid = 'a54d2d13-1693-4ccc-979f-cf59e2e5973b'
--order by Account_Number_LongCode





Update [Lookup_Vault_ISU_Revenue]
Set  [Function_Guid] = 'c0faf3f7-55b6-4ef6-b0e3-76b190e04071'
,[Function_Description] = 'Function:Waste Water Management:Core Function:Sewerage'
,[Fund_Guid] = '9257bcbd-f49b-4d57-8ec1-5792780d80fd'
,[Fund_Description]  = 'Fund:Operational:Revenue:General Revenue:Service Charges:Waste Water'
,[Item_Contra_Parent_Guid] = 'dce1db20-5142-4ce3-bde9-462c4cf8d60a'
,[Item_Contra_Parent_Description] = 'Assets:Current Assets:Trade and other Receivables from Exchange Transactions:Trading Service and Customer Service Debtors:Waste Water Management'
,[Item_Parent_Guid] = '365af021-7d32-4e35-acd0-49c8d75ed4cc'
,[Item_Parent_Description] = 'Revenue:Exchange Revenue:Service Charges:Waste Water Management'
,[Item_Guid] = '638d7d97-52ee-45a0-a785-869f5df983ab'
, [Item_Description] = 'Revenue:Exchange Revenue:Service Charges:Waste Water Management:Sanitation Charges'


Where Division in ('04','05')

--  Update  dbo.Lookup_Vault_ISU_Revenue
--Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = ''
--, dbo.Lookup_Vault_ISU_Revenue.Item_Description = ''
--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('',''))
--  and (dbo.Lookup_Vault_ISU_Revenue.Division in ('04','05'))




--Select [Guid], PARENT_GUID,Account_Name from Cons_Vault


----Where Account_Name like '%Sewerage%' and Account_Number_LongCode like 'FX%'
--Where Account_Name like '%Waste water%' and Account_Number_LongCode like 'IA%'
----Where Account_Name like '%Customer Service Debtors:Elect%' and Account_Number_LongCode like 'IA%'
----Where Account_Name like 'Revenue:Exchange Revenue:Service Charges:Elec%' and Account_Number_LongCode like 'IA%'
----Where Guid = 'a54d2d13-1693-4ccc-979f-cf59e2e5973b'
--order by Account_Number_LongCode

----Update  dbo.Lookup_Vault_ISU_Revenue
----Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = '72ad9d30-c8be-4e84-8d38-228c348057a6'
----, dbo.Lookup_Vault_ISU_Revenue.Item_Description = 'Revenue:Exchange Revenue:Service Charges:Electricity:Electricity Sales:Domestic High'


--SELECT        dbo.Lookup_Vault_ISU_Revenue.Item_Guid, dbo.Cons_Vault.GUID
--, dbo.Lookup_Vault_ISU_Revenue.Item_Description, dbo.Cons_Vault.Account_Name
--, dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT
--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE        (dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC LIKE '%DOM%') AND (dbo.Cons_Vault.Account_Name LIKE '%DOM%')


--SELECT       
-- dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT
--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE        (dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC LIKE '%DOM%') AND (dbo.Cons_Vault.Account_Name LIKE '%DOM%')
--  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')
--  Group by  dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT

--  Order by 2



Update [Lookup_Vault_ISU_Revenue]
Set  [Function_Guid] = '028ec562-fa32-4462-9c8f-90ca38ed33ae'
,[Function_Description] = 'Function:Waste Management:Core Function:Solid Waste Removal'
,[Fund_Guid] = 'ac3573a5-1b7a-420e-b037-4a4388ff0ff7'
,[Fund_Description]  = 'Fund:Operational:Revenue:General Revenue:Service Charges:Waste'
,[Item_Contra_Parent_Guid] = 'dce1db20-5142-4ce3-bde9-462c4cf8d60a'
,[Item_Contra_Parent_Description] = 'Assets:Current Assets:Trade and other Receivables from Exchange Transactions:Trading Service and Customer Service Debtors:Waste Management'
,[Item_Parent_Guid] = '19499114-6a81-4edc-8569-f9bb14725540'
,[Item_Parent_Description] = 'Revenue:Exchange Revenue:Service Charges:Waste Management'
,[Item_Guid] = 'cb116ffa-9dce-4dc2-a439-d4b9dbfd034b'
, [Item_Description] = 'Revenue:Exchange Revenue:Service Charges:Waste Management:Refuse Removal'

Where Division = '06'

-- Update  dbo.Lookup_Vault_ISU_Revenue
--Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = ''
--, dbo.Lookup_Vault_ISU_Revenue.Item_Description = ''
--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('',''))
--  and (dbo.Lookup_Vault_ISU_Revenue.Division in ('06'))



--Select [Guid],PARENT_GUID,Account_Name from Cons_Vault
----Where Account_Name like '%Waste%' and Account_Number_LongCode like 'FD%'


--Where Account_Name like '%Waste%' and Account_Number_LongCode like 'IA%'
----Where Account_Name like '%Customer Service Debtors:Elect%' and Account_Number_LongCode like 'IA%'
----Where Account_Name like 'Revenue:Exchange Revenue:Service Charges:Elec%' and Account_Number_LongCode like 'IA%'
----Where Guid = 'a54d2d13-1693-4ccc-979f-cf59e2e5973b'
--order by Account_Number_LongCode


--SELECT       
-- dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT
--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE        (dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC LIKE '%DOM%') AND (dbo.Cons_Vault.Account_Name LIKE '%DOM%')
--  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')
--  Group by  dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT

--  Order by 2

--SELECT        dbo.Lookup_Vault_ISU_Revenue.Item_Guid, dbo.Cons_Vault.GUID
--, dbo.Lookup_Vault_ISU_Revenue.Item_Description, dbo.Cons_Vault.Account_Name
--, dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT
--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE        (dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC LIKE '%DOM%') AND (dbo.Cons_Vault.Account_Name LIKE '%DOM%')


Update [Lookup_Vault_ISU_Revenue]
Set  [Function_Guid] = '67347610-1db2-421f-a89a-f87e772911eb'
,[Function_Description] = 'Function:Finance and Administration:Core Function:Finance'
,[Fund_Guid] = '5692f970-c29c-4044-80d7-1bcdbdd34348'
,[Fund_Description]  = 'Fund:Operational:Revenue:General Revenue:Taxes:Property Rates:Levies'
,[Item_Contra_Parent_Guid] = '4605e80f-59f2-41d4-a0ed-b8a0eff56ceb'
,[Item_Contra_Parent_Description] = 'Assets:Current Assets:Receivables from Non-exchange Transactions:Property Rates'
,[Item_Parent_Guid] = ''
,[Item_Parent_Description] = ''
,[Item_Guid] = '74350fdc-0a67-4e8f-b4b8-614af34f9b5d'
,[Item_Description] = 'Revenue:Non-exchange Revenue:Property Rates:Communal Land:Business and Commercial'
Where Division in ('07')

-- Update  dbo.Lookup_Vault_ISU_Revenue
--Set  dbo.Lookup_Vault_ISU_Revenue.Item_Guid = ''
--, dbo.Lookup_Vault_ISU_Revenue.Item_Description = ''
--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE    (dbo.Lookup_Vault_ISU_Revenue. RATE_CAT in ('',''))
--  and (dbo.Lookup_Vault_ISU_Revenue.Division in ('07'))





--Select [Guid],PARENT_GUID,Account_Name from Cons_Vault
----Where Account_Name like '%Finance%' and Account_Number_LongCode like 'FX%'


--Where Account_Name like '%Rates%' and Account_Number_LongCode like 'IA%'
----Where Account_Name like '%Customer Service Debtors:Elect%' and Account_Number_LongCode like 'IA%'
----Where Account_Name like 'Revenue:Exchange Revenue:Service Charges:Elec%' and Account_Number_LongCode like 'IA%'
----Where Guid = 'a54d2d13-1693-4ccc-979f-cf59e2e5973b'
--order by Account_Number_LongCode


----SELECT        dbo.Lookup_Vault_ISU_Revenue.Item_Guid, dbo.Cons_Vault.GUID
--, dbo.Lookup_Vault_ISU_Revenue.Item_Description, dbo.Cons_Vault.Account_Name
--, dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT
--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE        (dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC LIKE '%DOM%') AND (dbo.Cons_Vault.Account_Name LIKE '%DOM%')


--SELECT       
-- dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT
--FROM            dbo.Lookup_Vault_ISU_Revenue INNER JOIN
--                         dbo.Cons_Vault ON dbo.Lookup_Vault_ISU_Revenue.Item_Parent_Guid = dbo.Cons_Vault.PARENT_GUID
--WHERE        (dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC LIKE '%DOM%') AND (dbo.Cons_Vault.Account_Name LIKE '%DOM%')
--  and (dbo.Lookup_Vault_ISU_Revenue.Division = '01')
--  Group by  dbo.Lookup_Vault_ISU_Revenue.RATE_CAT_DESC,dbo.Lookup_Vault_ISU_Revenue.RATE_CAT

--  Order by 2