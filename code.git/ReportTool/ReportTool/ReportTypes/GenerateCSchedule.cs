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
        public GenerateCSchedule()
        {
            InitializeComponent();
            LoadMonthList();
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


        private void btnGenerate_Click(object sender, EventArgs e)
        {

        }

        private void btnExport_Click(object sender, EventArgs e)
        {

        }



    }
}
