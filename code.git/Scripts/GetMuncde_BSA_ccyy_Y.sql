
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Rudolf J Earle>
-- Create date: <Create Date,,05/08/2018>
-- Description:	<Description,,GetMuncde_BSA_ccyy_Y>
-- =============================================
CREATE PROCEDURE GetMuncde_BSA_ccyy_Y
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select a.[Schedule_Code] as Code,a.[Audit Outcome_1] as EstYearEnd 
	from Reporting a
	inner join [mSCOA_Vault].[dbo].[Cons_Vault] b on  a.mSCOA_Item_Guid = b.guid 
	where a.[Schedule_Sheet] = '6'
	


END
GO
