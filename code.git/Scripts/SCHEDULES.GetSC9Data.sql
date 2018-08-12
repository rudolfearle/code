
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Rudolf J Earle>
-- Create date: <Create Date,,12 August 2018>
-- Description:	<Description,,Get SC9 Data for C-Schedule>
-- =============================================
CREATE PROCEDURE SCHEDULES.GetSC9Data 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select c.Ledger_Group_Description as Ledger_type, c.[Schedule_Code] as SC9
		,abs(isnull(sum(cast([Audit Outcome_3] as Decimal(18, 2))),0.00)) as [Budget1]  
		,abs(isnull(sum(cast([Audit Outcome_2] as Decimal(18, 2))),0.00)) as  [Budget2] 
		,abs(isnull(sum(cast([Audit Outcome_1] as Decimal(18, 2))),0.00)) as [Budget3]  
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
									
		,abs(isnull(sum(cast([PM01] as Decimal(18, 2))),0.00)) AS [PM01]
		,abs(isnull(sum(cast([PM02] as Decimal(18, 2))),0.00)) AS [PM02]
		,abs(isnull(sum(cast([PM03] as Decimal(18, 2))),0.00)) AS [PM03]
		,abs(isnull(sum(cast([PM04] as Decimal(18, 2))),0.00)) AS [PM04]
		,abs(isnull(sum(cast([PM05] as Decimal(18, 2))),0.00)) AS [PM05]
		,abs(isnull(sum(cast([PM06] as Decimal(18, 2))),0.00)) AS [PM06]
		,abs(isnull(sum(cast([PM07] as Decimal(18, 2))),0.00)) AS [PM07]
		,abs(isnull(sum(cast([PM08] as Decimal(18, 2))),0.00)) AS [PM08]
		,abs(isnull(sum(cast([PM09] as Decimal(18, 2))),0.00)) AS [PM09]
		,abs(isnull(sum(cast([PM10] as Decimal(18, 2))),0.00)) AS [PM10]
		,abs(isnull(sum(cast([PM11] as Decimal(18, 2))),0.00)) AS [PM11]
		,abs(isnull(sum(cast([PM12] as Decimal(18, 2))),0.00)) AS [PM12]
	                        --,abs(isnull(sum(cast([MonthTotal]  as Decimal(18, 2))),0.00)) as YearTDA

	from [mSCOA_Vault].[dbo].[Reporting] a
	INNER JOIN [mSCOA_Vault].[dbo].[Cons_Vault] c on c.[Recommended_Invoice_Guid] = a.mSCOA_Item_Guid 
	where c.[Schedule_Sheet] = 'SA30' and c.Ledger_Group_Description in ('Revenue','Expenditure')
	GROUP BY c.[Schedule_Code],c.Ledger_Group_Description
   order by c.Ledger_Group_Description,c.[Schedule_Code]

END
GO
