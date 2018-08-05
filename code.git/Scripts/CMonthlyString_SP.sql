
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Rudolf J Earle>
-- Create date: <Create Date,,05/08/2018>
-- Description:	<Description,,Generate MOnthly C-String>
-- Test exec gen_CMonthlyString '','M01'
-- =============================================
CREATE PROCEDURE gen_CMonthlyString 
	-- Add the parameters for the stored procedure here
	@Municipalidentifier  varchar(10),
	@Period  varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 SELECT 
          @Municipalidentifier as [Municipalidentifier] 
          ,[FINYEAR] as [Year] 
          ,PP.Period as [Period] 
   --        ,CASE 
			--WHEN [dbo].[GetBreakDownAllowed]([dbo].[StripBreakDown](LOWER(p.GUID)),'6.1') = 'Yes' 
			--THEN CAST([dbo].[StripBreakDown](LOWER(p.GUID)) as varchar(100)) + '_' + RIGHT('00000' + CAST(IDP.[FK_IDPID] as varchar(100)),5) ELSE CAST([dbo].[StripBreakDown](LOWER(p.GUID)) as varchar(50)) END  as [Project] 
          ,LOWER([mSCOA_Project_Guid])  as [Project] 
          ,LOWER(mSCOA_Function_Guid) as [Function] 
          ,LOWER(mSCOA_Item_Guid) as [Item] 
          ,isnull(LOWER(mSCOA_Fund_Guid),'') as [Fund]  
          ,isnull(LOWER(mSCOA_Costing_Guid),'') as [Costing] 
          ,isnull(LOWER(mSCOA_Region_Guid),'') as [Region] 
          ,case PP.Period when 'M01' then   CAST(ROUND(SUM([M01]),0) as numeric(18,0))
		                 when 'M02' then CAST(ROUND(SUM([M02]),0) as numeric(18,0)) 
		                 when 'M03' then CAST(ROUND(SUM([M03]),0) as numeric(18,0)) 
						 when 'M04' then CAST(ROUND(SUM([M04]),0) as numeric(18,0)) 
						 when 'M05' then CAST(ROUND(SUM([M05]),0) as numeric(18,0)) 
						 when 'M06' then CAST(ROUND(SUM([M06]),0) as numeric(18,0)) 
						 when 'M07' then CAST(ROUND(SUM([M07]),0) as numeric(18,0)) 
						 when 'M08' then CAST(ROUND(SUM([M08]),0) as numeric(18,0)) 
						 when 'M09' then CAST(ROUND(SUM([M09]),0) as numeric(18,0)) 
						 when 'M10' then CAST(ROUND(SUM([M10]),0) as numeric(18,0)) 
						 when 'M11' then CAST(ROUND(SUM([M11]),0) as numeric(18,0)) 
						 when 'M12' then CAST(ROUND(SUM([M12]),0) as numeric(18,0))
		   END as Amount 
          FROM Reporting 
		  cross apply (Select @Period as Period ) pp 
          GROUP BY 
		  PP.Period ,[FINYEAR],[mSCOA_Project_Guid],mSCOA_Function_Guid,mSCOA_Item_Guid,mSCOA_Fund_Guid,mSCOA_Costing_Guid,mSCOA_Region_Guid





END
GO
