

Update   dbo.Lookup_Vault_Cashbook

  SET        dbo.Lookup_Vault_Cashbook.Short_Text = dbo.Lookup_FI_Document_type.[Description]
FROM            dbo.Lookup_Vault_Cashbook LEFT OUTER JOIN
                         dbo.Lookup_FI_Document_type ON dbo.Lookup_Vault_Cashbook.DOCTY = dbo.Lookup_FI_Document_type.Doc__Type