
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Rudolf J Earle>
-- Create date: <Create Date,,05 August 2018>
-- Description:	<Description,,AD String>

--MunCde|Year
--End|Period|Custgrpcde|
--Itemcde|0-
--30Days|31-
--60Days|61-
--90Days|91-
--120Days|121-
--150Days|151-
--180Days|181Days-
--1Year|Over1
--Year|Total
--|ActualBadDebtsWrittenOffagainstDebtors|Impairment-BadDebtsi.t.oCouncilPolicy
--Muncde|2017|M01||1100|0|0|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01||1200|0|0|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01||1300|0|0|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01||1400|0|0|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01||1500|0|0|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01||1600|0|0|0|0|0|0|0|0|0|0|0
-- =============================================
CREATE PROCEDURE gen_ADString 
	-- Add the parameters for the stored procedure here
		@Municipalidentifier  varchar(5),
		@Period  varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT  @Municipalidentifier as MunicCode
       ,[Year]
      ,[Period]
	   ,[Custgrpcde]
	  ,[NTCode]
      ,[Days30]
      ,[Days60]
      ,[Days90]
      ,[Days120]
      ,[Days150]
      ,[Days180]
      ,[Days360]
      ,[Daysover]
	    ,[Total]
      ,[ActualBadDebtsWrittenOff]
      ,[Impairment]

  FROM [dbo].[NT_StringAD]
   where Period = @Period



END
GO
