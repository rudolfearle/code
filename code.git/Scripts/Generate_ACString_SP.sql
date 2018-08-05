
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Rudolf J Earle>
-- Create date: <Create Date,,05/08/2018>
-- Description:	<Description,,AC>
--Muncde|YearEnd|PERIOD|Itemcde|0-30Days|31-60Days|61-90Days|91-120Days|121-150Days|151-180Days|181Days-1Year|Over1Year|Total
--Muncde|2017|M01|0100|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01|0200|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01|0300|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01|0400|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01|0500|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01|0600|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01|0700|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01|0800|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01|0900|0|0|0|0|0|0|0|0|0
--Muncde|2017|M01|1000|0|0|0|0|0|0|0|0|0

-- =============================================
CREATE PROCEDURE gen_ACString 
	-- Add the parameters for the stored procedure here
		@Municipalidentifier  varchar(5),
		@Period  varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure her

SELECT @Municipalidentifier as MunicCode
	   ,[YearEnd]
	  , @Period as [Period]
       ,[NTCode] AS Itemcde
      ,[Days30]
      ,[Days60]
      ,[Days90]
      ,[Days120]
      ,[Days150]
      ,[Days180]
      ,[Days360]
      ,[Daysover]
      ,[PriorYearTotals]
   FROM [dbo].[NT_StringAC]
  where Period = @Period


END
GO
