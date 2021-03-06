
  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add ECC_Structure_Desc Varchar (200)
   Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add CC_Desc Varchar (200)
    Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Function_GUID]  Varchar (50)
	  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Function_Desc]  Varchar (300)
	      Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Fund_SC] Varchar (50)
		  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Fund_GUID]  Varchar(50)
	  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Fund_Desc]  Varchar(300)
	          Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Project_SC]  Varchar(50)
		  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Project_GUID]  Varchar (50)
	  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Project_Desc]  Varchar(300)
	      Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Region_SC] Varchar(50)
		  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Region_GUID] Varchar(50)
	  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Region_Desc] Varchar(300)
	      Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Costing_SC]Varchar (50)
		  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Costing_GUID] Varchar(50)
	  Alter Table [mSCOA_Vault].[dbo].[Lookup_Vault_Budget_2Segment_Combo] add [Costing_Desc] Varchar(300)


	  Update dbo.Lookup_Vault

	  SET        dbo.Lookup_Vault.Short_Code = dbo.Lookup_Vault_Budget_2Segment_Combo.Short_Code 
	  , dbo.Lookup_Vault.G_L_Account =  dbo.Lookup_Vault_Budget_2Segment_Combo.New_GL
FROM            dbo.Lookup_Vault LEFT OUTER JOIN
                         dbo.Lookup_Vault_Budget_2Segment_Combo ON dbo.Lookup_Vault.mSCOA_GUID = dbo.Lookup_Vault_Budget_2Segment_Combo.ITEM_GUID

 Update dbo.Lookup_Vault_Budget_2Segment_Combo
SET        dbo.Lookup_Vault_Budget_2Segment_Combo.Project_SC = dbo.FACT_ORGB2019_OPEX.PROJECT
, dbo.Lookup_Vault_Budget_2Segment_Combo.Region_SC =  dbo.FACT_ORGB2019_OPEX.REGION
, dbo.Lookup_Vault_Budget_2Segment_Combo.Costing_SC =  dbo.FACT_ORGB2019_OPEX.COSTING
, dbo.Lookup_Vault_Budget_2Segment_Combo.Fund_SC =  dbo.FACT_ORGB2019_OPEX.FUND
FROM            dbo.Lookup_Vault_Budget_2Segment_Combo LEFT OUTER JOIN
                         dbo.FACT_ORGB2019_OPEX ON dbo.Lookup_Vault_Budget_2Segment_Combo.CC = dbo.FACT_ORGB2019_OPEX.MSC
						 
						  AND dbo.Lookup_Vault_Budget_2Segment_Combo.Short_Code = dbo.FACT_ORGB2019_OPEX.ITEM

 Update dbo.Lookup_Vault_Budget_2Segment_Combo
SET        dbo.Lookup_Vault_Budget_2Segment_Combo.ITEM_GUID = dbo.Lookup_Vault.mSCOA_GUID
, dbo.Lookup_Vault_Budget_2Segment_Combo.mSCOA_Account= dbo.Lookup_Vault.GUID_DESC
FROM            dbo.Lookup_Vault_Budget_2Segment_Combo LEFT OUTER JOIN
                         dbo.Lookup_Vault ON dbo.Lookup_Vault_Budget_2Segment_Combo.Short_Code = dbo.Lookup_Vault.Short_Code

Update dbo.Lookup_Vault_Budget_2Segment_Combo
SET      dbo.Lookup_Vault_Budget_2Segment_Combo.Project_GUID=  dbo.Lookup_Vault.mSCOA_GUID
, dbo.Lookup_Vault_Budget_2Segment_Combo.Project_Desc= dbo.Lookup_Vault.GUID_DESC
FROM            dbo.Lookup_Vault_Budget_2Segment_Combo LEFT OUTER JOIN
                         dbo.Lookup_Vault ON dbo.Lookup_Vault_Budget_2Segment_Combo.Project_SC = dbo.Lookup_Vault.Short_Code


Update dbo.Lookup_Vault_Budget_2Segment_Combo
SET         dbo.Lookup_Vault_Budget_2Segment_Combo.Region_GUID = dbo.Lookup_Vault.mSCOA_GUID
, dbo.Lookup_Vault_Budget_2Segment_Combo.Region_Desc=  dbo.Lookup_Vault.GUID_DESC
FROM            dbo.Lookup_Vault_Budget_2Segment_Combo LEFT OUTER JOIN
                         dbo.Lookup_Vault ON dbo.Lookup_Vault_Budget_2Segment_Combo.Region_SC = dbo.Lookup_Vault.Short_Code


Update dbo.Lookup_Vault_Budget_2Segment_Combo
SET         dbo.Lookup_Vault_Budget_2Segment_Combo.Fund_GUID= dbo.Lookup_Vault.mSCOA_GUID
, dbo.Lookup_Vault_Budget_2Segment_Combo.Fund_Desc = dbo.Lookup_Vault.GUID_DESC
FROM            dbo.Lookup_Vault_Budget_2Segment_Combo LEFT OUTER JOIN
                         dbo.Lookup_Vault ON dbo.Lookup_Vault_Budget_2Segment_Combo.Fund_SC = dbo.Lookup_Vault.Short_Code
