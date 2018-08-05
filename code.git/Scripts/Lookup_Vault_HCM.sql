SELECT        TOP (100) PERCENT dbo.Lookup_HCM_EMPGroup.PERSG, dbo.Lookup_HCM_EMPGroup.PTEXT, dbo.Lookup_HCM_EMPSubGroup.PERSK, dbo.Lookup_HCM_EMPSubGroup.PTEXT AS Expr1, dbo.Lookup_FI_MSC.Cost_Center, 
                         dbo.Lookup_FI_MSC.Description, dbo.Lookup_FI_GL.G_L_acct, dbo.Lookup_FI_GL.Short_Text, dbo.Lookup_FI_GL.GUID, dbo.Lookup_FI_GL.GUID_Description, dbo.Lookup_FI_GL.Project_Guid, 
                         dbo.Lookup_FI_GL.Project_Description, dbo.Lookup_FI_GL.Fund_Guid, dbo.Lookup_FI_GL.Fund_Description, dbo.Lookup_FI_GL.Recommended_Invoice_Guid, dbo.Lookup_FI_GL.Recommended_Invoice_Description, 
                         dbo.Lookup_FI_GL.Recommended_Receipt_Guid, dbo.Lookup_FI_GL.Recommended_Receipt_Description, dbo.Lookup_FI_MSC.[Function], dbo.Lookup_FI_MSC.Function_Guid AS Expr2, dbo.Lookup_FI_MSC.Function_Lcode, 
                         dbo.Lookup_FI_MSC.Function_Scode, dbo.Lookup_FI_MSC.Region, dbo.Lookup_FI_MSC.Region_Guid, dbo.Lookup_FI_MSC.Region_LCode, dbo.Lookup_FI_MSC.Region_SCode

Into Lookup_Vault_HCM
FROM            dbo.FACT_HCM LEFT OUTER JOIN
                         dbo.Lookup_FI_MSC ON dbo.FACT_HCM.Cost_Ctr = dbo.Lookup_FI_MSC.Cost_Center LEFT OUTER JOIN
                         dbo.Lookup_FI_GL ON dbo.FACT_HCM.Account = dbo.Lookup_FI_GL.G_L_acct LEFT OUTER JOIN
                         dbo.Lookup_HCM_EMPGroup ON dbo.FACT_HCM.EEGrp = dbo.Lookup_HCM_EMPGroup.PERSG LEFT OUTER JOIN
                         dbo.Lookup_HCM_EMPSubGroup ON dbo.FACT_HCM.ESgrp = dbo.Lookup_HCM_EMPSubGroup.PERSK
GROUP BY dbo.Lookup_HCM_EMPGroup.PERSG, dbo.Lookup_HCM_EMPGroup.PTEXT, dbo.Lookup_HCM_EMPSubGroup.PERSK, dbo.Lookup_HCM_EMPSubGroup.PTEXT, dbo.Lookup_FI_GL.G_L_acct, dbo.Lookup_FI_GL.Short_Text, 
                         dbo.Lookup_FI_GL.GUID, dbo.Lookup_FI_GL.GUID_Description, dbo.Lookup_FI_GL.Project_Guid, dbo.Lookup_FI_GL.Project_Description, dbo.Lookup_FI_GL.Fund_Guid, dbo.Lookup_FI_GL.Fund_Description, 
                         dbo.Lookup_FI_GL.Recommended_Invoice_Guid, dbo.Lookup_FI_GL.Recommended_Invoice_Description, dbo.Lookup_FI_GL.Recommended_Receipt_Guid, dbo.Lookup_FI_GL.Recommended_Receipt_Description, 
                         dbo.Lookup_FI_MSC.Cost_Center, dbo.Lookup_FI_MSC.Description, dbo.Lookup_FI_MSC.[Function], dbo.Lookup_FI_MSC.Function_Guid, dbo.Lookup_FI_MSC.Function_Lcode, dbo.Lookup_FI_MSC.Function_Scode, 
                         dbo.Lookup_FI_MSC.Region, dbo.Lookup_FI_MSC.Region_Guid, dbo.Lookup_FI_MSC.Region_LCode, dbo.Lookup_FI_MSC.Region_SCode
ORDER BY dbo.Lookup_FI_GL.G_L_acct, dbo.Lookup_FI_MSC.Cost_Center