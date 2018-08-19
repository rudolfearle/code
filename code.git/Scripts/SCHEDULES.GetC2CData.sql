USE [mSCOA_Vault]
GO
/****** Object:  StoredProcedure [SCHEDULES].[GetC2CData]    Script Date: 2018/08/19 17:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Rudolf J Earle>
-- Create date: <Create Date,,11/08/2018>
-- Description:	<Description,,Get C2C Schedule Data>
-- =============================================
ALTER PROCEDURE [SCHEDULES].[GetC2CData]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select left(c.[Account_Number_LongCode],2) as t, C.[Schedule_Code] as C2C,a.[Ledger_Group_Description] as Ledger_type
		,abs(isnull(sum(cast([Audit Outcome_3] as Decimal(18, 2))),0.00)) as [AuditOutCome_3]  
		,abs(isnull(sum(cast([Audit Outcome_2] as Decimal(18, 2))),0.00)) as  [AuditOutCome_2]  
		,abs(sum(Aud.ad)) as [AuditOutcome_1]    
		,abs(isnull(sum(cast([ORGB] as Decimal(18, 2))),0.00)) as [Original Budget]  
		,abs(isnull(sum(cast([ADJB] as Decimal(18, 2))),0.00)) as [Adjusted Budget]  
		,abs(isnull(sum(cast([Full Year Forecast] as Decimal(18, 2))),0.00)) as [Full Year Forecast]  
		,abs(sum(Pln.p)) as  [YearTDBudget] 
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
	--INNER JOIN [mSCOA_Vault].[dbo].[Cons_Vault] b on b.[Function_Guid] = a.mSCOA_Function_Guid 
	INNER JOIN [mSCOA_Vault].[dbo].[Cons_Vault] c on c.[Guid] = a.mSCOA_Item_Guid 
	Cross apply ( Select (isnull([AM1],0) + isnull([AM2],0) + isnull([AM3],0) + isnull([AM4],0) + isnull([AM5],0) + isnull([AM6],0) + isnull([AM7],0) + isnull([AM8],0) + isnull([AM9],0) + isnull([AM10],0) + isnull([AM11],0) + isnull([AM12],0)) as Ad ) as  Aud
	Cross apply ( Select (isnull([PM01],0) + isnull([PM02],0) + isnull([PM03],0) + isnull([PM04],0) + isnull([PM05],0) + isnull([PM06],0) + isnull([PM07],0) + isnull([PM08],0) + isnull([PM09],0) + isnull([PM10],0) + isnull([PM11],0) + isnull([PM12],0)) as p ) as  Pln
	where C.[Schedule_Sheet] = '2A' and a.[Source] = 'SPL'
	GROUP BY a.[Ledger_Group_Description],C.[Schedule_Code],left(c.[Account_Number_LongCode],2)
   order by C.[Schedule_Code]

END
