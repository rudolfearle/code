using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace WindowsFormsApp1
{
    public partial class Lookup_ISU_Vault : Form
    {

        private BackgroundWorker workerLoad;
        private bool LoadOnce;
        private mSCOA_VaultDataSet.Cons_VaultDataTable objTableDirect;
        private mSCOA_VaultDataSet.Cons_VaultDataTable objTableContra;
        private mSCOA_VaultDataSet.Cons_VaultDataTable objTableFunction;
        private ToolTip toolTip1;

        public Lookup_ISU_Vault()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
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
                LoadContra();
                LoadDirect();
                
            }
        }

        void workerLoad_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {

            if (LoadOnce == false)
            {
                cboDirect.DataSource = objTableDirect;
                cboDirect.ValueMember = "GUID";
                cboDirect.DisplayMember = "Account_Name";
                cboDirect.Refresh();

                cboContra.DataSource = objTableContra;
                cboContra.ValueMember = "GUID";
                cboContra.DisplayMember = "Account_Name";
                cboContra.Refresh();

                cboFunction.DataSource = objTableFunction;
                cboFunction.ValueMember = "GUID";
                cboFunction.DisplayMember = "Account_Name";
                cboFunction.Refresh();
              
                LoadOnce = true;
            }

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
                this.lookup_ISU_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet1.Lookup_ISU_Vault);
                BeginInvoke((MethodInvoker)delegate
                {
                    dataGridView1.DataSource = this.mSCOA_VaultDataSet1.Lookup_ISU_Vault;
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
            label2.Enabled = value;
            label4.Enabled = value;
            cboContra.Enabled = value;
            cboDirect.Enabled = value;
            cboFunction.Enabled = value;
            btnUpdate.Enabled = value;

        }


        private void LoadDirect()
        {
            try
            {
                //this.cons_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet.Cons_Vault);
                using (mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter ta = new mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter())
                {
                    mSCOA_VaultDataSet.Cons_VaultDataTable Tbl = new mSCOA_VaultDataSet.Cons_VaultDataTable();
                    ta.FillByDirect(Tbl);
                    objTableDirect = Tbl;
                }
                
            }
            catch (Exception ex)
            {

            }
            
        }

        private void LoadContra()
        {

            try
            {
                //this.cons_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet.Cons_Vault);
                using (mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter ta = new mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter())
                {
                    mSCOA_VaultDataSet.Cons_VaultDataTable Tbl = new mSCOA_VaultDataSet.Cons_VaultDataTable();
                    ta.FillByContra(Tbl);
                    objTableContra = Tbl;
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

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (cboDirect.SelectedIndex > 0 && cboContra.SelectedIndex > 0)
            {
                foreach (DataGridViewRow row in dataGridView1.Rows)
                {
                    // do something with the row..
                    if (row.Selected == true)
                    {
                        int nID = Convert.ToInt32(row.Cells["Id_ISU_Vault"].Value);
                        string sDirectGUID = cboDirect.SelectedValue.ToString();
                        string sContraGUID = cboContra.SelectedValue.ToString();
                        string sFunctionGUID = cboFunction.SelectedValue.ToString();
                        lookup_ISU_VaultTableAdapter.UpdateQuery(sDirectGUID, sContraGUID, sFunctionGUID, nID);
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
    }
}
