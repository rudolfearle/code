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

        public Lookup_ISU_Vault()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            LoadOnce = false;

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
                LoadDirect();
                LoadContra();
                LoadOnce = true;
            }
        }

        void workerLoad_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            //
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int nPos = e.RowIndex;
            
            SetLabels(true);

        }

        
        private void RefreshGrid()
        {
            this.lookup_ISU_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet1.Lookup_ISU_Vault);
            BeginInvoke((MethodInvoker)delegate
            {
                dataGridView1.DataSource = this.mSCOA_VaultDataSet1.Lookup_ISU_Vault;
                dataGridView1.Refresh();
            });
        }

        private void SetLabels(bool value)
        {
            label1.Enabled = value;
            label2.Enabled = value;
            cboContra.Enabled = value;
            cboDirect.Enabled = value;
            btnUpdate.Enabled = value;
        }


        private void LoadDirect()
        {
            //this.cons_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet.Cons_Vault);
            cons_VaultTableAdapter.FillByDirect(this.mSCOA_VaultDataSet.Cons_Vault);
            cboDirect.DataSource = this.mSCOA_VaultDataSet.Cons_Vault;
            BeginInvoke((MethodInvoker)delegate
            {
                cboDirect.ValueMember = "GUID";
                cboDirect.DisplayMember = "Account_Name";
                cboDirect.Refresh();
            });
            
        }

        private void LoadContra()
        {
            //this.cons_VaultTableAdapter.Fill(this.mSCOA_VaultDataSet.Cons_Vault);
            cons_VaultTableAdapter.FillByContra(this.mSCOA_VaultDataSet.Cons_Vault);
            cboContra.DataSource = this.mSCOA_VaultDataSet.Cons_Vault;
            BeginInvoke((MethodInvoker)delegate
            {
                cboContra.ValueMember = "GUID";
                cboContra.DisplayMember = "Account_Name";
                cboContra.Refresh();
            });
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
                        lookup_ISU_VaultTableAdapter.UpdateQuery(sDirectGUID, sContraGUID, nID);
                       
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
    }
}
