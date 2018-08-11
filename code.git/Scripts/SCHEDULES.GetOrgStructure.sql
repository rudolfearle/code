
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Rudolf J Earle>
-- Create date: <Create Date,,11 August 2018>
-- Description:	<Description,, Get Org Structure>
-- =============================================
CREATE PROCEDURE SCHEDULES.GetOrgStructure

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
 Select [Old Account] as acc,
        isnull([Dir_Code],'No Value') as dircode,
        isnull([Directorate], 'No Value') as dirdesc,
		isnull([Department],'No Value') as deptdesc,
		row_number() over (partition by [Dir_Code] order by [Dir_Code] asc) as deptcode
 from [dbo].[Reporting]
 group by [Old Account],[Dir_Code],[Directorate],[Department]
 order by 2,5 


END
GO
