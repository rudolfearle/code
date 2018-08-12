USE [mSCOA_Vault]
GO

Drop Table [dbo].[FACT_ISU]

/****** Object:  Table [dbo].[FACT_ISU]    Script Date: 8/11/2018 10:35:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FACT_ISU](
	[Recon_Key] [nvarchar](50) NULL,
	[AD_ID] [nvarchar](50) NULL,
	[Billing_Class] [nvarchar](50) NULL,
	[Rate_Cat] [nvarchar](50) NULL,
	[Doc_Type] [nvarchar](50) NULL,
	[Div__FiCa] [nvarchar](50) NULL,
	[FiCa_Mains] [nvarchar](50) NULL,
	[Subs_FiCa] [nvarchar](50) NULL,
	[DbtCnt_GL] [nvarchar](50) NULL,
	[Revenue_GL] [nvarchar](50) NULL,
	[FiCA_Amount] [money] NULL

) ON [PRIMARY]
GO

Delete [dbo].[FACT_ISU]

BULK INSERT FACT_ISU FROM 'C:\RLS\Code\code\code.git\Data\Load_Files_Prep\FACT_ISU.csv'
--BULK INSERT FACT_ISU FROM 'C:\Users\Steve\Desktop\Andre\FACT_ISU.csv'
WITH ( FIRSTROW=  2,
FIELDTERMINATOR = '|',
 ROWTERMINATOR = '\n'
 )
GO

--Select sum(FiCa_Amount) from FACT_ISU --227192854.75
--Select * from FACT_ISU  WHERE [Recon_Key] like '%+%' AND ISNUMERIC([Recon_Key]) = 1
UPDATE  [dbo].[FACT_ISU] SET [Recon_Key] = CAST(CAST(CAST([Recon_Key] AS FLOAT) AS NUMERIC(18,0)) AS VARCHAR(100))  WHERE [Recon_Key] like '%+%' AND ISNUMERIC([Recon_Key]) = 1
 

while(	(select count([Revenue_GL]) from [mSCOA_Vault].[dbo].[FACT_ISU] where [Revenue_GL] like '0%' ) > 0)
begin
	update [mSCOA_Vault].[dbo].[FACT_ISU] set [Revenue_GL] = substring([Revenue_GL],2,len([Revenue_GL])-1)
	where [Revenue_GL] like '0%'
end
while(	(select count([DbtCnt_GL]) from [mSCOA_Vault].[dbo].[FACT_ISU] where [DbtCnt_GL] like '0%' ) > 0)
begin
	update [mSCOA_Vault].[dbo].[FACT_ISU] set [DbtCnt_GL] = substring([DbtCnt_GL],2,len([DbtCnt_GL])-1)
	where [DbtCnt_GL] like '0%'
end


 --SELECT [Recon_Key] ,  CAST(CAST(CAST([Recon_Key] AS FLOAT) AS NUMERIC(18,0)) AS VARCHAR(100))
 --FROM [dbo].[FACT_ISU] 
 --WHERE [Recon_Key] like '%+%' AND ISNUMERIC([Recon_Key]) = 1
 

Drop table [mSCOA_Vault].[dbo].[Stageing_SPL]
go 

SELECT [RYEAR] as [FINYEAR]
      ,[POPER] as [FINMONTH]
      ,[RACCT] as [Old Account]
      ,[RCNTR] as [MSC_Code]
      ,[RZZMEASURE] as [mSCOA_SCode_Project]
      ,[RZZMEASURE_GUID] as [mSCOA_Project_Guid]
	  ,[RFAREA] as [mSCOA_SCode_Function]
      ,[RFAREA_GUID] as [mSCOA_Function_Guid]
      ,[RZZGEBER] as  [mSCOA_SCode_Fund]
      ,[RZZGEBER_GUID] as [mSCOA_Fund_Guid]
      ,[ZSCOA_ITEM] as [mSCOA_SCode_Item]
      ,[ZSCOA_ITEM_GUID] as [mSCOA_Item_Guid]
      ,[RZZREGION] as [mSCOA_SCode_Region]
      ,[RZZREGION_GUID] as [mSCOA_Region_Guid]
      ,[RZZCOSTING] as [mSCOA_SCode_Costing]
      ,[RZZCOSTING_GUID] as [mSCOA_Costing_Guid]
      ,[REFDOCNR]+ Left([AWORG],2) as RECONKEY
	  ,Sum([TSL]) as AMOUNT
	  INTO [mSCOA_Vault].[dbo].[Stageing_SPL]
  FROM [mSCOA_Vault].[dbo].[Fact_SPL]
  group By [RYEAR] 
      ,[POPER] 
      ,[RACCT] 
      ,[RCNTR] 
      ,[RZZMEASURE] 
      ,[RZZMEASURE_GUID] 
      ,[RZZGEBER] 
      ,[RZZGEBER_GUID]
      ,[ZSCOA_ITEM] 
      ,[ZSCOA_ITEM_GUID] 
      ,[RZZREGION] 
      ,[RZZREGION_GUID] 
      ,[RZZCOSTING]
      ,[RZZCOSTING_GUID]       
	  ,[REFDOCNR]
	  ,[AWORG]
	  ,[RFAREA]
      ,[RFAREA_GUID]

-- Select * from [mSCOA_Vault].[dbo].[Stageing_SPL]
--Select sum(Amount) from [mSCOA_Vault].[dbo].[Stageing_SPL] ---0.04
--Select Sum([TSL])  FROM [mSCOA_Vault].[dbo].[Fact_SPL] --- -0.04

Update dbo.Lookup_Vault 
SET       dbo.Lookup_Vault.G_L_Account = dbo.Lookup_Vault_Budget_2Segment_Combo.New_GL
FROM            dbo.Lookup_Vault INNER JOIN
                         dbo.Lookup_Vault_Budget_2Segment_Combo ON dbo.Lookup_Vault.Short_Code = dbo.Lookup_Vault_Budget_2Segment_Combo.Short_Code
 Where dbo.Lookup_Vault.G_L_Account is null


	Update [mSCOA_Vault].[dbo].[Stageing_SPL]
	SET        dbo.Stageing_SPL.mSCOA_Item_Guid = dbo.Cons_Vault.GUID
FROM            dbo.Stageing_SPL INNER JOIN
                         dbo.Cons_Vault ON dbo.Stageing_SPL.[Old Account] = dbo.Cons_Vault.SAP_Code

						 
	Update [mSCOA_Vault].[dbo].[Stageing_SPL]
	SET        dbo.Stageing_SPL.mSCOA_Item_Guid =  dbo.Lookup_Vault.mSCOA_GUID
FROM            dbo.Stageing_SPL INNER JOIN
                         dbo.Lookup_Vault ON dbo.Stageing_SPL.[Old Account] = dbo.Lookup_Vault.[G_L_Account]

	Update [mSCOA_Vault].[dbo].[Stageing_SPL]
	SET        dbo.Stageing_SPL.mSCOA_Item_Guid =  dbo.Lookup_Vault.mSCOA_GUID
FROM            dbo.Stageing_SPL INNER JOIN
                         dbo.Lookup_Vault ON dbo.Stageing_SPL.mSCOA_SCode_Item = dbo.Lookup_Vault.Short_Code



-----[get recon key to be removed]
drop table Temp_ReconKeyDelete
--Select * from Temp_ReconKeyDelete
--Select sum(FiCa_Amount) from FACT_ISU       -- 227 192 854.75
--Select Sum(Amount) from Temp_ReconKeyDelete -- 239 915 928.78 
--Select * from  [mSCOA_Vault].[dbo].[FACT_ISU] where Recon_Key not in (Select Recon_Key from Temp_ReconKeyDelete)
SELECT [Recon_Key]
      ,[DbtCnt_GL]
      ,[Revenue_GL]
	  ,[FiCA_Amount] AS Amount
  into Temp_ReconKeyDelete
  FROM [mSCOA_Vault].[dbo].[FACT_ISU]
where Recon_Key in 
	(SELECT distinct [RECONKEY]--,[FINYEAR],[FINMONTH],[Old Account] 
		FROM [mSCOA_Vault].[dbo].[Stageing_SPL] where [RECONKEY] is not null) --326366 rows - distinct rows: 88976
go

-----[delete records in staging with selected reconkey from temp table]
Delete FROM [mSCOA_Vault].[dbo].[Stageing_SPL] where [RECONKEY] IN 
(
		--Select Recon_Key FROM  Temp_ReconKeyDelete where Recon_Key is not null
		Select b.[RECON_KEY] 
		FROM [mSCOA_Vault].[dbo].[Lookup_Vault_ISU] a
		Inner join [mSCOA_Vault].[dbo].[FACT_ISU] b on 
			   ( a.[RATE_CAT] = b.[Rate_Cat]  
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = b.[Revenue_GL] ) OR
       ( a.[RATE_CAT] = NULL and b.[Rate_Cat] = NULL
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = b.[Revenue_GL] ) OR
       ( a.[RATE_CAT] = b.[Rate_Cat]  
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = NULL and b.[Revenue_GL] = NULL) OR
       ( a.[RATE_CAT] = NULL and b.[Rate_Cat] = NULL
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = NULL and b.[Revenue_GL] = NULL)
	  
		where b.[RECON_KEY] in (Select Recon_Key FROM  Temp_ReconKeyDelete)
		group by b.[RECON_KEY]     
)
go

----[insert back into staging  ]
INSERT INTO [dbo].[Stageing_SPL]
           ([RECONKEY]
		   ,[Old Account]
		   ,[mSCOA_Project_Guid]
           ,[mSCOA_Function_Guid]
           ,[mSCOA_Fund_Guid]
           ,[mSCOA_Item_Guid]
           ,[mSCOA_Region_Guid]
           ,[mSCOA_Costing_Guid]
           ,[AMOUNT])

Select b.[RECON_KEY]
	  ,a.[DbtCnt_GL]
	  --,a.[Revenue_GL] 
      ,a.[Project_Guid]
      ,a.[Function_Guid]
      ,a.[Fund_Guid]
      ,a.[Recommended_Receipt_Guid] 
      ,a.[Region_Guid]
      ,a.[Costing_Guid]
	  ,sum(isnull(b.[FiCA_Amount],0)) as Amount
FROM [mSCOA_Vault].[dbo].[Lookup_Vault_ISU] a
Inner join [mSCOA_Vault].[dbo].[FACT_ISU] b on 
       ( a.[RATE_CAT] = b.[Rate_Cat]  
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = b.[Revenue_GL] ) OR
       ( a.[RATE_CAT] = NULL and b.[Rate_Cat] = NULL
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = b.[Revenue_GL] ) OR
       ( a.[RATE_CAT] = b.[Rate_Cat]  
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = NULL and b.[Revenue_GL] = NULL) OR
       ( a.[RATE_CAT] = NULL and b.[Rate_Cat] = NULL
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = NULL and b.[Revenue_GL] = NULL)
	  
where b.[RECON_KEY] in (Select Recon_Key FROM  Temp_ReconKeyDelete)
group by b.[RECON_KEY] ,a.[Project_Guid] ,a.[Function_Guid] ,a.[Fund_Guid],
      a.[Recommended_Receipt_Guid]  ,a.[Region_Guid]
      ,a.[Costing_Guid] ,a.[DbtCnt_GL]
	  --,a.[Revenue_GL] 
go
----############################################################
--SELECT DISTINCT b.[RECON_KEY] 
--FROM [mSCOA_Vault].[dbo].[Lookup_Vault_ISU] a
--Inner join [mSCOA_Vault].[dbo].[FACT_ISU] b on 
--       a.[RATE_CAT] = b.[Rate_Cat]
--	   AND a.[Doc_Type] = b.[Doc_Type]
--	   AND a.[Div__FiCa] = b.[Div__FiCa]
--	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
--	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
--	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
--	   AND a.[Revenue_GL] = b.[Revenue_GL] 
--where b.[RECON_KEY] in (Select Recon_Key FROM  Temp_ReconKeyDelete)

--SELECT DISTINCT b.[RECON_KEY] FROM [mSCOA_Vault].[dbo].[FACT_ISU] b where b.[RECON_KEY] in (Select Recon_Key FROM  Temp_ReconKeyDelete) -- 3416


--############################################################


INSERT INTO [dbo].[Stageing_SPL]
           ([RECONKEY]
		   ,[Old Account]
		   ,[mSCOA_Project_Guid]
           ,[mSCOA_Function_Guid]
           ,[mSCOA_Fund_Guid]
           ,[mSCOA_Item_Guid]
           ,[mSCOA_Region_Guid]
           ,[mSCOA_Costing_Guid]
           ,[AMOUNT])
Select b.[RECON_KEY]
	  ,a.[Revenue_GL] 
      ,a.[Project_Guid]
      ,a.[Function_Guid]
      ,a.[Fund_Guid]
      ,a.[Recommended_Invoice_Guid] 
      ,a.[Region_Guid]
      ,a.[Costing_Guid]
	  ,sum(isnull(b.[FiCA_Amount]*-1,0)) as Amount   ---- counter vote beginsel.
FROM [mSCOA_Vault].[dbo].[Lookup_Vault_ISU] a
Inner join [mSCOA_Vault].[dbo].[FACT_ISU] b on 
         ( a.[RATE_CAT] = b.[Rate_Cat]  
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = b.[Revenue_GL] ) OR
       ( a.[RATE_CAT] = NULL and b.[Rate_Cat] = NULL
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = b.[Revenue_GL] ) OR
       ( a.[RATE_CAT] = b.[Rate_Cat]  
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = NULL and b.[Revenue_GL] = NULL) OR
       ( a.[RATE_CAT] = NULL and b.[Rate_Cat] = NULL
	   AND a.[Doc_Type] = b.[Doc_Type] 
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND  a.[Revenue_GL] = NULL and b.[Revenue_GL] = NULL)
	  
where b.[RECON_KEY] in (Select Recon_Key FROM  Temp_ReconKeyDelete)
group by b.[RECON_KEY] ,a.[Project_Guid] ,a.[Function_Guid] ,a.[Fund_Guid],a.[Recommended_Invoice_Guid] ,a.[Region_Guid]
      ,a.[Costing_Guid],a.[Revenue_GL] 
go


-----Wat as nie alle data terug kom nie????????


---[verify] 
select  'verify counts ='
SELECT   count(distinct Recon_Key) as oldCount   FROM Temp_ReconKeyDelete

SELECT Count(distinct [Recon_Key]) as newCount
  FROM [mSCOA_Vault].[dbo].[FACT_ISU] a
  inner join [mSCOA_Vault].[dbo].[Stageing_SPL] b on b.[RECONKEY] = a.Recon_Key
select  '---------------------------'


----[drop temp
--drop table Temp_ReconKeyDelete

Drop Table [mSCOA_Vault].[dbo].[Recon_SPL_ISU] 

SELECT [REFDOCNR]+ left([AWORG],2) as [RECONKEY]
      ,'SPL' As [Source]
	  ,[RACCT] as GL
      ,Sum([TSL]) Amount
 Into Recon_SPL_ISU
  FROM [mSCOA_Vault].[dbo].[Fact_SPL]
  where [REFDOCNR]+ left([AWORG],2)  in (SELECT   [REFDOCNR]+ left([AWORG],2)   FROM [mSCOA_Vault].[dbo].[FACT_ISU] where [REFDOCNR] is not null and  [AWORG] is not null)
  group by  [REFDOCNR]+ left([AWORG],2)
      ,[RACCT]
----------------------------------------------------------------------
insert Into[mSCOA_Vault].[dbo].[Recon_SPL_ISU] 

([RECONKEY]
      ,[Source]
      ,[GL]
      ,[Amount])

SELECT Recon_Key,'ISU' as [Source],[DbtCnt_GL], Sum([FiCA_Amount]) Amount

  FROM [mSCOA_Vault].[dbo].[FACT_ISU]
where Recon_Key in (SELECT   [RECONKEY]   FROM [mSCOA_Vault].[dbo].[Recon_SPL_ISU] where [RECONKEY] is not null)
Group BY  Recon_Key,[DbtCnt_GL]

-----------------------------------------------------------------------------
insert Into[mSCOA_Vault].[dbo].[Recon_SPL_ISU] 

([RECONKEY]
      ,[Source]
      ,[GL]
      ,[Amount])

SELECT Recon_Key,'ISU' as [Source],[Revenue_GL], -Sum([FiCA_Amount]) Amount

  FROM [mSCOA_Vault].[dbo].[FACT_ISU]
where Recon_Key in (SELECT   [RECONKEY]   FROM [mSCOA_Vault].[dbo].[Recon_SPL_ISU] where [RECONKEY] is not null)
Group BY  Recon_Key,[Revenue_GL]


insert Into[mSCOA_Vault].[dbo].[Recon_SPL_ISU] 

([RECONKEY]
      ,[Source]
      ,[GL]
      ,[Amount])

SELECT [RECONKEY],'SSP' as [Source],[Old Account], Sum([AMOUNT]) Amount

  FROM [mSCOA_Vault].[dbo].[Stageing_SPL]
where [RECONKEY] in (SELECT   [RECONKEY]   FROM [mSCOA_Vault].[dbo].[Recon_SPL_ISU] where [RECONKEY] is not null)
Group BY  [RECONKEY],[Old Account]





--##############################################################################

--##############################################################################

--##############################################################################

--##############################################################################

		 DROP TABLE [mSCOA_Vault].[dbo].[Stageing_SPL_G]
		SELECT
			[Old Account]
			,[MSC_Code]
			,[mSCOA_SCode_Project]
			,[mSCOA_Project_Guid]
			,[mSCOA_SCode_Function]
			,[mSCOA_Function_Guid]
			,[mSCOA_SCode_Fund]
			,[mSCOA_Fund_Guid]
			,[mSCOA_SCode_Item]
			,[mSCOA_Item_Guid]
			,[mSCOA_SCode_Region]
			,[mSCOA_Region_Guid]
			,[mSCOA_SCode_Costing]
			,[mSCOA_Costing_Guid]
			,Sum([AMOUNT]) Amount
		Into [mSCOA_Vault].[dbo].[Stageing_SPL_G]
		FROM [mSCOA_Vault].[dbo].[Stageing_SPL] 
		where [FINMONTH] = '1' and FINYEAR = '2019'
		group by  
			[Old Account]
			,[MSC_Code]
			,[mSCOA_SCode_Project]
			,[mSCOA_Project_Guid]
			,[mSCOA_SCode_Function]
			,[mSCOA_Function_Guid]
			,[mSCOA_SCode_Fund]
			,[mSCOA_Fund_Guid]
			,[mSCOA_SCode_Item]
			,[mSCOA_Item_Guid]
			,[mSCOA_SCode_Region]
			,[mSCOA_Region_Guid]
			,[mSCOA_SCode_Costing]
			,[mSCOA_Costing_Guid] 

			UPDATE Reporting SET 
				[M01] = 0


			 UPDATE R SET 
				[M01] = S.AMOUNT
				, mSCOA_Project_Guid  = S.mSCOA_Project_Guid
				, mSCOA_Function_Guid  = S.mSCOA_Function_Guid
				, mSCOA_Fund_Guid  = S.mSCOA_Fund_Guid
				, mSCOA_Item_Guid  = S.mSCOA_Item_Guid
				, mSCOA_Costing_Guid  = S.mSCOA_Costing_Guid
				, mSCOA_Region_Guid  = S.mSCOA_Region_Guid 
				--, GL_Code  = S.[Old Account]
				--, MSC_Code  = S.MSC_Code

				-- SELECT COUNT(*)
			 FROM  [mSCOA_Vault].[dbo].[Stageing_SPL_G] S

			 Left  JOIN dbo.Reporting R
			 ON S.[MSC_Code] = R.MSC_Code
			 AND S.[Old Account] = R.GL_Code
			 WHERE FINYEAR = 2019

			INSERT INTO dbo.Reporting
			(
				[M01]  
				, mSCOA_Project_Guid   
				, mSCOA_Function_Guid   
				, mSCOA_Fund_Guid   
				, mSCOA_Item_Guid 
				, mSCOA_Costing_Guid   
				, mSCOA_Region_Guid  
				,FINYEAR  
				,MSC_Code
				,GL_Code
				)
				SELECT S.AMOUNT
				  ,S.mSCOA_Project_Guid
				  ,S.mSCOA_Function_Guid
				 , S.mSCOA_Fund_Guid
				  ,S.mSCOA_Item_Guid
				  ,S.mSCOA_Costing_Guid
				  ,S.mSCOA_Region_Guid
				  ,2019 AS FINYEAR
				  ,S.[MSC_Code]
				  ,S.[Old Account]
				  FROM
				  [mSCOA_Vault].[dbo].[Stageing_SPL_G] S
				Right JOIN dbo.Reporting R
				 ON S.[MSC_Code] = R.MSC_Code
				 AND S.[Old Account] = R.GL_Code
				 WHERE  R.MSC_Code IS NULL

				  