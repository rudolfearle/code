------[get recon key to be removed]
SELECT Recon_Key,[FINYEAR],[FINMONTH],[Old Account]
into Temp_ReconKeyDelete
  FROM [mSCOA_Vault].[dbo].[FACT_ISU],
where Recon_Key in (SELECT   [RECONKEY],[FINYEAR],[FINMONTH],[Old Account]   FROM [mSCOA_Vault].[dbo].[Stageing_SPL] )
go

-----[delete records in staging with selected reconkey from temp table]
Delete FROM [mSCOA_Vault].[dbo].[Stageing_SPL] where Recon_Key in (Select Recon_Key FROM  Temp_ReconKeyDelete)
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
       a.[RATE_CAT] = b.[Rate_Cat]
	   AND a.[Doc_Type] = b.[Doc_Type]
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND a.[Revenue_GL] = b.[Revenue_GL]
	  
where b.[RECON_KEY] in (Select Recon_Key FROM  Temp_ReconKeyDelete)
group by b.[RECON_KEY] ,a.[Project_Guid] ,a.[Function_Guid] ,a.[Fund_Guid],a.[Recommended_Invoice_Guid] ,a.[Region_Guid]
      ,a.[Costing_Guid] ,a.[DbtCnt_GL]
	  --,a.[Revenue_GL] 
go

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
       a.[RATE_CAT] = b.[Rate_Cat]
	   AND a.[Doc_Type] = b.[Doc_Type]
	   AND a.[Div__FiCa] = b.[Div__FiCa]
	   AND a.[FiCa_Mains] = b.[FiCa_Mains]
	   AND a.[Subs_FiCa] = b.[Subs_FiCa]
	   AND a.[DbtCnt_GL] = b.[DbtCnt_GL]
	   AND a.[Revenue_GL] = b.[Revenue_GL]
	  
where b.[RECON_KEY] in (Select Recon_Key FROM  Temp_ReconKeyDelete)
group by b.[RECON_KEY] ,a.[Project_Guid] ,a.[Function_Guid] ,a.[Fund_Guid],a.[Recommended_Invoice_Guid] ,a.[Region_Guid]
      ,a.[Costing_Guid],a.[Revenue_GL] 
go


-----Wat as nie alle data terug kom nie????????


---[verify] 
SELECT   count(Recon_Key) as oldCount   FROM Temp_ReconKeyDelete

SELECT Count(Recon_Key) as newCount
  FROM [mSCOA_Vault].[dbo].[FACT_ISU] a
  inner join [mSCOA_Vault].[dbo].[Stageing_SPL] b on b.Recon_Key = a.Recon_Key


----[drop temp
drop table Temp_ReconKeyDelete