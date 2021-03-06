USE [mSCOA_Vault]
GO
/****** Object:  StoredProcedure [SCHEDULES].[GetC7Data]    Script Date: 2018/08/19 17:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Rudolf J Earle>
-- Create date: <Create Date,,12 August 2018>
-- Description:	<Description,, get datt afor C7 Data>
-- =============================================
ALTER PROCEDURE [SCHEDULES].[GetC7Data] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  Select  b.[Schedule_Code] as C7
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
	from [mSCOA_Vault].[dbo].[Reporting] a
	INNER JOIN [mSCOA_Vault].[dbo].[Cons_Vault] b on b.[Fund_Guid] = a.mSCOA_Fund_Guid 
	Cross apply ( Select (isnull([AM1],0) + isnull([AM2],0) + isnull([AM3],0) + isnull([AM4],0) + isnull([AM5],0) + isnull([AM6],0) + isnull([AM7],0) + isnull([AM8],0) + isnull([AM9],0) + isnull([AM10],0) + isnull([AM11],0) + isnull([AM12],0)) as Ad ) as  Aud
	Cross apply ( Select (isnull([PM01],0) + isnull([PM02],0) + isnull([PM03],0) + isnull([PM04],0) + isnull([PM05],0) + isnull([PM06],0) + isnull([PM07],0) + isnull([PM08],0) + isnull([PM09],0) + isnull([PM10],0) + isnull([PM11],0) + isnull([PM12],0)) as p ) as  Pln
	where b.[Schedule_Sheet] = '7' and a.[Source] = 'SPL'
	GROUP BY b.[Schedule_Code]
    order by b.[Schedule_Code]


END
