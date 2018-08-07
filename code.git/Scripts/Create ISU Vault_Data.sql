Alter Table [Lookup_ISU_Vault]
Add Id_ISU_Vault Int Identity(1, 1)
Go


INSERT INTO [dbo].[Lookup_ISU_Vault]
           ([RATE_CAT],[DESC],[Division],
		   [Name],[Code] ,
		   [MainCode],[Mains],[SubCode] ,
		   [Sub],[Doc_Type],[Div__FiCa]
           ,[FiCa_Mains] ,[Subs_FiCa],[DbtCnt_GL],[Revenue_GL],[SAP_Code],[SAP_Description],[Non_Fin_Group_Code]
           
		   ,[Non_Fin_Group_Description],[Non_Fin_Sub_Group_Code],[Non_Fin_Sub_Group_Description],[Project_Guid]
           
		   ,[Project_Description],[Function_Guid],[Function_Description],[Fund_Guid],[Fund_Description]
          
           ,[Recommended_Invoice_Guid],[Recommended_Invoice_Description],[Recommended_Receipt_Guid],[Recommended_Receipt_Description])
SELECT  dbo.Lookup_ISU_ADID.RATE_CAT, dbo.Lookup_ISU_ADID.[DESC], dbo.Lookup_ISU_Division.Division,
       dbo.Lookup_ISU_Division.Name, dbo.Lookup_ISU_Doc_Type.Code, 
       dbo.Lookup_ISU_Mains_Subs.MainCode, dbo.Lookup_ISU_Mains_Subs.Mains, dbo.Lookup_ISU_Mains_Subs.SubCode,
	    dbo.Lookup_ISU_Mains_Subs.Sub, dbo.FACT_SCOA_FICA.Doc_Type, dbo.FACT_SCOA_FICA.Div__FiCa
	  ,dbo.FACT_SCOA_FICA.FiCa_Mains, dbo.FACT_SCOA_FICA.Subs_FiCa, dbo.FACT_SCOA_FICA.DbtCnt_GL, 
	  dbo.FACT_SCOA_FICA.Revenue_GL, dbo.Cons_Vault.SAP_Code, dbo.Cons_Vault.SAP_Description, dbo.Cons_Vault.Non_Fin_Group_Code,
	   
	   dbo.Cons_Vault.Non_Fin_Group_Description, dbo.Cons_Vault.Non_Fin_Sub_Group_Code,
	   dbo.Cons_Vault.Non_Fin_Sub_Group_Description, dbo.Cons_Vault.Project_Guid,

	  dbo.Cons_Vault.Project_Description, dbo.Cons_Vault.Function_Guid, dbo.Cons_Vault.Function_Description,
	   dbo.Cons_Vault.Fund_Guid, dbo.Cons_Vault.Fund_Description,
	 
	 dbo.Cons_Vault.Recommended_Invoice_Guid, dbo.Cons_Vault.Recommended_Invoice_Description,
	  dbo.Cons_Vault.Recommended_Receipt_Guid, dbo.Cons_Vault.Recommended_Receipt_Description
FROM            dbo.FACT_SCOA_FICA LEFT OUTER JOIN
                         dbo.Cons_Vault ON dbo.FACT_SCOA_FICA.SCOA_RV_GL = dbo.Cons_Vault.SAP_Code AND dbo.FACT_SCOA_FICA.Div__FiCa = dbo.Cons_Vault.Devision_Code AND 
                         dbo.FACT_SCOA_FICA.FiCa_Mains = dbo.Cons_Vault.Mains_Code AND dbo.FACT_SCOA_FICA.Subs_FiCa = dbo.Cons_Vault.Subs_Code LEFT OUTER JOIN
                         dbo.Lookup_ISU_Doc_Type ON dbo.FACT_SCOA_FICA.Doc_Type = dbo.Lookup_ISU_Doc_Type.Code LEFT OUTER JOIN
                         dbo.Lookup_ISU_ADID ON dbo.FACT_SCOA_FICA.Rate_Cat = dbo.Lookup_ISU_ADID.RATE_CAT LEFT OUTER JOIN
                         dbo.Lookup_ISU_Mains_Subs ON dbo.FACT_SCOA_FICA.FiCa_Mains = dbo.Lookup_ISU_Mains_Subs.MainCode AND dbo.FACT_SCOA_FICA.Subs_FiCa = dbo.Lookup_ISU_Mains_Subs.SubCode LEFT OUTER JOIN
                         dbo.Lookup_ISU_Division ON dbo.FACT_SCOA_FICA.Div__FiCa = dbo.Lookup_ISU_Division.Division
GROUP BY dbo.Lookup_ISU_ADID.RATE_CAT, dbo.Lookup_ISU_ADID.[DESC], dbo.Lookup_ISU_Division.Division, dbo.Lookup_ISU_Division.Name, dbo.Lookup_ISU_Doc_Type.Code, dbo.Lookup_ISU_Doc_Type.[Desc], 
                         dbo.Lookup_ISU_Mains_Subs.MainCode, dbo.Lookup_ISU_Mains_Subs.Mains, dbo.Lookup_ISU_Mains_Subs.SubCode, dbo.Lookup_ISU_Mains_Subs.Sub, dbo.FACT_SCOA_FICA.Rate_Cat, dbo.FACT_SCOA_FICA.Doc_Type, 
                         dbo.FACT_SCOA_FICA.Div__FiCa, dbo.FACT_SCOA_FICA.FiCa_Mains, dbo.FACT_SCOA_FICA.Subs_FiCa, dbo.FACT_SCOA_FICA.DbtCnt_GL, dbo.FACT_SCOA_FICA.Revenue_GL, dbo.Cons_Vault.SAP_Code, 
                         dbo.Cons_Vault.SAP_Description, dbo.Cons_Vault.Non_Fin_Group_Code, dbo.Cons_Vault.Non_Fin_Group_Description, dbo.Cons_Vault.Non_Fin_Sub_Group_Code, dbo.Cons_Vault.Non_Fin_Sub_Group_Description, 
                         dbo.Cons_Vault.Project_Guid, dbo.Cons_Vault.Project_Description, dbo.Cons_Vault.Function_Guid, dbo.Cons_Vault.Function_Description, dbo.Cons_Vault.Fund_Guid, dbo.Cons_Vault.Fund_Description, 
                         dbo.Cons_Vault.Recommended_Invoice_Guid, dbo.Cons_Vault.Recommended_Invoice_Description, dbo.Cons_Vault.Recommended_Receipt_Guid, dbo.Cons_Vault.Recommended_Receipt_Description

--Lookup_ISU_Vault

delete from  Lookup_ISU_Vault
  
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