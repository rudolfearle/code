using ReportTool.GeneratedReport;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ReportTool.ReportTypes
{
    public partial class GenerateCSchedule : Form
    {
        BackgroundWorker workerLoad = new BackgroundWorker();
        string sReturnFile = string.Empty;

        private string _Month = string.Empty;
        private string _RegionIdentifier = string.Empty; 

        public GenerateCSchedule()
        {
            InitializeComponent();
            LoadMonthList();
            lblSavedFile.Text = string.Empty;
            workerLoad.DoWork += workerLoad_DoWork;
            workerLoad.RunWorkerCompleted += workerLoad_RunWorkerCompleted;
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

        void workerLoad_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            lblSavedFile.Text = sReturnFile;
            Cursor.Current = Cursors.Default;
        }

        private void btnGenerate_Click_1(object sender, EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;
            
            _Month = cboMonth.SelectedValue.ToString();
            _RegionIdentifier = txtMuniciplaIdentifier.Text.ToString();
            workerLoad.RunWorkerAsync();

        }

        void workerLoad_DoWork(object sender, DoWorkEventArgs e)
        {
           
            string _templatePath = AppDomain.CurrentDomain.BaseDirectory + "Template";

            string sFile = _templatePath + "\\" + System.Configuration.ConfigurationManager.AppSettings.Get("C1Template").ToString();
            using (CSchedule objSheet = new CSchedule(sFile, _Month, _RegionIdentifier))
            {
                sReturnFile = objSheet.RunPopulation();
            }
        }
    }
}
