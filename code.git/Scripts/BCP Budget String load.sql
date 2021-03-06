USE mSCOA_Vault 
GO

update [mSCOA_Vault].[dbo].[COT_ORGB2019]
  set [Project] = REPLACE(LTRIM(RTRIM([Project])), ' ', '')  
      ,[Function] = REPLACE(LTRIM(RTRIM([Function])), ' ', '')  
      ,[Region] = REPLACE(LTRIM(RTRIM([Region])), ' ', '')  
      ,[Item] = REPLACE(LTRIM(RTRIM([Item])), ' ', '')  
      ,[Costing] = REPLACE(LTRIM(RTRIM([Costing])), ' ', '')  
      ,[Fund] = REPLACE(LTRIM(RTRIM([Fund])), ' ', '')  
	
--	Update [mSCOA_Vault].[dbo].[COT_ORGB2019]
--SET        dbo.COT_ORGB2019.SERIAL_NUMBER = left(dbo.COT_ORGB2019_tabb.SERIAL_NUMBER,36) 
--FROM            dbo.COT_ORGB2019_tabb INNER JOIN
--                         dbo.COT_ORGB2019 ON dbo.COT_ORGB2019_tabb.Project = dbo.COT_ORGB2019.Project
--sELECT * fROM  [mSCOA_Vault].[dbo].[COT_ORGB2019] where Serial_Number is null

Update [mSCOA_Vault].[dbo].[COT_ORGB2019]
SET        dbo.COT_ORGB2019.SERIAL_NUMBER =  dbo.COT_ORGB2019.GUID
FROM            dbo.COT_ORGB2019 INNER JOIN
                         dbo.Cons_Vault ON dbo.COT_ORGB2019.GUID = dbo.Cons_Vault.GUID
--WHERE        (dbo.Cons_Vault.Breakdown_Allowed = 'N')
	
----- FIX GUID iSSUES  
update [mSCOA_Vault].[dbo].[COT_ORGB2019]
Set [SERIAL_NUMBER] = '63348e37-464e-4ac0-a13a-e577838ff961'
where [mSCOA_Vault].[dbo].[COT_ORGB2019].[Project] = 'PD'

	
update [mSCOA_Vault].[dbo].[COT_ORGB2019]
Set [SERIAL_NUMBER] = [GUID]+'_'+[UNIQUE_NUMBER]
where [dbo].[COT_ORGB2019].[Project] <> 'PD'


--DELETE FROM [mSCOA_Vault].[dbo].[COT_ORGB2019]

--  WHERE ITEM like  '%D'

	drop table  [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
	go 

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
	
	-- select * from [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]


---- Adding the 6.2 guids




update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Project]= dbo.[COT_6.2.1_guid_shortcode_oldgl].mSCOA_GUID
FROM            dbo.[COT_6.2.1_guid_shortcode_oldgl] INNER JOIN
                         dbo.COT_ORGB2019_GUID ON dbo.[COT_6.2.1_guid_shortcode_oldgl].Short_Code = dbo.COT_ORGB2019_GUID.[Project]		

update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Function]= dbo.[COT_6.2.1_guid_shortcode_oldgl].mSCOA_GUID
FROM            dbo.[COT_6.2.1_guid_shortcode_oldgl] INNER JOIN
                         dbo.COT_ORGB2019_GUID ON dbo.[COT_6.2.1_guid_shortcode_oldgl].Short_Code = dbo.COT_ORGB2019_GUID.[Function]										

update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Fund]= dbo.[COT_6.2.1_guid_shortcode_oldgl].mSCOA_GUID
FROM            dbo.[COT_6.2.1_guid_shortcode_oldgl] INNER JOIN
                         dbo.COT_ORGB2019_GUID ON dbo.[COT_6.2.1_guid_shortcode_oldgl].Short_Code = dbo.COT_ORGB2019_GUID.[Fund]										


update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Item]= dbo.[COT_6.2.1_guid_shortcode_oldgl].mSCOA_GUID
FROM            dbo.[COT_6.2.1_guid_shortcode_oldgl] INNER JOIN
                         dbo.COT_ORGB2019_GUID ON dbo.[COT_6.2.1_guid_shortcode_oldgl].Short_Code = Left(dbo.COT_ORGB2019_GUID.[Item],10)
						 


update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Region]= dbo.[COT_6.2.1_guid_shortcode_oldgl].mSCOA_GUID
FROM            dbo.[COT_6.2.1_guid_shortcode_oldgl] INNER JOIN
                         dbo.COT_ORGB2019_GUID ON dbo.[COT_6.2.1_guid_shortcode_oldgl].Short_Code = dbo.COT_ORGB2019_GUID.[Region]




update [dbo].[COT_ORGB2019_GUID]
SET     dbo.COT_ORGB2019_GUID.[Costing]= '47c7ba65-c270-4a7f-91ba-3842eb629ddf'


update[dbo].[COT_ORGB2019_GUID]
 SET [Function] = '2d32384d-4dba-4870-9ac0-bbfec6f0151b'
 WHERE [Function] ='c0faf3f7-55b6-4ef6-b0e3-76b190e04071'  AND ITEM = '714e8920-85c7-470a-9d00-2145aa38c98c'


Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [M01] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [M02] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column   [M03] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column   [M04] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [M05] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [M06] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [M07] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [M08] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [M09] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [M10] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [M11] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [M12] Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [Budget_Year_2018_19]Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [Budget_Year__1_2019_20]Money
Alter table  [dbo].[COT_ORGB2019_GUID] alter column  [Budget_Year__2_2020_21]Money



update [dbo].[COT_ORGB2019_GUID]

Set [M01] = Round(M01, 0)
      ,[M02] = Round(M02,0)
      ,[M03] =  Round (M03,0)
	  ,[M04] =  Round (M04,0)
	  ,[M05] =  Round (M05,0)
      ,[M06] =  Round (M06,0)
      ,[M07] =  Round (M07,0)
      ,[M08] =  Round (M08,0)
      ,[M09] =  Round (M09,0)
      ,[M10] =  Round (M10,0)
      ,[M11] =  Round (M11,0)
      ,[M12] =  Round (M12,0)
      ,[Budget_Year_2018_19] =  Round ([Budget_Year_2018_19],0)
      ,[Budget_Year__1_2019_20] =  Round ([Budget_Year__1_2019_20],0)
      ,[Budget_Year__2_2020_21] =  Round ([Budget_Year__2_2020_21],0)



update [dbo].[COT_ORGB2019_GUID]

Set [M01] = Round([Budget_Year_2018_19] - M02 - M03 -M04 - M05- M06 - M07- M08 - M09 - M10 - M11 - M12 , 0)



-----fix 6.2 issues
--FundCode														
--130218bb-5041-4cb1-8ab7-cce32fee9772	33356	2018/06/17	TSH_2019_TABB_G_20180617T132710Z_	8										
update [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
set [Fund] ='646ee22b-2ca0-4535-a3f0-eae246f2a597'
where [Fund]  ='130218bb-5041-4cb1-8ab7-cce32fee9772'

--c48cc358-c3e9-4f9a-88db-e704df3b532b	33356	2018/06/17	TSH_2019_TABB_G_20180617T132710Z_	56										
update [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
set [Fund] ='e61a9fd1-5af2-4c66-b2a8-32fc3dd98549'
where [Fund]  ='c48cc358-c3e9-4f9a-88db-e704df3b532b'
--Items 	
--92b47fb3-a836-4a6c-9cbd-e5120295256e	33356	2018/06/17	TSH_2019_TABB_G_20180617T132710Z_	13										

update [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
set [Item] ='219997c9-492c-437a-a2e1-d95c5591fe54'
where [Item]  ='92b47fb3-a836-4a6c-9cbd-e5120295256e'

--a614604b-029d-4bb8-8b2a-d771b183bc7d	33356	2018/06/17	TSH_2019_TABB_G_20180617T132710Z_	101										

update [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
set [Item] ='e8fa2898-47e8-4a61-b5a6-13bec4c12397'
where [Item] ='a614604b-029d-4bb8-8b2a-d771b183bc7d'


--Projects 														
--39c2ee1f-5583-4e26-bb84-6f9798444b23	33356	2018/06/17	TSH_2019_TABB_G_20180617T132710Z_	4			39c2ee1f-5583-4e26-bb84-6f9798444b23
							
update [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
set [Project] ='c504bf27-6f05-435e-bd2c-ad3b45a222e2'
where left([Project],36)   ='39c2ee1f-5583-4e26-bb84-6f9798444b23'






update [dbo].[COT_ORGB2019_GUID]

Set [M01] = Round(M01, 0) +2332
      ,[M02] = Round(M02,0) - 218
      ,[M03] =  Round (M03,0) - 225
	  ,[M04] =  Round (M04,0) - 222
	  ,[M05] =  Round (M05,0) - 225
      ,[M06] =  Round (M06,0) - 229
      ,[M07] =  Round (M07,0) - 228
      ,[M08] =  Round (M08,0) - 219
      ,[M09] =  Round (M09,0) - 216
      ,[M10] =  Round (M10,0) - 212
      ,[M11] =  Round (M11,0) - 211
      ,[M12] =  Round (M12,0) - 221
      ,[Budget_Year_2018_19] =  Round ([Budget_Year_2018_19],0) - 94
      ,[Budget_Year__1_2019_20] =  Round ([Budget_Year__1_2019_20],0) - 92
      ,[Budget_Year__2_2020_21] =  Round ([Budget_Year__2_2020_21],0) - 316

WHERE ITEM = '4223dfe2-418d-4e25-8e4c-f2f4b536e1b0'



Delete [mSCOA_Vault].[dbo].[Z_FinReporting_DB]


Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
--,'TM01 when tabb'
,'TM01'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M01]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
  
 group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]


 Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM02'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M02]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
 group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
 

 Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM03'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M03]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
 group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]

 Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM04'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M04]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
 group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]


 Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM05'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M05] ) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]

 Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM06'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M06]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
 group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]

 Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM07'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M07]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
 group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]

 Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM08'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M08]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
 group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]

 Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM09'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M09]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
 group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]

Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM10'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M10]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
  group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
  
Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM11'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M11]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
  group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
  
Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'TM12'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([M12]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
  group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]

  
Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
--,'TABB'
,'TABB'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([Budget_Year_2018_19]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
  group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]

    
Insert Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'ITY1'
----ITY when tabb
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([Budget_Year__1_2019_20]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
  group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]

  
Insert Into  [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
([Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount])

SELECT  'TSH'
,'2019'
,'ITY2'
,[Project]
,[Function]
,[Item]
,[Fund]
,[Costing]
,[Region]
,Sum([Budget_Year__2_2020_21]) As Amount
 FROM [mSCOA_Vault].[dbo].[COT_ORGB2019_GUID]
  
  group by 

 [Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]

----Remove 0 sum lines
 Delete From [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
 where Amount = 0


 update [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
  set [Project] = REPLACE(LTRIM(RTRIM([Project])), ' ', '')  
  
  
  update [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
  set [Project] =Left ([Project],36)

  --Select * from [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
  --- *******/ Create IDP File   /*********

Drop Table T1
 go

SELECT        
LEFT(dbo.Z_FinReporting_DB.Project, 36) AS Project
, dbo.Cons_Vault.Breakdown_Allowed
, dbo.Cons_Vault.Level_Name
, dbo.Cons_Vault.IUDF_Code
, dbo.Cons_Vault.IUDF_description
, dbo.Cons_Vault.MTSF_Code
, dbo.Cons_Vault.MTSF_description
, dbo.Cons_Vault.Account_Name
, dbo.Z_FinReporting_DB.[Function]
, ' XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' as Function_Name
, dbo.Z_FinReporting_DB.Region
, 'Whole of Tshwane                             ' as Region_Name

Into T1
FROM            dbo.Z_FinReporting_DB INNER JOIN
                         dbo.Cons_Vault ON LEFT(dbo.Z_FinReporting_DB.Project, 36) = dbo.Cons_Vault.GUID
GROUP BY LEFT(dbo.Z_FinReporting_DB.Project, 36), dbo.Cons_Vault.IUDF_Code, dbo.Cons_Vault.IUDF_description, dbo.Cons_Vault.MTSF_Code, dbo.Cons_Vault.MTSF_description, dbo.Cons_Vault.Level_Name, 
                           dbo.Cons_Vault.Breakdown_Allowed, dbo.Cons_Vault.Account_Name, dbo.Z_FinReporting_DB.[Function], dbo.Z_FinReporting_DB.Region




Update  T1

SET       dbo.T1.Function_Name =  dbo.Cons_Vault.Level_Name
FROM            dbo.T1 INNER JOIN
                         dbo.Cons_Vault ON dbo.T1.[Function] = dbo.Cons_Vault.GUID

Update  T1

SET       dbo.T1.Region_Name =  dbo.Cons_Vault.Level_Name
FROM            dbo.T1 INNER JOIN
                         dbo.Cons_Vault ON dbo.T1.[Region] = dbo.Cons_Vault.GUID


Update T1
Set Account_Name = 'Operational:Maintenance: '

where Account_Name like 'Operational:Maintenance:%'

Update T1
Set Account_Name = 'Operational:Typical Work Streams: '

where Account_Name like 'Operational:Typical Work Streams:%'


Update T1
Set Account_Name = 'Capital:Non-infrastructure: '

where Account_Name like 'Capital:Non-infrastructure:%'

Update T1
Set Account_Name = 'Capital:Infrastructure: '

where Account_Name like 'Capital:Infrastructure:%'


--Select * from T1 where project is null
--Select * from dbo.Z_FinReporting_DB where project is null\

-- Select dbo.Z_FinReporting_DB.Project, dbo.T1.Project 
--FROM            dbo.Z_FinReporting_DB LEFT OUTER JOIN
--                         dbo.T1 ON LEFT(dbo.Z_FinReporting_DB.Project, 36) = LEFT(dbo.T1.Project, 36) AND dbo.Z_FinReporting_DB.[Function] = dbo.T1.[Function] AND dbo.Z_FinReporting_DB.Region = dbo.T1.Region

--Where dbo.T1.Project  is not null
alter table T1 add  id              INT           NOT NULL    IDENTITY    PRIMARY KEY

Alter table T1 alter column Project Varchar (42)


UPDATE T1
Set Project = Project +'_' + Right('00000'+ cast (id as Varchar(5)),5)

where Breakdown_Allowed = 'Y'



--Muncde|YearEnd|PERIOD|Project GUID_nnnnn|MTSF Service Delivery Outcome (DROPDOWN LIST)|IUDF Integrated Urban Development Framework (DROPDOWN LIST)|Own Strategic Objectives|Individual Projects|GPS X Longitude in Decimal Degrees|GPS Y Latitude in Decimal Degrees

--TSH|2019|TABB|0386b586-2791-4087-a74c-029170725fa1_0015|06|02||Electrical Infrastructure_MV Networks||
--Select * from T1

delete from T1  where Project = '63348e37-464e-4ac0-a13a-e577838ff961'

Drop table Z_IDPString

SELECT 
'TSH' as Municipality
,'2019' as FinYR
,'TABB' as Period
, Project
, MTSF_Code
, IUDF_Code
, Account_Name as Strategic_Objectives
, Function_Name+':'+Level_Name+':'+ Region_Name as OWN_Projects
, '' as GPS_Long
,'' As GPS_Lat
INTO Z_IDPString
FROM            dbo.T1



delete FROM     Z_IDPString
Where Project = '53d432c7-5d06-4d53-a785-f29995840060'


Insert Into  Z_IDPString(Municipality
,	FinYR
,	[Period]
,	[Project]
,	MTSF_Code
,	IUDF_Code
,	Strategic_Objectives
,	OWN_Projects
,	GPS_Long
,	GPS_Lat)

Select 
'TSH'
,'2019'
,'TABB'
,'53d432c7-5d06-4d53-a785-f29995840060'
,'08'
,'04'
,'Operational:Municipal Running Cost'
,'Municipal Running Cost:Whole of the Metro'	
,''
,''


Update dbo.Z_FinReporting_DB
SET        dbo.Z_FinReporting_DB.Project =  dbo.T1.Project 
FROM            dbo.Z_FinReporting_DB LEFT OUTER JOIN
                         dbo.T1 ON LEFT(dbo.Z_FinReporting_DB.Project, 36) = LEFT(dbo.T1.Project, 36) AND dbo.Z_FinReporting_DB.[Function] = dbo.T1.[Function] AND dbo.Z_FinReporting_DB.Region = dbo.T1.Region
Where dbo.T1.Project  is not null


---- Remove duplicates
Drop Table T1

SELECT [Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,Sum([Amount]) As Amount

	  Into [mSCOA_Vault].[dbo].T1
  FROM [mSCOA_Vault].[dbo].[Z_FinReporting_DB]


  Group by [Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
  
  Drop Table [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
  SELECT [Municipality]
      ,[FinYR_End]
      ,[Period]
      ,[Project]
      ,[Function]
      ,[Item]
      ,[Fund]
      ,[Costing]
      ,[Region]
      ,[Amount]
	 Into [mSCOA_Vault].[dbo].[Z_FinReporting_DB]
  FROM [mSCOA_Vault].[dbo].[T1]
  
  
  
  
  
  --- load Schedules





DROP TABLE [dbo].[T1]
GO



SELECT   dbo.Z_FinReporting_DB.Municipality, dbo.Z_FinReporting_DB.FinYR_End, dbo.Cons_Vault.C_Schedule_Sheet, dbo.Cons_Vault.C_Schedule_Code, dbo.Cons_Vault.C_Schedule_Code_description, 
                         dbo.Z_FinReporting_DB.Period, SUM(dbo.Z_FinReporting_DB.Amount) AS Amount, dbo.Z_FinReporting_DB.Item

Into T1
FROM            dbo.Z_FinReporting_DB LEFT OUTER JOIN
                         dbo.Cons_Vault ON dbo.Z_FinReporting_DB.[Function] = dbo.Cons_Vault.GUID
GROUP BY dbo.Z_FinReporting_DB.Period, dbo.Z_FinReporting_DB.Municipality, dbo.Z_FinReporting_DB.FinYR_End, dbo.Z_FinReporting_DB.Item, dbo.Cons_Vault.C_Schedule_Sheet, dbo.Cons_Vault.C_Schedule_Code, 
                         dbo.Cons_Vault.C_Schedule_Code_description
ORDER BY dbo.Cons_Vault.C_Schedule_Code



DROP TABLE [mSCOA_Vault].[dbo].[Z_FinReport_C2C]
GO






SELECT   dbo.T1.Municipality, dbo.T1.FinYR_End, dbo.T1.C_Schedule_Sheet,dbo.Cons_Vault.mSCOA_Table, dbo.T1.C_Schedule_Code, dbo.T1.C_Schedule_Code_description, dbo.T1.Period, SUM(dbo.T1.Amount) AS Amount



Into Z_FinReport_C2C
FROM            dbo.T1 LEFT OUTER JOIN
                         dbo.Cons_Vault ON dbo.T1.Item = dbo.Cons_Vault.GUID
WHERE        (dbo.Cons_Vault.mSCOA_Table = 'IR') OR
                         (dbo.Cons_Vault.mSCOA_Table = 'IE') OR
                         (dbo.Cons_Vault.mSCOA_Table = 'IZ')
GROUP BY dbo.Cons_Vault.mSCOA_Table,dbo.T1.Municipality, dbo.T1.FinYR_End, dbo.T1.C_Schedule_Sheet, dbo.T1.C_Schedule_Code, dbo.T1.C_Schedule_Code_description, dbo.T1.Period
ORDER BY dbo.T1.C_Schedule_Code



DROP TABLE [mSCOA_Vault].[dbo].[Z_FinReport_C4_C6]
GO



SELECT        TOP (100) PERCENT dbo.Z_FinReporting_DB.Municipality, dbo.Z_FinReporting_DB.FinYR_End, dbo.Z_FinReporting_DB.Period, dbo.Cons_Vault.C_Schedule_Sheet, dbo.Cons_Vault.C_Schedule_Code, 
                         dbo.Cons_Vault.C_Schedule_Code_description, SUM(dbo.Z_FinReporting_DB.Amount) AS Amount, dbo.Cons_Vault.mSCOA_Table, dbo.Cons_Vault.Change_Effect, dbo.Cons_Vault.Posting_Allowed, 
                         dbo.Cons_Vault.Account_Name, dbo.Cons_Vault.Level_Name

into [mSCOA_Vault].[dbo].[Z_FinReport_C4_C6]
FROM            dbo.Z_FinReporting_DB LEFT OUTER JOIN
                         dbo.Cons_Vault ON dbo.Z_FinReporting_DB.Item = dbo.Cons_Vault.GUID
GROUP BY dbo.Z_FinReporting_DB.Municipality, dbo.Z_FinReporting_DB.FinYR_End, dbo.Z_FinReporting_DB.Period, dbo.Cons_Vault.C_Schedule_Sheet, dbo.Cons_Vault.C_Schedule_Code, dbo.Cons_Vault.C_Schedule_Code_description,
                          dbo.Cons_Vault.mSCOA_Table, dbo.Cons_Vault.Change_Effect, dbo.Cons_Vault.Posting_Allowed, dbo.Cons_Vault.Account_Name, dbo.Cons_Vault.Level_Name
ORDER BY dbo.Cons_Vault.C_Schedule_Code



Drop Table [mSCOA_Vault].[dbo].[Z_FinReport_C7]
Go
SELECT        dbo.Z_Sanity_DB.*, dbo.Cons_Vault.C_Schedule_Sheet, dbo.Cons_Vault.C_Schedule_Code, dbo.Cons_Vault.C_Schedule_Code_description
into [mSCOA_Vault].[dbo].[Z_FinReport_C7]

FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.Fund = dbo.Cons_Vault.GUID


Drop Table [mSCOA_Vault].[dbo].[Z_FinReport_C5]
Go
SELECT        dbo.Z_Sanity_DB.*, dbo.Cons_Vault.C_Schedule_Sheet, dbo.Cons_Vault.C_Schedule_Code, dbo.Cons_Vault.C_Schedule_Code_description
into [mSCOA_Vault].[dbo].[Z_FinReport_C5]
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.Project = dbo.Cons_Vault.GUID


---- Sanity Tests
Drop Table [mSCOA_Vault].[dbo].[Z_Sanity_DB]


SELECT    dbo.Z_FinReporting_DB.Municipality
, dbo.Z_FinReporting_DB.FinYR_End
, dbo.Z_FinReporting_DB.[Period]
, dbo.Z_FinReporting_DB.Project
, dbo.Cons_Vault.[Account_Number_LongCode] as Project_LongCode
, dbo.Cons_Vault.Account_Name as Project_Name
, dbo.Z_FinReporting_DB.Item
 , dbo.Cons_Vault.[Account_Number_LongCode] as Item_LongCode
, dbo.Cons_Vault.Account_Name as Item_Name
 , dbo.Z_FinReporting_DB.[Function]
 , dbo.Cons_Vault.[Account_Number_LongCode] as Function_LongCode
, dbo.Cons_Vault.Account_Name as Function_Name
, dbo.Z_FinReporting_DB.Fund
 , dbo.Cons_Vault.[Account_Number_LongCode]  as Fund_LongCode
, dbo.Cons_Vault.Account_Name as Fund_Name
, dbo.Z_FinReporting_DB.Costing
 , dbo.Cons_Vault.[Account_Number_LongCode] as  Cost_LongCode
, dbo.Cons_Vault.Account_Name As Cost_Name
, dbo.Z_FinReporting_DB.Region
 , dbo.Cons_Vault.[Account_Number_LongCode]  as Region_LongCode
, dbo.Cons_Vault.Account_Name as Region_Name
, dbo.Z_FinReporting_DB.Amount

Into Z_Sanity_DB

FROM   dbo.Z_FinReporting_DB INNER JOIN
                         dbo.Cons_Vault ON Left(dbo.Z_FinReporting_DB.Project,36) = dbo.Cons_Vault.GUID

Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Project_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Project_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.Project = dbo.Cons_Vault.GUID

						 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Item_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Item_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.Item = dbo.Cons_Vault.GUID

						 					 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Function_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Function_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.[Function] = dbo.Cons_Vault.GUID


						 						 					 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Function_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Function_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.[Function] = dbo.Cons_Vault.GUID

						 					 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Fund_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Fund_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.[Fund] = dbo.Cons_Vault.GUID


						 
						 					 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Cost_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Cost_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.[Costing] = dbo.Cons_Vault.GUID


						 
						 					 
Update Z_Sanity_DB
SET dbo.Z_Sanity_DB.Region_LongCode = dbo.Cons_Vault.Account_Number_LongCode
, dbo.Z_Sanity_DB.Region_Name = dbo.Cons_Vault.Account_Name
FROM            dbo.Z_Sanity_DB INNER JOIN
                         dbo.Cons_Vault ON dbo.Z_Sanity_DB.[Region] = dbo.Cons_Vault.GUID
						 
						 
