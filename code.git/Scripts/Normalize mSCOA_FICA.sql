/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
     *--Sum([FiCA_Amount])
   
  FROM [mSCOA_Vault].[dbo].[COT_SCOA_FICA]

  Update [mSCOA_Vault].[dbo].[COT_SCOA_FICA]

  Set FiCA_Amount = 'a'+ Replace( FiCA_Amount,'-','')

  Where FiCA_Amount like '%-'

  
  Update [mSCOA_Vault].[dbo].[COT_SCOA_FICA]

  Set FiCA_Amount = Replace( FiCA_Amount,'a ','-')

  Where FiCA_Amount like 'a %'

  Alter table [mSCOA_Vault].[dbo].[COT_SCOA_FICA] alter column [FiCA_Amount] Money


   Update [mSCOA_Vault].[dbo].[COT_SCOA_FICA]

  Set FI_Amount = 'a'+ Replace( FI_Amount,'-','')

  Where FI_Amount like '%-'

  
  Update [mSCOA_Vault].[dbo].[COT_SCOA_FICA]

  Set FI_Amount = Replace( FI_Amount,'a ','-')

  Where FI_Amount like 'a %'

  Alter table [mSCOA_Vault].[dbo].[COT_SCOA_FICA] alter column [FI_Amount] Money