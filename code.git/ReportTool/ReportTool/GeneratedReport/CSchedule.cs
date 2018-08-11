using Newtonsoft.Json;
using ReportTool.DAL;
using ReportTool.DAL.mSCOA_VaultDataSetTableAdapters;
using ReportTool.General;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReportTool.GeneratedReport
{
    public class CSchedule : IDisposable 
    {
        private DevExpress.XtraSpreadsheet.SpreadsheetControl xlControl;
        private DevExpress.Spreadsheet.Worksheet xlSheet;
        private DevExpress.Spreadsheet.Range xlRange;

       
        private string _connString;
        private DataTable tblC1Schedule = null;
        private string inputFile = string.Empty;
        private string inputMonth = string.Empty;

        private string _regionalIdentifier = string.Empty;
        

        char[] alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();

        public void Dispose()
        {
            xlSheet = null;
            xlControl = null;
        }

        private void UpdateSheet()
        {
            if (xlSheet != null)
            {
                xlSheet.Workbook.EndUpdate();
                xlSheet = null;
            }
        }

        public CSchedule(string sFileName, string monthSelect,string regionalIdentifier)
        {
           
            _regionalIdentifier = regionalIdentifier;
            inputFile = sFileName;
            inputMonth = monthSelect;
           
            xlControl = new DevExpress.XtraSpreadsheet.SpreadsheetControl();
            xlControl.AllowDrop = false;
            xlControl.LoadDocument(sFileName);

        }

        private string SaveExcel(string FileName)
        {
            string Path = AppDomain.CurrentDomain.BaseDirectory;
            Path = Path + "Reports";
            if (!System.IO.Directory.Exists(Path))
            {
                System.IO.Directory.CreateDirectory(Path);
            }

            // Save document
            int idx = FileName.LastIndexOf('\\');
            string newfile = Path + "\\" + _regionalIdentifier + "_" + FileName.Substring(idx + 1); //todo: add update and timestamp extention
            //newfile = newfile.Replace("Template_", "");
            //newfile = newfile.Replace(" - 07082017", "");

            xlControl.SaveDocument(newfile);
            // xlWorkBook.SaveAs(newfile);
            return newfile;
        }


        public string RunPopulation()
        {
            try
            {
                string SaveFile = string.Empty;
                xlControl.BeginUpdate();

                string[] FieldVal = null;
                string index = string.Empty;
                string sLedgerType = string.Empty;

                DataRow row = null;
                DataTable tblResult = null;

                using (GetOrgStructureTableAdapter ta = new GetOrgStructureTableAdapter())
                {
                    mSCOA_VaultDataSet.GetOrgStructureDataTable tblOrg = new mSCOA_VaultDataSet.GetOrgStructureDataTable();
                    ta.Fill(tblOrg);
                    tblResult = (DataTable)tblOrg;
                }
                if (tblResult.Rows.Count > 0)
                {
                    string dircode = "0";
                    int deptcode = 0;
                    string dirdesc = string.Empty;
                    string deptdesc = string.Empty;
                    int recordSetCount = 0;
                    xlSheet = xlControl.Document.Worksheets["Org structure"];
                    xlSheet.Workbook.BeginUpdate();
                    xlRange = xlSheet.GetDataRange();
                    for (int i = 1; i < 157; i += 11)
                    {
                        row = tblResult.Rows[recordSetCount];
                        dircode = row["dircode"].ToString();
                        //deptcode = Convert.ToInt32(row["deptdesc"].ToString());
                        dirdesc = row["dirdesc"].ToString();
                        //deptdesc = row["deptdesc"].ToString();

                        int dirpos = 1;
                        //xlField = xlSheet.Cells[i, 3];
                        xlSheet.Cells[i, 2].Value = dirdesc;
                        string oldcode = dircode;
                        while (recordSetCount < tblResult.Rows.Count && dirpos < 11)
                        {
                            row = tblResult.Rows[recordSetCount];
                            dircode = row["dircode"].ToString();
                            deptdesc = row["deptdesc"].ToString();
                            if (oldcode == dircode)
                            {
                                //xlField = xlWorkSheet.Rows.Cells[dirpos + i, 3];
                                xlSheet.Cells[dirpos + i, 2].Value = (dirpos == 10) ? "Other" : deptdesc;

                                //set drop down
                                //xlField = xlWorkSheet.Rows.Cells[dirpos + i, 2];
                                string sVal = xlSheet.Cells[dirpos + i, 1].DisplayText;
                                //xlField = xlWorkSheet.Rows.Cells[dirpos + i, 4];
                                string sVal2 = (dirpos == 10) ? "Other" : deptdesc;
                                // xlField.Value = sVal + " - " +  sVal2;

                                string celladdress = "E" + (dirpos + i).ToString();
                                //var cell = xlSheet.GetDataRange(celladdress, Type.Missing);
                                //Microsoft.Office.Interop.Excel.DropDowns xlDropDowns;
                                ////Microsoft.Office.Interop.Excel.DropDown xlDropDown;
                                //xlDropDowns = ((Microsoft.Office.Interop.Excel.DropDowns) (xlWorkBook.ActiveSheet.DropDowns(Type.Missing)));
                                //  xlDropDowns.Text = sVal + " - " + sVal2;
                                xlSheet.Cells[celladdress].Value = sVal + " - " + sVal2;
                                recordSetCount += 1;
                                dirpos += 1;

                            }
                            else
                            {
                                break;
                            }
                        }
                        //fast forward
                        recordSetCount += 1;
                        while (oldcode == dircode && recordSetCount < tblResult.Rows.Count)
                        {

                            row = tblResult.Rows[recordSetCount];
                            dircode = row["dircode"].ToString();
                            if (oldcode != dircode)
                            {
                                break;
                            }
                            recordSetCount += 1;
                        }

                        if (recordSetCount >= tblResult.Rows.Count)
                            break; //exit loop no more data

                    }

                }
                UpdateSheet();
                xlControl.EndUpdate();

                xlControl.BeginUpdate();

                //C2C
                using (GetC2CDataTableAdapter  ta = new GetC2CDataTableAdapter())
                {
                    mSCOA_VaultDataSet.GetC2CDataDataTable  tblC2C = new mSCOA_VaultDataSet.GetC2CDataDataTable();
                    ta.Fill(tblC2C);
                    tblResult = (DataTable)tblC2C;
                }
               
                int rowCount = 0;
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["C2C"];
                    xlSheet.Workbook.BeginUpdate();
                    //xlWorkSheet.Activate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {

                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["C2C"].ToString()))
                    {
                        sLedgerType = row["Ledger_type"].ToString();
                        index = row["C2C"].ToString() + "|L";
                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";

                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("C2C", index, FieldVal, sLedgerType, rowCount);
                    }

                }
                UpdateSheet();

                //C3C

                using (GetC3CDataTableAdapter  ta = new GetC3CDataTableAdapter())
                {
                    mSCOA_VaultDataSet.GetC3CDataDataTable  tblC3C = new mSCOA_VaultDataSet.GetC3CDataDataTable();
                    ta.Fill(tblC3C);
                    tblResult = (DataTable)tblC3C;
                }

                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["C3C"];
                    //xlWorkSheet.Activate();
                    xlSheet.Workbook.BeginUpdate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {

                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["C3C"].ToString()))
                    {
                        sLedgerType = row["Ledger_type"].ToString();
                        index = row["C3C"].ToString() + "|A";
                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("C3C", index, FieldVal, sLedgerType, rowCount);
                    }

                }
                UpdateSheet();

                //C4-FinPerf RE
                using (GetC4DataTableAdapter ta = new GetC4DataTableAdapter())
                {
                    mSCOA_VaultDataSet.GetC4DataDataTable tblC4 = new mSCOA_VaultDataSet.GetC4DataDataTable();
                    ta.Fill(tblC4);
                    tblResult = (DataTable)tblC4;
                }

                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["C4-FinPerf RE"];
                    //xlWorkSheet.Activate();
                    xlSheet.Workbook.BeginUpdate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["C4"].ToString()))
                    {
                        index = row["C4"].ToString() + "|L";

                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("C4-FinPerf RE", index, FieldVal, rowCount);
                    }


                }
                UpdateSheet();

                // may not be required!
                //tblResult = DBCall.GetC4FromSA1Data(inputMonth);
                //if (tblResult.Rows.Count > 0)
                //{
                //    xlSheet = xlControl.Document.Worksheets["C4-FinPerf RE"];
                //    //xlWorkSheet.Activate();
                //    xlSheet.Workbook.BeginUpdate();
                //    xlRange = xlSheet.GetDataRange();
                //    rowCount = xlRange.RowCount;
                //}
                //for (int i = 0; i < tblResult.Rows.Count; i++)
                //{
                //    row = tblResult.Rows[i];
                //    if (!string.IsNullOrEmpty(row["C4"].ToString()))
                //    {
                //        index = row["C4"].ToString() + "|L";

                //        FieldVal = new string[6];

                //        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                //        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                //        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                //        FieldVal[3] = row[inputMonth].ToString() + "|F";
                //        FieldVal[4] = CalcYTD(row) + "|G";
                //        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                //        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                //        FindExcelField("C4-FinPerf RE", index, FieldVal, rowCount);
                //    }


                //}
                //UpdateSheet();


                //C5
                using (GetC5DataTableAdapter ta = new GetC5DataTableAdapter())
                {
                    mSCOA_VaultDataSet.GetC5DataDataTable tblC5 = new mSCOA_VaultDataSet.GetC5DataDataTable();
                    ta.Fill(tblC5);
                    tblResult = (DataTable)tblC5;
                }

                rowCount = 0;
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["C5-Capex"];
                    //xlWorkSheet.Activate();
                    xlSheet.Workbook.BeginUpdate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {

                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["C5"].ToString()))
                    {
                        sLedgerType = row["code"].ToString();
                        index = row["C5"].ToString() + "|L";
                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("C5-Capex", index, FieldVal, rowCount);
                    }

                }
                UpdateSheet();


                //C5C
                tblResult = DBCall.GetC5CData(inputMonth);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["C5C"];
                    xlSheet.Workbook.BeginUpdate();
                    //xlWorkSheet.Activate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {

                    row = tblResult.Rows[i];
                    index = row["C5C"].ToString() + "|A";
                    FieldVal = new string[6];

                    FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                    FieldVal[1] = row["Original Budget"].ToString() + "|D";
                    FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                    FieldVal[3] = row[inputMonth].ToString() + "|F";
                    FieldVal[4] = CalcYTD(row) + "|G";
                    FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                    //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                    FindExcelField("C5C", index, FieldVal, sLedgerType, rowCount);
                }
                UpdateSheet();

                //C6-FinPos
                tblResult = DBCall.GetC6Data(inputMonth);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["C6-FinPos"];
                    xlSheet.Workbook.BeginUpdate();
                    //xlWorkSheet.Activate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["C6"].ToString()))
                    {
                        index = row["C6"].ToString() + "|H";
                        FieldVal = new string[4];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        // FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[3] = CalcYTD(row) + "|F";
                        //FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(),inputMonth ) + "|H";
                        //FieldVal[4] = row["Full Year Forecast"].ToString() + "|G";
                        FindExcelField("C6-FinPos", index, FieldVal, rowCount);
                    }

                }
                UpdateSheet();

                //C7-CFlow
                tblResult = DBCall.GetC7Data(inputMonth);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["C7-CFlow"];
                    xlSheet.Workbook.BeginUpdate();
                    //xlWorkSheet.Activate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["C7"].ToString()))
                    {
                        index = row["C7"].ToString() + "|L";
                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("C7-CFlow", index, FieldVal, rowCount);
                    }

                }
                UpdateSheet();

                //SC3
                tblResult = DBCall.GetSC3Data(inputMonth, 2018);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["SC3"];
                    xlSheet.Workbook.BeginUpdate();
                    //xlWorkSheet.Activate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["NTCode"].ToString()))
                    {
                        index = row["NTCOde"].ToString() + "|B";
                        FieldVal = new string[7];

                        FieldVal[0] = row["Days30"].ToString() + "|C";
                        FieldVal[1] = row["Days60"].ToString() + "|D";
                        FieldVal[2] = row["Days90"].ToString() + "|E";
                        FieldVal[3] = row["Days120"].ToString() + "|F";
                        FieldVal[4] = row["Days150"].ToString() + "|G";
                        FieldVal[5] = row["Days180"].ToString() + "|H";
                        FieldVal[6] = row["Days360"].ToString() + "|I";
                        FieldVal[6] = row["Daysover"].ToString() + "|J";

                        FieldVal[6] = row["ActualBadDebtsWrittenOff"].ToString() + "|M";
                        FieldVal[6] = row["Impairment"].ToString() + "|N";

                        FindExcelField("SC3", index, FieldVal, rowCount);
                    }

                }
                UpdateSheet();

                //SC4
                tblResult = DBCall.GetSC4Data(inputMonth + 6, 17);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["SC4"];
                    xlSheet.Workbook.BeginUpdate();
                    //xlWorkSheet.Activate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["NTCode"].ToString()))
                    {
                        index = row["NTCode"].ToString() + "|B";
                        FieldVal = new string[7];

                        FieldVal[0] = row["Days30"].ToString() + "|C";
                        FieldVal[1] = row["Days60"].ToString() + "|D";
                        FieldVal[2] = row["Days90"].ToString() + "|E";
                        FieldVal[3] = row["Days120"].ToString() + "|F";
                        FieldVal[4] = row["Days150"].ToString() + "|G";
                        FieldVal[5] = row["Days180"].ToString() + "|H";
                        FieldVal[6] = row["Days360"].ToString() + "|I";
                        FieldVal[6] = row["Daysover"].ToString() + "|J";

                        FieldVal[6] = row["PriorYearTotals"].ToString() + "|L";

                        FindExcelField("SC4", index, FieldVal, rowCount);
                    }

                }
                UpdateSheet();
                tblResult = DBCall.GetSC13AData(inputMonth);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["SC13a"];
                    //xlWorkSheet.Activate();
                    xlSheet.Workbook.BeginUpdate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["SC13a"].ToString()))
                    {
                        index = row["SC13a"].ToString() + "|L";

                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("SC13a", index, FieldVal, rowCount);
                    }

                }
                UpdateSheet();


                tblResult = DBCall.GetSC13BData(inputMonth);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["SC13b"];
                    //xlWorkSheet.Activate();
                    xlSheet.Workbook.BeginUpdate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["SC13b"].ToString()))
                    {
                        index = row["SC13b"].ToString() + "|L";

                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("SC13b", index, FieldVal, rowCount);
                    }

                }
                UpdateSheet();

                tblResult = DBCall.GetSC13CData(inputMonth);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["SC13C"];
                    //xlWorkSheet.Activate();
                    xlSheet.Workbook.BeginUpdate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["SC13C"].ToString()))
                    {
                        index = row["SC13C"].ToString() + "|L";

                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("SC13C", index, FieldVal, rowCount);
                    }

                }
                UpdateSheet();



                tblResult = DBCall.GetSC13EData(inputMonth);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["SC13E"];
                    //xlWorkSheet.Activate();
                    xlSheet.Workbook.BeginUpdate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["SC13E"].ToString()))
                    {
                        index = row["SC13E"].ToString() + "|L";

                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("SC13E", index, FieldVal, rowCount);
                    }

                }
                UpdateSheet();

                tblResult = DBCall.GetSC13DData(inputMonth);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["SC13D"];
                    //xlWorkSheet.Activate();
                    xlSheet.Workbook.BeginUpdate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["SC13D"].ToString()))
                    {
                        index = row["SC13D"].ToString() + "|L";

                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["Adjusted Budget"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("SC13D", index, FieldVal, rowCount);
                    }

                }
                UpdateSheet();

                tblResult = DBCall.GetSC8Data(inputMonth);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["SC8"];
                    //xlWorkSheet.Activate();
                    xlSheet.Workbook.BeginUpdate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {
                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["Sc8"].ToString()))
                    {
                        index = row["SC8"].ToString() + "|L";
                        sLedgerType = row["groupStaff"].ToString();

                        FieldVal = new string[6];

                        FieldVal[0] = row["AuditOutcome_1"].ToString() + "|C";
                        FieldVal[1] = row["Original Budget"].ToString() + "|D";
                        FieldVal[2] = row["CurrentYearAjustment"].ToString() + "|E";
                        FieldVal[3] = row[inputMonth].ToString() + "|F";
                        FieldVal[4] = CalcYTD(row) + "|G";
                        FieldVal[5] = GetYTDValue(row["YearTDBudget"].ToString(), inputMonth) + "|H";
                        //FieldVal[6] = row["Full Year Forecast"].ToString() + "|K";
                        FindExcelField("SC13D", index, FieldVal, sLedgerType, rowCount);
                    }

                }
                UpdateSheet();

                tblResult = DBCall.GetSC9Data(inputMonth);
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["SC9"];
                    xlSheet.Workbook.BeginUpdate();
                    //xlWorkSheet.Activate();
                    xlRange = xlSheet.GetDataRange();
                    rowCount = xlRange.RowCount;
                }
                for (int i = 0; i < tblResult.Rows.Count; i++)
                {

                    row = tblResult.Rows[i];
                    if (!string.IsNullOrEmpty(row["SC9"].ToString()))
                    {
                        sLedgerType = row["Ledger_type"].ToString();
                        index = row["SC9"].ToString() + "|R";
                        FieldVal = new string[14];
                        //FieldVal[0] = row["JulyMP2017"].ToString() + "|B";
                        //FieldVal[1] = row["AugustMP2017"].ToString() + "|C";
                        //FieldVal[2] = row["SeptemberMP2017"].ToString() + "|D";
                        //FieldVal[3] = row["OctoberMP2017"].ToString() + "|E";
                        //FieldVal[4] = row["NovemberMP2017"].ToString() + "|F";
                        //FieldVal[5] = row["DecemberMP2017"].ToString() + "|G";
                        FieldVal[6] = row["JanuaryMP2018"].ToString() + "|I";
                        FieldVal[7] = row["FebruaryMP2018"].ToString() + "|J";
                        FieldVal[8] = row["MarchMP2018"].ToString() + "|K";
                        FieldVal[9] = row["AprilMP2018"].ToString() + "|L";
                        FieldVal[10] = row["MayMP2018"].ToString() + "|M";

                        FieldVal[11] = row["BudgetYear1718"].ToString() + "|O";
                        FieldVal[12] = row["BudgetYear1_1819"].ToString() + "|P";
                        FieldVal[13] = row["BudgetYear2_1920"].ToString() + "|Q";
                        FindExcelField("SC9", index, FieldVal, sLedgerType, rowCount);
                    }

                }
                UpdateSheet();

                tblResult = DBCall.GetSC2Data();
                if (tblResult.Rows.Count > 0)
                {
                    xlSheet = xlControl.Document.Worksheets["SC2"];
                    xlSheet.Workbook.BeginUpdate();
                    //xlWorkSheet.Activate();
                    //xlRange = xlSheet.GetDataRange();
                    // rowCount = xlRange.RowCount;

                    for (int i = 0; i < tblResult.Rows.Count; i++)
                    {
                        row = tblResult.Rows[i];
                        switch (row["Line"].ToString())
                        {
                            case "30":
                                xlSheet.Cells[29, 3].Value = row["D"].ToString();
                                xlSheet.Cells[29, 4].Value = row["E"].ToString();
                                xlSheet.Cells[29, 5].Value = row["F"].ToString();
                                xlSheet.Cells[29, 6].Value = row["G"].ToString();
                                xlSheet.Cells[29, 7].Value = row["H"].ToString();
                                break;
                            case "31":
                                xlSheet.Cells[30, 3].Value = row["D"].ToString();
                                xlSheet.Cells[30, 4].Value = row["E"].ToString();
                                xlSheet.Cells[30, 5].Value = row["F"].ToString();
                                xlSheet.Cells[30, 6].Value = row["G"].ToString();
                                xlSheet.Cells[30, 7].Value = row["H"].ToString();
                                break;
                        }
                    }
                }

                UpdateSheet();

                PopulateContactInformation();
                xlControl.EndUpdate();
                SaveFile = SaveExcel(inputFile);
                return SaveFile;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }



        #region Helpprocs

        private string CalcYTD(DataRow row)
        {
            string sActYTD = "0";
            switch (inputMonth)
            {
                case "M01":
                    sActYTD = row["YTD01"].ToString();
                    break;
                case "M02":
                    sActYTD = row["YTD02"].ToString();
                    break;
                case "M03":
                    sActYTD = row["YTD03"].ToString();
                    break;
                case "M04":
                    sActYTD = row["YTD04"].ToString();
                    break;
                case "M05":
                    sActYTD = row["YTD05"].ToString();
                    break;
                case "M06":
                    sActYTD = row["YTD06"].ToString();
                    break;
                case "M07":
                    sActYTD = row["YTD07"].ToString();
                    break;
                case "M08":
                    sActYTD = row["YTD08"].ToString();
                    break;
                case "M09":
                    sActYTD = row["YTD09"].ToString();
                    break;
                case "M10":
                    sActYTD = row["YTD10"].ToString();
                    break;
                case "M11":
                    sActYTD = row["YTD11"].ToString();
                    break;
                case "M12":
                    sActYTD = row["YTD12"].ToString();
                    break;
            }
            return sActYTD;
        }

        private string GetYTDValue(string value, string month)
        {
            decimal val = 0;
            decimal.TryParse(value, out val);
            if (val != 0)
            {
                int m = Convert.ToInt32(month.Substring(1, 2));
                val = val / 12 * m;


            }

            return val.ToString();
        }

        private void PopulateContactInformation()
        {
            try
            {
                List<Datum> rs = GetURI("http://municipaldata.treasury.gov.za/api/cubes/municipalities/facts?cut=municipality.demarcation_code:\"" + _regionalIdentifier + "\"");
                xlSheet = xlControl.Document.Worksheets["Contacts"];
                xlSheet.Workbook.BeginUpdate();

                if (rs != null && rs.Count > 0)
                {


                    //xlWorkSheet = (Excel.Worksheet) xlWorkBook.Sheets["Contacts"];
                    //xlRange = (Excel.Range) xlWorkSheet.UsedRange;

                    //url
                    // xlField = xlWorkSheet.Rows.Cells[10, 2];
                    xlSheet.Cells[9, 1].Value = rs[0].municipalityurl;

                    //postal address
                    // xlField = xlWorkSheet.Rows.Cells[15, 2];
                    xlSheet.Cells[14, 1].Value = rs[0].municipalitypostal_address_1;
                    // xlField = xlWorkSheet.Rows.Cells[16, 2];
                    xlSheet.Cells[15, 1].Value = rs[0].municipalitypostal_address_2;
                    //   xlField = xlWorkSheet.Rows.Cells[17, 2];
                    xlSheet.Cells[16, 1].Value = rs[0].municipalitypostal_address_3;

                    //street address
                    //   xlField = xlWorkSheet.Rows.Cells[21, 2];
                    xlSheet.Cells[20, 1].Value = rs[0].municipalitystreet_address_1;
                    //   xlField = xlWorkSheet.Rows.Cells[22, 2];
                    xlSheet.Cells[21, 1].Value = rs[0].municipalitystreet_address_2;
                    //   xlField = xlWorkSheet.Rows.Cells[23, 2];
                    xlSheet.Cells[22, 1].Value = rs[0].municipalitystreet_address_3;
                    //   xlField = xlWorkSheet.Rows.Cells[24, 2];
                    xlSheet.Cells[23, 1].Value = rs[0].municipalitystreet_address_4;

                    //general contacts
                    // xlField = xlWorkSheet.Rows.Cells[27, 2];
                    xlSheet.Cells[26, 1].Value = rs[0].municipalityphone_number;
                    //  xlField = xlWorkSheet.Rows.Cells[28, 2];
                    xlSheet.Cells[27, 1].Value = rs[0].municipalityfax_number;

                }

                List<Datumofficial> rs1 = GetURIOfficials("http://municipaldata.treasury.gov.za/api/cubes/officials/facts?cut=municipality.demarcation_code:\"" + _regionalIdentifier + "\"");

                if (rs1 != null && rs1.Count > 0)
                {
                    for (int i = 0; i < rs1.Count; i++)
                    {
                        switch (rs1[i].role)
                        {
                            case "Speaker":
                                //xlField = xlWorkSheet.Rows.Cells[33, 2];
                                xlSheet.Cells[32, 1].Value = (rs1[i].title != null) ? rs1[i].title : string.Empty;
                                // xlField = xlWorkSheet.Rows.Cells[34, 2];
                                xlSheet.Cells[33, 1].Value = (rs1[i].name != null) ? rs1[i].name : string.Empty ;
                                // xlField = xlWorkSheet.Rows.Cells[35, 2];
                                xlSheet.Cells[34, 1].Value = (rs1[i].phone_number != null) ? rs1[i].phone_number : string.Empty;
                                // xlField = xlWorkSheet.Rows.Cells[37, 2];
                                xlSheet.Cells[36, 1].Value = (rs1[i].fax_number != null) ? rs1[i].fax_number : string.Empty;
                                //  xlField = xlWorkSheet.Rows.Cells[38, 2];
                                xlSheet.Cells[37, 1].Value = (rs1[i].email_address != null) ? rs1[i].email_address : string.Empty;

                                break;

                            case "Secretary of Speaker":
                                //xlField = xlWorkSheet.Rows.Cells[33, 4];
                                xlSheet.Cells[32, 3].Value = (rs1[i].title != null) ? rs1[i].title : string.Empty;
                                // xlField = xlWorkSheet.Rows.Cells[34, 4];
                                xlSheet.Cells[33, 3].Value = (rs1[i].name != null) ? rs1[i].name : string.Empty;
                                // xlField = xlWorkSheet.Rows.Cells[35, 4];
                                xlSheet.Cells[34, 3].Value = (rs1[i].phone_number != null) ? rs1[i].phone_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[37, 4];
                                xlSheet.Cells[36, 3].Value = (rs1[i].fax_number != null) ? rs1[i].fax_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[38, 4];
                                xlSheet.Cells[37, 3].Value = (rs1[i].email_address != null) ? rs1[i].email_address : string.Empty;
                                break;

                            case "Mayor/Executive Mayor":
                                // xlField = xlWorkSheet.Rows.Cells[42, 2];
                                xlSheet.Cells[41, 1].Value = (rs1[i].title != null) ? rs1[i].title : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[43, 2];
                                xlSheet.Cells[42, 1].Value = (rs1[i].name != null) ? rs1[i].name : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[44, 2];
                                xlSheet.Cells[43, 1].Value = (rs1[i].phone_number != null) ? rs1[i].phone_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[46, 2];
                                xlSheet.Cells[45, 1].Value = (rs1[i].fax_number != null) ? rs1[i].fax_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[47, 2];
                                xlSheet.Cells[46, 1].Value = (rs1[i].email_address != null) ? rs1[i].email_address : string.Empty;
                                break;

                            case "Secretary of Mayor/Executive Mayor":
                                // xlField = xlWorkSheet.Rows.Cells[42, 4];
                                xlSheet.Cells[41, 3].Value = (rs1[i].title != null) ? rs1[i].title : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[43, 4];
                                xlSheet.Cells[42, 3].Value = (rs1[i].name != null) ? rs1[i].name : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[44, 4];
                                xlSheet.Cells[43, 3].Value = (rs1[i].phone_number != null) ? rs1[i].phone_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[46, 4];
                                xlSheet.Cells[45, 3].Value = (rs1[i].fax_number != null) ? rs1[i].fax_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[47, 4];
                                xlSheet.Cells[46, 3].Value = (rs1[i].email_address != null) ? rs1[i].email_address : string.Empty;
                                break;

                            case "Deputy Mayor/Executive Mayor":
                                //xlField = xlWorkSheet.Rows.Cells[51, 2];
                                xlSheet.Cells[50, 1].Value = (rs1[i].title != null) ? rs1[i].title : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[52, 2];
                                xlSheet.Cells[51, 1].Value = (rs1[i].name != null) ? rs1[i].name : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[53, 2];
                                xlSheet.Cells[52, 1].Value = (rs1[i].phone_number != null) ? rs1[i].phone_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[55, 2];
                                xlSheet.Cells[54, 1].Value = (rs1[i].fax_number != null) ? rs1[i].fax_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[56, 2];
                                xlSheet.Cells[55, 1].Value = (rs1[i].email_address != null) ? rs1[i].email_address : string.Empty;
                                break;

                            case "Secretary of Deputy Mayor/Executive Mayor":
                                //xlField = xlWorkSheet.Rows.Cells[51, 4];
                                xlSheet.Cells[50, 3].Value = (rs1[i].title != null) ? rs1[i].title : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[52, 4];
                                xlSheet.Cells[51, 3].Value = (rs1[i].name != null) ? rs1[i].name : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[53, 4];
                                xlSheet.Cells[52, 3].Value = (rs1[i].phone_number != null) ? rs1[i].phone_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[55, 4];
                                xlSheet.Cells[54, 3].Value = (rs1[i].fax_number != null) ? rs1[i].fax_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[56, 4];
                                xlSheet.Cells[55, 3].Value = (rs1[i].email_address != null) ? rs1[i].email_address : string.Empty;
                                break;


                            case "Municipal Manager":
                                //xlField = xlWorkSheet.Rows.Cells[61, 2];
                                xlSheet.Cells[60, 1].Value = (rs1[i].title != null) ? rs1[i].title : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[62, 2];
                                xlSheet.Cells[61, 1].Value = (rs1[i].name != null) ? rs1[i].name : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[63, 2];
                                xlSheet.Cells[62, 1].Value = (rs1[i].phone_number != null) ? rs1[i].phone_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[65, 2];
                                xlSheet.Cells[64, 1].Value = (rs1[i].fax_number != null) ? rs1[i].fax_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[66, 2];
                                xlSheet.Cells[65, 1].Value = (rs1[i].email_address != null) ? rs1[i].email_address : string.Empty;
                                break;

                            case "Secretary of Municipal Manager":
                                // xlField = xlWorkSheet.Rows.Cells[61, 4];
                                xlSheet.Cells[60, 3].Value = (rs1[i].title != null) ? rs1[i].title : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[62, 4];
                                xlSheet.Cells[61, 3].Value = (rs1[i].name != null) ? rs1[i].name : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[63, 4];
                                xlSheet.Cells[62, 3].Value = (rs1[i].phone_number != null) ? rs1[i].phone_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[65, 4];
                                xlSheet.Cells[64, 3].Value = (rs1[i].fax_number != null) ? rs1[i].fax_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[66, 4];
                                xlSheet.Cells[65, 3].Value = (rs1[i].email_address != null) ? rs1[i].email_address : string.Empty;
                                break;

                            case "Chief Financial Officer":
                                //xlField = xlWorkSheet.Rows.Cells[70, 2];
                                xlSheet.Cells[69, 1].Value = (rs1[i].title != null) ? rs1[i].title : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[71, 2];
                                xlSheet.Cells[70, 1].Value = (rs1[i].name != null) ? rs1[i].name : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[72, 2];
                                xlSheet.Cells[71, 1].Value = (rs1[i].phone_number != null) ? rs1[i].phone_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[74, 2];
                                xlSheet.Cells[73, 1].Value = (rs1[i].fax_number != null) ? rs1[i].fax_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[75, 2];
                                xlSheet.Cells[74, 1].Value = (rs1[i].email_address != null) ? rs1[i].email_address : string.Empty;
                                break;

                            case "Secretary of Financial Manager":
                                //xlField = xlWorkSheet.Rows.Cells[70, 4];
                                xlSheet.Cells[69, 3].Value = (rs1[i].title != null) ? rs1[i].title : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[71, 4];
                                xlSheet.Cells[70, 3].Value = (rs1[i].name != null) ? rs1[i].name : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[72, 4];
                                xlSheet.Cells[71, 3].Value = (rs1[i].phone_number != null) ? rs1[i].phone_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[74, 4];
                                xlSheet.Cells[72, 3].Value = (rs1[i].fax_number != null) ? rs1[i].fax_number : string.Empty;
                                //xlField = xlWorkSheet.Rows.Cells[75, 4];
                                xlSheet.Cells[73, 3].Value = (rs1[i].email_address != null) ? rs1[i].email_address : string.Empty;
                                break;

                        }
                    }

                }
                UpdateSheet();
            }
            catch (Exception ex)
            {

            }
        }

        List<Datum> GetURI(string url)
        {
            using (var webClient = new System.Net.WebClient())
            {
                var json = webClient.DownloadString(url);
                // Now parse with JSON.Net

                var result = JsonConvert.DeserializeObject<RootObject>(json);
                return result.data;
            }

        }

        List<Datumofficial> GetURIOfficials(string url)
        {
            using (var webClient = new System.Net.WebClient())
            {
                var json = webClient.DownloadString(url);
                // Now parse with JSON.Net

                var result = JsonConvert.DeserializeObject<RootofficialObject>(json);
                return result.data;
            }

        }

        private int FindIndexNumber(string indexChar)
        {
            for (int i = 0; i < alpha.Length; i++)
            {
                if (alpha[i] == Convert.ToChar(indexChar))
                {
                    return i;
                }
            }
            return 0;
        }

        private string FindIndexChar(int pos)
        {
            return alpha[pos].ToString();
        }

        private void FindExcelField(string sheetname, string indexvalue, string[] fieldValue, int rwCount)
        {
            FindExcelField(sheetname, indexvalue, fieldValue, string.Empty, rwCount);
        }

        private void FindExcelField(string sheetname, string indexvalue, string[] fieldValue, string ledgerType, int rwCount)
        {
            try
            {


                int rowCount = rwCount;
                //excel is not zero based!!
                string indexValue = indexvalue.Split('|')[0].ToString();
                int indexCol = FindIndexNumber(indexvalue.Split('|')[1].ToString());

                decimal multiply = 1;
                int nStart = 1;
                if (ledgerType == "Revenue")
                {
                    // multiply = -1;
                    switch (sheetname)
                    {
                        case "C2C":
                            nStart = 6;
                            rowCount = 124;
                            break;
                        case "C3C":
                            nStart = 5;
                            rowCount = 170;
                            break;
                        case "SA2":
                            nStart = 4;
                            rowCount = 20;
                            break;
                        case "SA30":
                        case "SC9":
                            nStart = 4;
                            rowCount = 31;
                            break;
                        case "SA25":
                            nStart = 3;
                            rowCount = 20;
                            break;
                        case "SA26":
                            nStart = 3;
                            rowCount = 20;
                            break;
                    }

                }
                else if (ledgerType == "Expenditure")
                {
                    multiply = 1;
                    switch (sheetname)
                    {
                        case "C2C":
                            nStart = 129;
                            rowCount = 246;
                            break;
                        case "C3C":
                            nStart = 173;
                            rowCount = 338;
                            break;
                        case "SA2":
                            nStart = 23;
                            rowCount = 40;
                            break;
                        case "SA30":
                        case "SC9":
                            nStart = 33;
                            rowCount = 50;
                            break;
                        case "SA25":
                            nStart = 23;
                            rowCount = 44;
                            break;
                        case "SA26":
                            nStart = 22;
                            rowCount = 37;
                            break;
                    }

                }

                //temp for single
                if (sheetname == "SA28")
                {
                    nStart = 22;
                }

                if (sheetname == "A5")
                {
                    switch (ledgerType)
                    {
                        case "FX":
                            nStart = 43;
                            rowCount = 64;
                            break;
                        case "FD":
                            nStart = 65;
                            rowCount = 76;
                            break;
                    }
                }
                if (sheetname == "SA1")
                {
                    if (ledgerType == "Swop")
                    {
                        //multiply = -1;
                    }
                }
                if (sheetname == "A4-FinPerf RE" && indexValue == "3300")
                {
                    //    multiply = -1;
                }

                switch (ledgerType)
                {
                    case "IE005001": //Sen Man
                        nStart = 17;
                        rowCount = 30;
                        break;
                    case "IE005002": //Munic staff
                        nStart = 33;
                        rowCount = 46;
                        break;
                    case "IE005003": // Board Mem
                        nStart = 53;
                        rowCount = 67;
                        break;
                    default:
                        {
                            if (ledgerType.Length > 4)
                            {
                                if (ledgerType.Substring(0, 5) == "IE008")
                                {
                                    nStart = 6;
                                    rowCount = 13;
                                }
                            }
                            break;
                        }
                }



                if (!string.IsNullOrEmpty(indexValue))
                {
                    for (int i = nStart; i <= rowCount; i++)
                    {

                        string cellvalue = "Rudolf Defult for Null";
                        if (xlSheet.Cells[i, indexCol] != null && xlSheet.Cells[i, indexCol].HasFormula == false)
                            cellvalue = xlSheet.Cells[i, indexCol].Value.ToString();

                        if ((xlSheet.Cells[i, indexCol] != null && xlSheet.Cells[i, indexCol].Value != string.Empty && xlSheet.Cells[i, indexCol].DisplayText == indexValue) || cellvalue.Contains(indexValue) == true)
                        {
                            //now populate field values
                            foreach (string value in fieldValue)
                            {
                                if (value != null)
                                {
                                    string sValue = value.Split('|')[0].ToString();
                                    int nCol = FindIndexNumber(value.Split('|')[1].ToString());

                                    // Cell currentCell = xlWorkSheet.Cell(i, nCol);
                                    var currentvalue = "0" + xlSheet.Cells[i, nCol].Value.ToString();

                                    //  if (xlSheet.Cells[i, nCol].HasFormula)
                                    //  {/*
                                    //      string sFormula = xlWorkSheet.Rows.Cells[i, nCol].Formula;
                                    //      xlSheet = (Excel.Worksheet) xlWorkBook.Sheets[sFormula.Split('\'')[1].ToString()];
                                    //      //xlSheet.Activate();
                                    //      xlSheet.Range[sFormula.Split('!')[1].ToString()].Cells.Value = xlSheet.Range[sFormula.Split('!')[1].ToString()].Cells.Value + sValue;
                                    //*/
                                    //  }
                                    decimal n = 0;
                                    bool isNumeric = decimal.TryParse(sValue, out n);
                                    if (currentvalue.Contains("Insert") == true || isNumeric == false)
                                    {
                                        xlSheet.Cells[i, nCol].Value = sValue;
                                    }
                                    else
                                    {
                                        // xlField = xlWorkSheet.Rows.Cells[i, nCol]; // xlSheet.Cells[j, 7].Formula = "= " + row["EstYearEnd"].ToString();
                                        xlSheet.Cells[i, nCol].Formula = "= " + (Convert.ToDecimal(currentvalue) + (Convert.ToDecimal(sValue) * multiply)).ToString();
                                    }
                                }
                            }
                            break; //no need to loop further

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // throw;

            }
        }

        #endregion

    }
}
