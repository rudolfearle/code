using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReportTool.GeneratedReport
{
    public class BSASchedule : IDisposable
    {
        string _regionalIdentifier = string.Empty;

        private DevExpress.XtraSpreadsheet.SpreadsheetControl xlControl;
        private DevExpress.Spreadsheet.Worksheet xlSheet;

        public void Dispose()
        {
            xlSheet = null;
            xlControl = null;
        }

        public string GenerateReport(string templatePath, string reportType, string reportextention, int FinYear, string MonthEnd)
        {
            try
            {
                //populate data
                //DBSTMT.GenerateA1ScheduleData(_regionalIdentifier);
                //open excel
                bool bOpen = OpenExcelFile(templatePath + "\\" + reportType + "." + reportextention);
                //query and populate
                Populate_Muncde_BSA_ccyy_Y(FinYear);
                
                //save file
                return SaveFile(reportType, reportextention, FinYear, MonthEnd);
            }
            catch (Exception ex)
            {
                return "ERROR:" + ex.Message + ex.StackTrace;
            }
        }


        private bool OpenExcelFile(string sFileName)
        {

            /*
            xlApp = new Excel.Application();
            xlApp.DisplayAlerts = false;
            xlApp.AskToUpdateLinks = false;
            xlApp.ScreenUpdating = false;
            xlWorkBook = xlApp.Workbooks.Open(sFileName, false, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
            xlWorkBook.CheckCompatibility = false;
            xlWorkBook.UpdateLinks = Microsoft.Office.Interop.Excel.XlUpdateLinks.xlUpdateLinksNever;
            xlWorkBook.Activate();
            */
            xlControl = new DevExpress.XtraSpreadsheet.SpreadsheetControl();
            xlControl.AllowDrop = false;
            xlControl.LoadDocument(sFileName);
            return true;

        }

        private string SaveFile(string reportType, string reportextention, int Year, string MonthEnd)
        {
            string Path = AppDomain.CurrentDomain.BaseDirectory;
            Path = Path + "Reports";
            if (!System.IO.Directory.Exists(Path))
            {
                System.IO.Directory.CreateDirectory(Path);
            }

            string FileName = reportType.Replace("Muncde", _regionalIdentifier);
            FileName = FileName.Replace("ccyy", Year.ToString());

            if (MonthEnd != string.Empty)
                FileName = FileName.Replace("Mnn", MonthEnd);

            FileName = FileName + "." + reportextention;
            FileName = Path + "\\" + FileName;

            //xlWorkBook.SaveAs(FileName);
            xlControl.SaveDocument(FileName);

            return FileName;
        }

        private void Populate_Muncde_BSA_ccyy_Y(int finYear)
        {
            try
            {
                xlSheet = xlControl.Document.Worksheets["Sheet1"];
                xlControl.BeginUpdate();
                xlSheet.Workbook.BeginUpdate();

                string celladdress = "A6";
                //var cell = xlWorkSheet.get_Range(celladdress, Type.Missing);
                xlSheet.Cells[celladdress].Value = finYear.ToString();

                //QueryDb
                string index = string.Empty;
                DataRow row = null;
                int nStart = 5;

                using (DAL.mSCOA_VaultDataSetTableAdapters.GetMuncde_BSA_ccyy_YTableAdapter TA = new DAL.mSCOA_VaultDataSetTableAdapters.GetMuncde_BSA_ccyy_YTableAdapter())
                {
                    DAL.mSCOA_VaultDataSet.GetMuncde_BSA_ccyy_YDataTable tbl = new DAL.mSCOA_VaultDataSet.GetMuncde_BSA_ccyy_YDataTable();
                    TA.Fill(tbl);

                    DataTable tblResult = tbl;
                    for (int i = 0; i < tblResult.Rows.Count; i++)
                    {
                        row = tblResult.Rows[i];

                        index = row["Code"].ToString();

                        for (int j = nStart; j < 47; j++)
                        {
                            // xlField = xlWorkSheet.Rows.Cells[j, 3];
                            if (xlSheet.Cells[j, 2].DisplayText == index)
                            {
                                //xlField = xlWorkSheet.Rows.Cells[j, 5];
                                xlSheet.Cells[j, 4].Formula = "= 0" + row["EstYearEnd"].ToString();
                                nStart = j;
                                break;
                            }
                        }

                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                xlSheet.Workbook.EndUpdate();
                xlControl.EndUpdate();
            }
        }

    }
}
