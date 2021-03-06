/****** Script for SelectTopNRows command from SSMS  ******/
Drop Table [mSCOA_Vault].[dbo].[Recon_SPL_ISU] 

SELECT [REFDOCNR]+ left([AWORG],2) as [RECONKEY]
      ,'SPL' As [Source]
	  ,[RACCT] as GL
      ,Sum([TSL]) Amount
 Into Recon_SPL_ISU
  FROM [mSCOA_Vault].[dbo].[Fact_SPL]
  where [REFDOCNR]+ left([AWORG],2) in (SELECT   [REFDOCNR]+ left([AWORG],2)   FROM [mSCOA_Vault].[dbo].[FACT_ISU] )
  group by  [REFDOCNR]+ left([AWORG],2)
      ,[RACCT]

insert Into[mSCOA_Vault].[dbo].[Recon_SPL_ISU] 

([RECONKEY]
      ,[Source]
      ,[GL]
      ,[Amount])

SELECT Recon_Key,'ISU' as [Source],[DbtCnt_GL], Sum([FiCA_Amount]) Amount

  FROM [mSCOA_Vault].[dbo].[FACT_ISU]
where Recon_Key in (SELECT   [RECONKEY]   FROM [mSCOA_Vault].[dbo].[Recon_SPL_ISU] )
Group BY  Recon_Key,[DbtCnt_GL]


insert Into[mSCOA_Vault].[dbo].[Recon_SPL_ISU] 

([RECONKEY]
      ,[Source]
      ,[GL]
      ,[Amount])

SELECT Recon_Key,'ISU' as [Source],[Revenue_GL], -Sum([FiCA_Amount]) Amount

  FROM [mSCOA_Vault].[dbo].[FACT_ISU]
where Recon_Key in (SELECT   [RECONKEY]   FROM [mSCOA_Vault].[dbo].[Recon_SPL_ISU] )
Group BY  Recon_Key,[Revenue_GL]