/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [RATE_CAT]
      ,[DESC]
      ,[Division]
      ,[Name]
      ,[Code]
      ,[MainCode]
      ,[Mains]
      ,[SubCode]
      ,[Sub]
      ,[Doc_Type]
      ,[Div__FiCa]
      ,[FiCa_Mains]
      ,[Subs_FiCa]
      ,[DbtCnt_GL]
      ,[Revenue_GL]
      ,[SAP_Code]
      ,[SAP_Description]
      ,[Non_Fin_Group_Code]
      ,[Non_Fin_Group_Description]
      ,[Non_Fin_Sub_Group_Code]
      ,[Non_Fin_Sub_Group_Description]
      ,[Project_Guid]
      ,[Project_Description]
      ,[Function_Guid]
      ,[Function_Description]
      ,[Fund_Guid]
      ,[Fund_Description]
      ,[Region_Guid]
      ,[Region_Description]
      ,[Costing_Guid]
      ,[Costing_Description]
      ,[Recommended_Invoice_Guid]
      ,[Recommended_Invoice_Description]
      ,[Recommended_Receipt_Guid]
      ,[Recommended_Receipt_Description]
      ,[Id_ISU_Vault]
  FROM [mSCOA_Vault].[dbo].[Lookup_Vault_ISU]

  delete Vault 
  
  where [RATE_CAT] is null
      and[DESC] is null
      and[Division] is null
      and[Name] is null
      and[Code] is null
      and[MainCode] is null
      and[Mains] is null
      and[SubCode] is null
      and[Sub] is null
      and[Doc_Type] is null
      and[Div__FiCa]is null
      and[FiCa_Mains] is null
      and[Subs_FiCa] is null