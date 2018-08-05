
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Rudolf J Earle>
-- Create date: <Create Date,,05/08/2018>
-- Description:	<Description,,GetMuncde_OSA_ccyy_Mnn>
-- =============================================
CREATE PROCEDURE GetMuncde_OSA_ccyy_Mnn 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


 SELECT  isnull(f.Schedule_Code,'')  + isnull(b.[Schedule_Code],'') as [code]
     ,isnull(abs(sum(gl.M01)),0) as M01
                        ,isnull(abs(sum(gl.M02)),0) as M02
                        ,isnull(abs(sum(gl.M03)),0) as M03
                        ,isnull(abs(sum(gl.M04)),0) as M04
                        ,isnull(abs(sum(gl.M05)),0) as M05
                        ,isnull(abs(sum(gl.M06)),0) as M06
                        ,isnull(abs(sum(gl.M07)),0) as M07
                        ,isnull(abs(sum(gl.M08)),0) as M08
                        ,isnull(abs(sum(gl.M09)),0) as M09
                        ,isnull(abs(sum(gl.M10)),0) as M10
                        ,isnull(abs(sum(gl.M11)),0) as M11
                        ,isnull(abs(sum(gl.M12)),0) as M12
  FROM [mSCOA_Vault].[dbo].[Cons_Vault] b
  inner join [mSCOA_Vault].[dbo].[Reporting] gl on gl.mSCOA_Item_Guid = b.guid
  left outer  join  [mSCOA_Vault].[dbo].[Cons_Vault] F on f.Function_Guid = gl.mSCOA_Function_Guid and f.Schedule_Sheet='2A'
  Where b.[Schedule_Sheet] = '4'
  group by f.Schedule_Code,b.[Schedule_Code]
  order by f.Schedule_Code,b.[Schedule_Code]

END
GO
