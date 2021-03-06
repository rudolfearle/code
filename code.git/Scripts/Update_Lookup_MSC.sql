
--Alter table dbo.Lookup_MSC alter Column Cost_Center Varchar(50)
--Alter table dbo.FACT_ORGB2019_OPEX alter Column MSC  Varchar(50)
--Alter table dbo.Lookup_MSC alter  Column [Function_Lcode] Varchar(38)
--Alter table dbo.Lookup_MSC alter Column  [Function] Varchar(210)
--Alter table dbo.Lookup_MSC alter Column [Region_Lcode] Varchar(38)
--Alter table dbo.Lookup_MSC alter column [Region] Varchar(210)


Update  dbo.Lookup_MSC
Set [Function_Scode]    = [dbo].[FACT_ORGB2019_OPEX].[FUNCTION]
FROM            dbo.Lookup_MSC INNER JOIN
                         dbo.FACT_ORGB2019_OPEX ON dbo.Lookup_MSC.Cost_Center = dbo.FACT_ORGB2019_OPEX.MSC


Update  dbo.Lookup_MSC
SET        dbo.Lookup_MSC.Function_Guid = dbo.Lookup_Vault.mSCOA_GUID
FROM            dbo.Lookup_MSC INNER JOIN
                         dbo.Lookup_Vault ON dbo.Lookup_MSC.Function_Scode = dbo.Lookup_Vault.Short_Code



						 
Update  dbo.Lookup_MSC
SET   [Function_Lcode] = [dbo].[Cons_Vault].[Account_Number_LongCode]
,  [Function] = [dbo].[Cons_Vault].[Account_Name]
FROM            dbo.Lookup_MSC INNER JOIN
                      [dbo].[Cons_Vault]    ON dbo.Lookup_MSC.[Function_Guid] = [dbo].[Cons_Vault].[GUID]
