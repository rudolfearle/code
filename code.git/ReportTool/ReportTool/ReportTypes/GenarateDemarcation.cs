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
    public partial class GenarateDemarcation : Form
    {
        int nSelection;
        BackgroundWorker workerReport;
        string _SavFile;
        private GeneratedReport.OSASchedule objOSA = null;


        public GenarateDemarcation()
        {
            InitializeComponent();
            LoadMonthList();
            grpFields.Enabled = false;
            InitializeWorkers();
        }

        private void InitializeWorkers()
        {
            workerReport = new BackgroundWorker();
            workerReport.DoWork += workerReport_DoWork;
            workerReport.RunWorkerCompleted += workerReport_RunWorkerCompleted;
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


        void workerReport_DoWork(object sender, DoWorkEventArgs e)
        {
            List<object> GenList = e.Argument as List<object>;
            _SavFile = string.Empty;

            switch (nSelection)
            {
                case 1: //OSA
                    _SavFile = objOSA.GenerateReport(GenList[0].ToString(), GenList[1].ToString(), "xls", Convert.ToInt32(GenList[2].ToString()), GenList[3].ToString());
                    break;
                case 2: // BSA
                    break;
                case 3: //Age Debtors
                    break;
                case 4: //Age Credors
                    break;

            }
           
        }

        void workerReport_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            MessageBox.Show("Report Completed: " + _SavFile);
        }


        private void btnGenerate_Click(object sender, EventArgs e)
        {

            List<object> arguments = new List<object>();
            string Month = cboMonth.SelectedValue.ToString();
            string TemplateName = Application.ExecutablePath + "\\Template";
            string Name = string.Empty;
            switch (nSelection )
            {
                case 1: // OSA
                    Name = "Muncde_OSA_ccyy_Mnn";
                    arguments.Add(TemplateName);
                    arguments.Add(Name);
                    arguments.Add("2018");
                    arguments.Add(Month);

                    workerReport.RunWorkerAsync(arguments);
                    break;
                case 2: // BSA
                    Name = "Muncde_BSA_ccyy_Y";
                    arguments.Add(TemplateName);
                    arguments.Add(Name);
                    arguments.Add("2018");
                    arguments.Add(string.Empty);

                    workerReport.RunWorkerAsync(arguments);
                    break;
                case 3: // Age Debtors

                    break;
                case 4: // Age Credtors

                    break;
            }
        }


        private void rdoCString_CheckedChanged(object sender, EventArgs e)
        {
            nSelection = 1;
            grpFields.Enabled = true;
        }

        private void rdoAD_CheckedChanged(object sender, EventArgs e)
        {
            nSelection = 2;
            grpFields.Enabled = true;
        }

        private void rdoAC_CheckedChanged(object sender, EventArgs e)
        {
            nSelection = 3;
            grpFields.Enabled = true;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            nSelection = 4;
            grpFields.Enabled = true;
        }
    }
}
