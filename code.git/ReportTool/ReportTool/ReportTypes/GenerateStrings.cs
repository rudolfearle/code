using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ReportTool.ReportTypes
{
    public partial class GenerateStrings : Form
    {
        private int nSelection;
        private string FilePath;
        string delimeter = "|";
        StringBuilder Newfile = new StringBuilder();
        string NewLine = "";
        bool SavedText;
        BackgroundWorker workerSaveLGDB = new BackgroundWorker();

        public GenerateStrings()
        {
            InitializeComponent();
            workerSaveLGDB.RunWorkerCompleted += workerSaveLGDB_RunWorkerCompleted;
            workerSaveLGDB.DoWork += workerSaveLGDB_DoWork;
            workerSaveLGDB.ProgressChanged += workerSaveLGDB_ProgressChanged;
            workerSaveLGDB.WorkerReportsProgress = true;
        }

        private void GenerateStrings_Load(object sender, EventArgs e)
        {
            LoadMonthList();
            grpFields.Enabled = false;
            btnExport.Enabled = false;
        }

        private void LoadMonthList()
        {
            DataTable tblMonth = new DataTable();
            tblMonth.Columns.Add("Code");
            tblMonth.Columns.Add("MonthDescription");

            tblMonth.Rows.Add("M01", "July");
            tblMonth.Rows.Add("M02", "August");
            tblMonth.Rows.Add("M03", "September");
            tblMonth.Rows.Add("M04", "October");
            tblMonth.Rows.Add("M05", "November");
            tblMonth.Rows.Add("M06", "December");
            tblMonth.Rows.Add("M07", "January");
            tblMonth.Rows.Add("M08", "February");
            tblMonth.Rows.Add("M09", "March");
            tblMonth.Rows.Add("M10", "April");
            tblMonth.Rows.Add("M11", "May");
            tblMonth.Rows.Add("M12", "June");

            cboMonth.DataSource = tblMonth;
            cboMonth.ValueMember = "Code";
            cboMonth.DisplayMember = "MonthDescription";
            cboMonth.Refresh();

        }

        private void rdoCString_Click(object sender, EventArgs e)
        {
            grpFields.Enabled = true;
            nSelection = 1;
            btnExport.Enabled = false;
        }

        private void rdoAD_Click(object sender, EventArgs e)
        {
            grpFields.Enabled = true;
            nSelection = 2;
            btnExport.Enabled = false;
        }

        private void rdoAC_Click(object sender, EventArgs e)
        {
            grpFields.Enabled = true;
            nSelection = 3;
            btnExport.Enabled = false;

        }

        private void btnGenerate_Click(object sender, EventArgs e)
        {
            string Munic = txtMuniciplaIdentifier.Text;
            string Period = cboMonth.SelectedValue.ToString();
            btnExport.Enabled = false;
            switch (nSelection )
            {
                case 1: //cString

                    using (DAL.mSCOA_VaultDataSetTableAdapters.gen_CMonthlyStringTableAdapter Ta = new DAL.mSCOA_VaultDataSetTableAdapters.gen_CMonthlyStringTableAdapter())
                    {
                        DAL.mSCOA_VaultDataSet.gen_CMonthlyStringDataTable tblCString = new DAL.mSCOA_VaultDataSet.gen_CMonthlyStringDataTable();
                        Ta.Fill(tblCString, Munic, Period);
                        dataGridView1.DataSource = tblCString;
                        dataGridView1.Refresh();
                        if (tblCString.Rows.Count > 0 )
                        {
                            btnExport.Enabled = true;
                        }
                    }
                        break;
                case 2: //Ad Save File as : Muncde_AD_ccyy_Mnn.XLS (e.g.: GT411_AD_2005_M10)															
                    using (DAL.mSCOA_VaultDataSetTableAdapters.gen_ADStringTableAdapter TA = new DAL.mSCOA_VaultDataSetTableAdapters.gen_ADStringTableAdapter())
                    {
                        DAL.mSCOA_VaultDataSet.gen_ADStringDataTable tblAD = new DAL.mSCOA_VaultDataSet.gen_ADStringDataTable();
                        TA.Fill(tblAD, Munic, Period);
                        dataGridView1.DataSource = tblAD;
                        dataGridView1.Refresh();
                        if (tblAD.Rows.Count > 0)
                        {
                            btnExport.Enabled = true;
                        }
                    }

                    break;
                case 3: //Ac Save File as : Muncde_AC_ccyy_Mnn.XLS (e.g.: GT411_AC_2005_M10)													
                    using (DAL.mSCOA_VaultDataSetTableAdapters.gen_ACStringTableAdapter TA = new DAL.mSCOA_VaultDataSetTableAdapters.gen_ACStringTableAdapter())
                    {
                        DAL.mSCOA_VaultDataSet.gen_ACStringDataTable tblAC = new DAL.mSCOA_VaultDataSet.gen_ACStringDataTable();
                        TA.Fill(tblAC, Munic, Period);
                        dataGridView1.DataSource = tblAC;
                        dataGridView1.Refresh();
                        if (tblAC.Rows.Count > 0)
                        {
                            btnExport.Enabled = true;
                        }
                    }

                        break;

            }
        }

        private void btnExport_Click(object sender, EventArgs e)
        {
            string sFileName = string.Empty;
            //Get date parts to use in file name
            string typeName = cboMonth.SelectedValue.ToString();
            string sYear = DateTime.Now.Year.ToString();
            string sMonth = DateTime.Now.Month.ToString();
            string sDay = DateTime.Now.Day.ToString();
            if (sMonth.Length < 2) sMonth = "0" + sMonth; //Add Zero padding
            if (sDay.Length < 2) sDay = "0" + sDay; //Add Zero padding

            switch (nSelection)
            {
                case 1: //cString
                    sFileName  = string.Format("{0}_2019_" + typeName + "_G_{1}{2}{3}", txtMuniciplaIdentifier.Text, sYear, sMonth, sDay);
                    ExportString(sFileName);
                    break;
                case 2: //Ad Muncde_AD_ccyy_Mnn
                    sFileName = string.Format("{0}_AD_2019_{1}", txtMuniciplaIdentifier.Text, typeName);
                    ExportString(sFileName);
                    break;
                case 3: //Ac Muncde_AC_ccyy_Mnn
                    sFileName = string.Format("{0}_AC_2019_{1}", txtMuniciplaIdentifier.Text, typeName);
                    ExportString(sFileName);
                    break;

            }
        }

        private void ExportString(string sfileName)
        {
           
            
            SaveFileDialog dlg = new SaveFileDialog();
            dlg.Filter = "Text File (*.txt)|*.txt|All files (*.*)|*.*";
            dlg.DefaultExt = "txt";
            dlg.FileName = sfileName;
            DialogResult res = dlg.ShowDialog();
            if (res == System.Windows.Forms.DialogResult.OK)
            {
                FilePath = dlg.FileName;
                workerSaveLGDB.RunWorkerAsync();
            }
            else
            {
             
            }
        }

        void workerSaveLGDB_DoWork(object sender, DoWorkEventArgs e)
        {
            try
            {
                int percentage = 0;
                int rowCount = 0;
                int totalRows = (dataGridView1.DataSource as DataTable).Rows.Count;
                foreach (DataRow row in (dataGridView1.DataSource as DataTable).Rows)
                {
                    NewLine = "";
                    rowCount++;

                    for (int i = 0; i < (dataGridView1.DataSource as DataTable).Columns.Count; i++)
                    {

                        if (i >= 1)
                            NewLine += delimeter;

                        switch (i)
                        {
                            case 3:
                                string month = row[i].ToString();
                                if (month.Length < 2)
                                {
                                    month = "0" + month;
                                }

                                if (month == "TABB")
                                {
                                    NewLine += month;
                                }
                                else
                                {
                                    NewLine += "" + month;
                                }
                                break;
                            default:
                                NewLine += row[i];
                                break;
                        }

                    }

                    percentage = (int)Math.Round(((double)rowCount / (double)totalRows) * 100d, 0);
                    if (percentage % 10 == 0)
                        workerSaveLGDB.ReportProgress(percentage);

                    Newfile.Append(NewLine);
                    Newfile.Append(Environment.NewLine);
                }

                if (File.Exists(FilePath)) File.Delete(FilePath);

                using (StreamWriter writer =
                new StreamWriter(FilePath))
                {
                    writer.Write(Newfile.ToString());
                }

                SavedText = true;
            }
            catch (Exception ex)
            {
                SavedText = false;
            }
        }

        void workerSaveLGDB_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            if (SavedText)
                MessageBox.Show("File saved.", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            else
                MessageBox.Show("File not saved.", "", MessageBoxButtons.OK, MessageBoxIcon.Error);

           
        }
        void workerSaveLGDB_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            //progressBarControl1.Visible = true;
            //progressBarControl1.Properties.Maximum = 100;
            //progressBarControl1.Position = e.ProgressPercentage;
        }
    }
}
