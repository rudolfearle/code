
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Rudolf J Earle>
-- Create date: <Create Date,,11/08/2018>
-- Description:	<Description,,Get C3C Schedule Data>
-- =============================================
CREATE PROCEDURE SCHEDULES.GetC3CData

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select isnull(a.[Dir_Code],'No Value') as dircode, isnull(a.[Department],'No Value') as C2C,a.[Ledger_Group_Description] as Ledger_type
		,abs(isnull(sum(cast([Audit Outcome_3] as Decimal(18, 2))),0.00)) as [AuditOutCome_3]  
		,abs(isnull(sum(cast([Audit Outcome_2] as Decimal(18, 2))),0.00)) as  [AuditOutCome_2]  
		,abs(isnull(sum(cast([Audit Outcome_1] as Decimal(18, 2))),0.00)) as [AuditOutcome_1]  
		,abs(isnull(sum(cast([ORGB] as Decimal(18, 2))),0.00)) as [Original Budget]  
		,abs(isnull(sum(cast([ADJB] as Decimal(18, 2))),0.00)) as [Adjusted Budget]  
		,abs(isnull(sum(cast([Full Year Forecast] as Decimal(18, 2))),0.00)) as [Full Year Forecast]  
		,abs(isnull(sum([Budget_Q1] + [Budget_Q2] + [Budget_Q3] + [Budget_Q4]),0.00)) as  [YearTDBudget]  
		,abs(isnull(sum(cast([M01] as Decimal(18, 2))),0.00)) as M01
		,abs(isnull(sum(cast([M02] as Decimal(18, 2))),0.00)) as M02
		,abs(isnull(sum(cast([M03] as Decimal(18, 2))),0.00)) as M03
		,abs(isnull(sum(cast([M04] as Decimal(18, 2))),0.00)) as M04
		,abs(isnull(sum(cast([M05] as Decimal(18, 2))),0.00)) as M05
		,abs(isnull(sum(cast([M06] as Decimal(18, 2))),0.00)) as M06
		,abs(isnull(sum(cast([M07] as Decimal(18, 2))),0.00)) as M07
		,abs(isnull(sum(cast([M08] as Decimal(18, 2))),0.00)) as M08
		,abs(isnull(sum(cast([M09] as Decimal(18, 2))),0.00)) as M09
		,abs(isnull(sum(cast([M10] as Decimal(18, 2))),0.00)) as M10
		,abs(isnull(sum(cast([M11] as Decimal(18, 2))),0.00)) as M11
		,abs(isnull(sum(cast([M12] as Decimal(18, 2))),0.00)) as M12
							
		,abs(isnull(sum(cast([YTD01] as Decimal(18, 2))),0.00)) AS [YTD01]
		,abs(isnull(sum(cast([YTD02] as Decimal(18, 2))),0.00)) AS [YTD02]
		,abs(isnull(sum(cast([YTD03] as Decimal(18, 2))),0.00)) AS [YTD03]
		,abs(isnull(sum(cast([YTD04] as Decimal(18, 2))),0.00)) AS[YTD04]
		,abs(isnull(sum(cast([YTD05] as Decimal(18, 2))),0.00)) AS [YTD05]
		,abs(isnull(sum(cast([YTD06] as Decimal(18, 2))),0.00)) AS [YTD06]
		,abs(isnull(sum(cast([YTD07] as Decimal(18, 2))),0.00)) AS [YTD07]
		,abs(isnull(sum(cast([YTD08] as Decimal(18, 2))),0.00)) AS [YTD08]
		,abs(isnull(sum(cast([YTD09] as Decimal(18, 2))),0.00)) AS [YTD09]
		,abs(isnull(sum(cast([YTD10] as Decimal(18, 2))),0.00)) AS [YTD10]
		,abs(isnull(sum(cast([YTD11] as Decimal(18, 2))),0.00)) AS [YTD11]
		,abs(isnull(sum(cast([YTD12] as Decimal(18, 2))),0.00)) AS [YTD12]
	                        --,abs(isnull(sum(cast([MonthTotal]  as Decimal(18, 2))),0.00)) as YearTDA

	from [mSCOA_Vault].[dbo].[Reporting] a
	INNER JOIN [mSCOA_Vault].[dbo].[Cons_Vault] b on b.[Function_Guid] = a.mSCOA_Function_Guid 
	INNER JOIN [mSCOA_Vault].[dbo].[Cons_Vault] c on c.[Recommended_Invoice_Guid] = a.mSCOA_Item_Guid 
	where b.[Schedule_Sheet] = '3A'
	GROUP BY a.[Dir_Code],a.[Department], a.[Ledger_Group_Description],b.[Schedule_Code]
   order by a.[Ledger_Group_Description],a.[Dir_Code],a.[Department]--,b.[Schedule_Code]

END
GO