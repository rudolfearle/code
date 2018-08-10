using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApp1.mSCOA_VaultDataSet1TableAdapters;
using DataGridViewAutoFilter;

namespace WindowsFormsApp1
{
    public partial class Budget_2Segment : Form
    {



        private string SCOATYPE = string.Empty;
        private BackgroundWorker workerLoad;
        private bool LoadOnce;
        //ITEM
        //COSTING
        //REGIONAL
        //FUND
        //FUNCTION
        //PROJECT
        private mSCOA_VaultDataSet.Cons_VaultDataTable objTableDirect;
        private mSCOA_VaultDataSet.Cons_VaultDataTable objTableContra;
        private mSCOA_VaultDataSet.Cons_VaultDataTable objTableFunction;

        private mSCOA_VaultDataSet.Cons_VaultDataTable objTableCosting;
        private mSCOA_VaultDataSet.Cons_VaultDataTable objTableRegional;
        private mSCOA_VaultDataSet.Cons_VaultDataTable objTableFund;
        private mSCOA_VaultDataSet.Cons_VaultDataTable objTableProject;


        private ToolTip toolTip1;

        public Budget_2Segment()
        {
            InitializeComponent();
        }


        private void Form1_Load(object sender, EventArgs e)
        {
            SCOATYPE = "IR";
            dataGridView1.Enabled = false;
            LoadOnce = false;
            toolTip1 = new ToolTip();
            // TODO: This line of code loads data into the 'mSCOA_VaultDataSet1.Lookup_ISU_Vault' table. You can move, or remove it, as needed.
            SetLabels(false);
            InitializeWorkers();
            LoadData();

        }
        private void InitializeWorkers()
        {
            workerLoad = new BackgroundWorker();
            workerLoad.DoWork += workerLoad_DoWork;
            workerLoad.RunWorkerCompleted += workerLoad_RunWorkerCompleted;

        }


        private void LoadData()
        {
            if (workerLoad.IsBusy)
            {
                MessageBox.Show("Data is already being loaded...");
            }
            else
            {
                //gridControlIDPMaster.Visible = false;
                // edtLoadingPanel.Show();
                Cursor.Current = Cursors.WaitCursor;
                workerLoad.RunWorkerAsync();
                //gridControlIDPMaster.Enabled = false;
                // marqueeProgressBarControl1.Properties.Stopped = false;
            }
        }


        void workerLoad_DoWork(object sender, DoWorkEventArgs e)
        {
            RefreshGrid();
            if (LoadOnce == false)
            {
                
                LoadDirect();
                LoadFunction();
                LoadCosting();
                LoadFund();
                LoadProject();
                LoadRegion();

            }
           
        }

        void workerLoad_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {

            if (LoadOnce == false)
            {

                General.Utilities.LoadSCOACombobox(cboDirect, objTableDirect);
                
                General.Utilities.LoadSCOACombobox(cboFunction, objTableFunction);

                General.Utilities.LoadSCOACombobox(cboCosting, objTableCosting);
                General.Utilities.LoadSCOACombobox(cboRegion, objTableRegional);
                General.Utilities.LoadSCOACombobox(cboFund, objTableFund);
                General.Utilities.LoadSCOACombobox(cboProject, objTableProject);

                LoadOnce = true;
            }
            dataGridView1.Enabled = true;
            Cursor.Current = Cursors.Default;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int nPos = e.RowIndex;

            SetLabels(true);

        }


        private void RefreshGrid()
        {
            try
            {

                Lookup_Vault_Budget_2Segment_ComboTableAdapter ta = new Lookup_Vault_Budget_2Segment_ComboTableAdapter();
              
                ta.Fill(this.mSCOA_VaultDataSet1.Lookup_Vault_Budget_2Segment_Combo);
                BeginInvoke((MethodInvoker)delegate
                {
                    BindingSource bs = new BindingSource();
                    bs.DataSource = this.mSCOA_VaultDataSet1.Lookup_Vault_Budget_2Segment_Combo;
                    dataGridView1.DataSource = bs;
                    bs.ResetBindings(false);
                    //dataGridView1.DataSource = this.mSCOA_VaultDataSet1.Lookup_Vault_HCM;
                    dataGridView1.Refresh();
                });
            }
            catch (Exception ex)
            {

            }
        }

        private void SetLabels(bool value)
        {
            label1.Enabled = value;
          
            label4.Enabled = value;

            label5.Enabled = value;
            label6.Enabled = value;
            label7.Enabled = value;
            label8.Enabled = value;

         
            cboDirect.Enabled = value;
            cboFunction.Enabled = value;

            cboCosting.Enabled = value;
            cboFund.Enabled = value;
            cboRegion.Enabled = value;
            cboProject.Enabled = value;

            btnUpdate.Enabled = value;

            rdoAssets.Enabled = value;
            rdoLaibilities.Enabled = value;
            rdoExpense.Enabled = value;
            rdoItem.Enabled = value;

        }


        private void LoadDirect()
        {
            try
            {
                //this.cons_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet.Cons_Vault);
                using (mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter ta = new mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter())
                {
                    mSCOA_VaultDataSet.Cons_VaultDataTable Tbl = new mSCOA_VaultDataSet.Cons_VaultDataTable();
                    ta.FillByDirect(Tbl, SCOATYPE);
                    objTableDirect = Tbl;
                }

            }
            catch (Exception ex)
            {

            }

        }

   
        private void LoadFunction()
        {
            try
            {
                //this.cons_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet.Cons_Vault);
                using (mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter ta = new mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter())
                {
                    mSCOA_VaultDataSet.Cons_VaultDataTable Tbl = new mSCOA_VaultDataSet.Cons_VaultDataTable();
                    ta.FillByFunction(Tbl);
                    objTableFunction = Tbl;
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void LoadCosting()
        {
            try
            {
                //this.cons_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet.Cons_Vault);
                using (mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter ta = new mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter())
                {
                    mSCOA_VaultDataSet.Cons_VaultDataTable Tbl = new mSCOA_VaultDataSet.Cons_VaultDataTable();
                    ta.FillByCosting(Tbl);
                    objTableCosting = Tbl;
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void LoadRegion()
        {
            try
            {
                //this.cons_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet.Cons_Vault);
                using (mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter ta = new mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter())
                {
                    mSCOA_VaultDataSet.Cons_VaultDataTable Tbl = new mSCOA_VaultDataSet.Cons_VaultDataTable();
                    ta.FillByRegion(Tbl);
                    objTableRegional = Tbl;
                }
            }
            catch (Exception ex)
            {

            }
        }


        private void LoadFund()
        {
            try
            {
                //this.cons_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet.Cons_Vault);
                using (mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter ta = new mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter())
                {
                    mSCOA_VaultDataSet.Cons_VaultDataTable Tbl = new mSCOA_VaultDataSet.Cons_VaultDataTable();
                    ta.FillByFund(Tbl);
                    objTableFund = Tbl;
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void LoadProject()
        {
            try
            {
                //this.cons_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet.Cons_Vault);
                using (mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter ta = new mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter())
                {
                    mSCOA_VaultDataSet.Cons_VaultDataTable Tbl = new mSCOA_VaultDataSet.Cons_VaultDataTable();
                    ta.FillByProject(Tbl);
                    objTableProject = Tbl;
                }
            }
            catch (Exception ex)
            {

            }
        }


        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (cboDirect.SelectedIndex > 0 )
            {
                foreach (DataGridViewRow row in dataGridView1.Rows)
                {
                    // do something with the row..
                    if (row.Selected == true)
                    {
                        //int nID = Convert.ToInt32(row.Cells["Id_Vault_HCM"].Value);
                        int nID = Convert.ToInt32(row.Cells[row.Cells.Count - 1].Value);
                        string sDirectGUID = cboDirect.SelectedValue.ToString();
                        //string sContraGUID = cboContra.SelectedValue.ToString();
                        string sFunctionGUID = cboFunction.SelectedValue.ToString();
                        string sCostingGUID = cboCosting.SelectedValue.ToString();
                        string sFundGUID = cboFund.SelectedValue.ToString();
                        string sProjectGUID = cboProject.SelectedValue.ToString();
                        string sRegionGUID = cboRegion.SelectedValue.ToString();


                        using (Lookup_Vault_Budget_2Segment_ComboTableAdapter  ta = new Lookup_Vault_Budget_2Segment_ComboTableAdapter())
                        {
                            ta.UpdateQuery(sProjectGUID, sFundGUID, sDirectGUID, sRegionGUID, sFunctionGUID, sCostingGUID, nID);
                        }
                    }
                }
                LoadData();
            }
            else
            {
                MessageBox.Show("Please select a value first in dropdown", "Update Item", MessageBoxButtons.OK);
            }
        }

        private void Lookup_ISU_Vault_Resize(object sender, EventArgs e)
        {
            dataGridView1.Size = new Size(this.Width - 10, dataGridView1.Height);
        }

        private void cboDirect_DropDownClosed(object sender, EventArgs e)
        {
            toolTip1.Hide(cboDirect);
        }

        private void cboDirect_DrawItem(object sender, DrawItemEventArgs e)
        {
            if (e.Index < 0) { return; }
            string text = cboDirect.GetItemText(cboDirect.Items[e.Index]);
            e.DrawBackground();
            using (SolidBrush br = new SolidBrush(e.ForeColor))
            { e.Graphics.DrawString(text, e.Font, br, e.Bounds); }
            if ((e.State & DrawItemState.Selected) == DrawItemState.Selected)
            { toolTip1.Show(text, cboDirect, e.Bounds.Right, e.Bounds.Bottom); }
            e.DrawFocusRectangle();
        }

        private void dataGridView1_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
            String filterStatus = DataGridViewAutoFilterColumnHeaderCell
             .GetFilterStatus(dataGridView1);
            if (String.IsNullOrEmpty(filterStatus))
            {
                showAllLabel.Visible = false;
                filterStatusLabel.Visible = false;
            }
            else
            {
                showAllLabel.Visible = true;
                filterStatusLabel.Visible = true;
                filterStatusLabel.Text = filterStatus;
            }
        }

        private void dataGridView1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Alt && (e.KeyCode == Keys.Down || e.KeyCode == Keys.Up))
            {
                DataGridViewAutoFilterColumnHeaderCell filterCell =
                    dataGridView1.CurrentCell.OwningColumn.HeaderCell as
                    DataGridViewAutoFilterColumnHeaderCell;
                if (filterCell != null)
                {
                    filterCell.ShowDropDownList();
                    e.Handled = true;
                }
            }
        }

        private void showAllLabel_Click(object sender, EventArgs e)
        {
            DataGridViewAutoFilterColumnHeaderCell.RemoveFilter(dataGridView1);
        }

        private void rdoItem_Click(object sender, EventArgs e)
        {
            RadioButton btn = (RadioButton)sender;
            switch (btn.Text)
            {
                case "Revenue":
                    SCOATYPE = "IR";
                    break;
                case "Expense":
                    SCOATYPE = "IE";
                    break;
                case "Assets":
                    SCOATYPE = "IA";
                    break;
                case "Laibilities":
                    SCOATYPE = "IL";
                    break;
            }
        }
    }
}
