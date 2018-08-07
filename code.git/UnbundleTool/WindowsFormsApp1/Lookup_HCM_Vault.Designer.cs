namespace WindowsFormsApp1
{
    partial class Lookup_HCM_Vault
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.rATECATDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.dESCDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.divisionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.nameDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.codeDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.mainCodeDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.mainsDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.subCodeDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.subDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.docTypeDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.divFiCaDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.fiCaMainsDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.subsFiCaDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.dbtCntGLDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.revenueGLDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.sAPCodeDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.sAPDescriptionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.nonFinGroupCodeDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.nonFinGroupDescriptionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.nonFinSubGroupCodeDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.nonFinSubGroupDescriptionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.projectGuidDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.projectDescriptionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.functionGuidDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.functionDescriptionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.fundGuidDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.fundDescriptionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.regionGuidDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.regionDescriptionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.costingGuidDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.costingDescriptionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.recommendedInvoiceGuidDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.recommendedInvoiceDescriptionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.recommendedReceiptGuidDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.recommendedReceiptDescriptionDataGridViewTextBoxColumn = new DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn();
            this.idISUVaultDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lookupISUVaultBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.mSCOA_VaultDataSet1 = new WindowsFormsApp1.mSCOA_VaultDataSet1();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.filterStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.showAllLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.label3 = new System.Windows.Forms.Label();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.cboProject = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.cboCosting = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.cboRegion = new System.Windows.Forms.ComboBox();
            this.cboDirect = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.cboContra = new System.Windows.Forms.ComboBox();
            this.cboFund = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.cboFunction = new System.Windows.Forms.ComboBox();
            this.lookupISUVaultBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.lookup_ISU_VaultTableAdapter = new WindowsFormsApp1.mSCOA_VaultDataSet1TableAdapters.Lookup_ISU_VaultTableAdapter();
            this.mSCOA_VaultDataSet = new WindowsFormsApp1.mSCOA_VaultDataSet();
            this.consVaultBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cons_VaultTableAdapter = new WindowsFormsApp1.mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter();
            this.consVaultBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lookupISUVaultBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mSCOA_VaultDataSet1)).BeginInit();
            this.statusStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.lookupISUVaultBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mSCOA_VaultDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.consVaultBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.consVaultBindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.dataGridView1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.statusStrip1);
            this.splitContainer1.Panel2.Controls.Add(this.label3);
            this.splitContainer1.Panel2.Controls.Add(this.btnUpdate);
            this.splitContainer1.Panel2.Controls.Add(this.cboProject);
            this.splitContainer1.Panel2.Controls.Add(this.label8);
            this.splitContainer1.Panel2.Controls.Add(this.cboCosting);
            this.splitContainer1.Panel2.Controls.Add(this.label2);
            this.splitContainer1.Panel2.Controls.Add(this.label5);
            this.splitContainer1.Panel2.Controls.Add(this.label1);
            this.splitContainer1.Panel2.Controls.Add(this.cboRegion);
            this.splitContainer1.Panel2.Controls.Add(this.cboDirect);
            this.splitContainer1.Panel2.Controls.Add(this.label6);
            this.splitContainer1.Panel2.Controls.Add(this.cboContra);
            this.splitContainer1.Panel2.Controls.Add(this.cboFund);
            this.splitContainer1.Panel2.Controls.Add(this.label4);
            this.splitContainer1.Panel2.Controls.Add(this.label7);
            this.splitContainer1.Panel2.Controls.Add(this.cboFunction);
            this.splitContainer1.Size = new System.Drawing.Size(862, 572);
            this.splitContainer1.SplitterDistance = 268;
            this.splitContainer1.TabIndex = 0;
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.rATECATDataGridViewTextBoxColumn,
            this.dESCDataGridViewTextBoxColumn,
            this.divisionDataGridViewTextBoxColumn,
            this.nameDataGridViewTextBoxColumn,
            this.codeDataGridViewTextBoxColumn,
            this.mainCodeDataGridViewTextBoxColumn,
            this.mainsDataGridViewTextBoxColumn,
            this.subCodeDataGridViewTextBoxColumn,
            this.subDataGridViewTextBoxColumn,
            this.docTypeDataGridViewTextBoxColumn,
            this.divFiCaDataGridViewTextBoxColumn,
            this.fiCaMainsDataGridViewTextBoxColumn,
            this.subsFiCaDataGridViewTextBoxColumn,
            this.dbtCntGLDataGridViewTextBoxColumn,
            this.revenueGLDataGridViewTextBoxColumn,
            this.sAPCodeDataGridViewTextBoxColumn,
            this.sAPDescriptionDataGridViewTextBoxColumn,
            this.nonFinGroupCodeDataGridViewTextBoxColumn,
            this.nonFinGroupDescriptionDataGridViewTextBoxColumn,
            this.nonFinSubGroupCodeDataGridViewTextBoxColumn,
            this.nonFinSubGroupDescriptionDataGridViewTextBoxColumn,
            this.projectGuidDataGridViewTextBoxColumn,
            this.projectDescriptionDataGridViewTextBoxColumn,
            this.functionGuidDataGridViewTextBoxColumn,
            this.functionDescriptionDataGridViewTextBoxColumn,
            this.fundGuidDataGridViewTextBoxColumn,
            this.fundDescriptionDataGridViewTextBoxColumn,
            this.regionGuidDataGridViewTextBoxColumn,
            this.regionDescriptionDataGridViewTextBoxColumn,
            this.costingGuidDataGridViewTextBoxColumn,
            this.costingDescriptionDataGridViewTextBoxColumn,
            this.recommendedInvoiceGuidDataGridViewTextBoxColumn,
            this.recommendedInvoiceDescriptionDataGridViewTextBoxColumn,
            this.recommendedReceiptGuidDataGridViewTextBoxColumn,
            this.recommendedReceiptDescriptionDataGridViewTextBoxColumn,
            this.idISUVaultDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.lookupISUVaultBindingSource1;
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.Location = new System.Drawing.Point(0, 0);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(862, 268);
            this.dataGridView1.TabIndex = 34;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // rATECATDataGridViewTextBoxColumn
            // 
            this.rATECATDataGridViewTextBoxColumn.DataPropertyName = "RATE_CAT";
            this.rATECATDataGridViewTextBoxColumn.HeaderText = "RATE_CAT";
            this.rATECATDataGridViewTextBoxColumn.Name = "rATECATDataGridViewTextBoxColumn";
            this.rATECATDataGridViewTextBoxColumn.ReadOnly = true;
            this.rATECATDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // dESCDataGridViewTextBoxColumn
            // 
            this.dESCDataGridViewTextBoxColumn.DataPropertyName = "DESC";
            this.dESCDataGridViewTextBoxColumn.HeaderText = "DESC";
            this.dESCDataGridViewTextBoxColumn.Name = "dESCDataGridViewTextBoxColumn";
            this.dESCDataGridViewTextBoxColumn.ReadOnly = true;
            this.dESCDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // divisionDataGridViewTextBoxColumn
            // 
            this.divisionDataGridViewTextBoxColumn.DataPropertyName = "Division";
            this.divisionDataGridViewTextBoxColumn.HeaderText = "Division";
            this.divisionDataGridViewTextBoxColumn.Name = "divisionDataGridViewTextBoxColumn";
            this.divisionDataGridViewTextBoxColumn.ReadOnly = true;
            this.divisionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // nameDataGridViewTextBoxColumn
            // 
            this.nameDataGridViewTextBoxColumn.DataPropertyName = "Name";
            this.nameDataGridViewTextBoxColumn.HeaderText = "Name";
            this.nameDataGridViewTextBoxColumn.Name = "nameDataGridViewTextBoxColumn";
            this.nameDataGridViewTextBoxColumn.ReadOnly = true;
            this.nameDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // codeDataGridViewTextBoxColumn
            // 
            this.codeDataGridViewTextBoxColumn.DataPropertyName = "Code";
            this.codeDataGridViewTextBoxColumn.HeaderText = "Code";
            this.codeDataGridViewTextBoxColumn.Name = "codeDataGridViewTextBoxColumn";
            this.codeDataGridViewTextBoxColumn.ReadOnly = true;
            this.codeDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // mainCodeDataGridViewTextBoxColumn
            // 
            this.mainCodeDataGridViewTextBoxColumn.DataPropertyName = "MainCode";
            this.mainCodeDataGridViewTextBoxColumn.HeaderText = "MainCode";
            this.mainCodeDataGridViewTextBoxColumn.Name = "mainCodeDataGridViewTextBoxColumn";
            this.mainCodeDataGridViewTextBoxColumn.ReadOnly = true;
            this.mainCodeDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // mainsDataGridViewTextBoxColumn
            // 
            this.mainsDataGridViewTextBoxColumn.DataPropertyName = "Mains";
            this.mainsDataGridViewTextBoxColumn.HeaderText = "Mains";
            this.mainsDataGridViewTextBoxColumn.Name = "mainsDataGridViewTextBoxColumn";
            this.mainsDataGridViewTextBoxColumn.ReadOnly = true;
            this.mainsDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // subCodeDataGridViewTextBoxColumn
            // 
            this.subCodeDataGridViewTextBoxColumn.DataPropertyName = "SubCode";
            this.subCodeDataGridViewTextBoxColumn.HeaderText = "SubCode";
            this.subCodeDataGridViewTextBoxColumn.Name = "subCodeDataGridViewTextBoxColumn";
            this.subCodeDataGridViewTextBoxColumn.ReadOnly = true;
            this.subCodeDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // subDataGridViewTextBoxColumn
            // 
            this.subDataGridViewTextBoxColumn.DataPropertyName = "Sub";
            this.subDataGridViewTextBoxColumn.HeaderText = "Sub";
            this.subDataGridViewTextBoxColumn.Name = "subDataGridViewTextBoxColumn";
            this.subDataGridViewTextBoxColumn.ReadOnly = true;
            this.subDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // docTypeDataGridViewTextBoxColumn
            // 
            this.docTypeDataGridViewTextBoxColumn.DataPropertyName = "Doc_Type";
            this.docTypeDataGridViewTextBoxColumn.HeaderText = "Doc_Type";
            this.docTypeDataGridViewTextBoxColumn.Name = "docTypeDataGridViewTextBoxColumn";
            this.docTypeDataGridViewTextBoxColumn.ReadOnly = true;
            this.docTypeDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // divFiCaDataGridViewTextBoxColumn
            // 
            this.divFiCaDataGridViewTextBoxColumn.DataPropertyName = "Div__FiCa";
            this.divFiCaDataGridViewTextBoxColumn.HeaderText = "Div__FiCa";
            this.divFiCaDataGridViewTextBoxColumn.Name = "divFiCaDataGridViewTextBoxColumn";
            this.divFiCaDataGridViewTextBoxColumn.ReadOnly = true;
            this.divFiCaDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // fiCaMainsDataGridViewTextBoxColumn
            // 
            this.fiCaMainsDataGridViewTextBoxColumn.DataPropertyName = "FiCa_Mains";
            this.fiCaMainsDataGridViewTextBoxColumn.HeaderText = "FiCa_Mains";
            this.fiCaMainsDataGridViewTextBoxColumn.Name = "fiCaMainsDataGridViewTextBoxColumn";
            this.fiCaMainsDataGridViewTextBoxColumn.ReadOnly = true;
            this.fiCaMainsDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // subsFiCaDataGridViewTextBoxColumn
            // 
            this.subsFiCaDataGridViewTextBoxColumn.DataPropertyName = "Subs_FiCa";
            this.subsFiCaDataGridViewTextBoxColumn.HeaderText = "Subs_FiCa";
            this.subsFiCaDataGridViewTextBoxColumn.Name = "subsFiCaDataGridViewTextBoxColumn";
            this.subsFiCaDataGridViewTextBoxColumn.ReadOnly = true;
            this.subsFiCaDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // dbtCntGLDataGridViewTextBoxColumn
            // 
            this.dbtCntGLDataGridViewTextBoxColumn.DataPropertyName = "DbtCnt_GL";
            this.dbtCntGLDataGridViewTextBoxColumn.HeaderText = "DbtCnt_GL";
            this.dbtCntGLDataGridViewTextBoxColumn.Name = "dbtCntGLDataGridViewTextBoxColumn";
            this.dbtCntGLDataGridViewTextBoxColumn.ReadOnly = true;
            this.dbtCntGLDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // revenueGLDataGridViewTextBoxColumn
            // 
            this.revenueGLDataGridViewTextBoxColumn.DataPropertyName = "Revenue_GL";
            this.revenueGLDataGridViewTextBoxColumn.HeaderText = "Revenue_GL";
            this.revenueGLDataGridViewTextBoxColumn.Name = "revenueGLDataGridViewTextBoxColumn";
            this.revenueGLDataGridViewTextBoxColumn.ReadOnly = true;
            this.revenueGLDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // sAPCodeDataGridViewTextBoxColumn
            // 
            this.sAPCodeDataGridViewTextBoxColumn.DataPropertyName = "SAP_Code";
            this.sAPCodeDataGridViewTextBoxColumn.HeaderText = "SAP_Code";
            this.sAPCodeDataGridViewTextBoxColumn.Name = "sAPCodeDataGridViewTextBoxColumn";
            this.sAPCodeDataGridViewTextBoxColumn.ReadOnly = true;
            this.sAPCodeDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // sAPDescriptionDataGridViewTextBoxColumn
            // 
            this.sAPDescriptionDataGridViewTextBoxColumn.DataPropertyName = "SAP_Description";
            this.sAPDescriptionDataGridViewTextBoxColumn.HeaderText = "SAP_Description";
            this.sAPDescriptionDataGridViewTextBoxColumn.Name = "sAPDescriptionDataGridViewTextBoxColumn";
            this.sAPDescriptionDataGridViewTextBoxColumn.ReadOnly = true;
            this.sAPDescriptionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // nonFinGroupCodeDataGridViewTextBoxColumn
            // 
            this.nonFinGroupCodeDataGridViewTextBoxColumn.DataPropertyName = "Non_Fin_Group_Code";
            this.nonFinGroupCodeDataGridViewTextBoxColumn.HeaderText = "Non_Fin_Group_Code";
            this.nonFinGroupCodeDataGridViewTextBoxColumn.Name = "nonFinGroupCodeDataGridViewTextBoxColumn";
            this.nonFinGroupCodeDataGridViewTextBoxColumn.ReadOnly = true;
            this.nonFinGroupCodeDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // nonFinGroupDescriptionDataGridViewTextBoxColumn
            // 
            this.nonFinGroupDescriptionDataGridViewTextBoxColumn.DataPropertyName = "Non_Fin_Group_Description";
            this.nonFinGroupDescriptionDataGridViewTextBoxColumn.HeaderText = "Non_Fin_Group_Description";
            this.nonFinGroupDescriptionDataGridViewTextBoxColumn.Name = "nonFinGroupDescriptionDataGridViewTextBoxColumn";
            this.nonFinGroupDescriptionDataGridViewTextBoxColumn.ReadOnly = true;
            this.nonFinGroupDescriptionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // nonFinSubGroupCodeDataGridViewTextBoxColumn
            // 
            this.nonFinSubGroupCodeDataGridViewTextBoxColumn.DataPropertyName = "Non_Fin_Sub_Group_Code";
            this.nonFinSubGroupCodeDataGridViewTextBoxColumn.HeaderText = "Non_Fin_Sub_Group_Code";
            this.nonFinSubGroupCodeDataGridViewTextBoxColumn.Name = "nonFinSubGroupCodeDataGridViewTextBoxColumn";
            this.nonFinSubGroupCodeDataGridViewTextBoxColumn.ReadOnly = true;
            this.nonFinSubGroupCodeDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // nonFinSubGroupDescriptionDataGridViewTextBoxColumn
            // 
            this.nonFinSubGroupDescriptionDataGridViewTextBoxColumn.DataPropertyName = "Non_Fin_Sub_Group_Description";
            this.nonFinSubGroupDescriptionDataGridViewTextBoxColumn.HeaderText = "Non_Fin_Sub_Group_Description";
            this.nonFinSubGroupDescriptionDataGridViewTextBoxColumn.Name = "nonFinSubGroupDescriptionDataGridViewTextBoxColumn";
            this.nonFinSubGroupDescriptionDataGridViewTextBoxColumn.ReadOnly = true;
            this.nonFinSubGroupDescriptionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // projectGuidDataGridViewTextBoxColumn
            // 
            this.projectGuidDataGridViewTextBoxColumn.DataPropertyName = "Project_Guid";
            this.projectGuidDataGridViewTextBoxColumn.HeaderText = "Project_Guid";
            this.projectGuidDataGridViewTextBoxColumn.Name = "projectGuidDataGridViewTextBoxColumn";
            this.projectGuidDataGridViewTextBoxColumn.ReadOnly = true;
            this.projectGuidDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // projectDescriptionDataGridViewTextBoxColumn
            // 
            this.projectDescriptionDataGridViewTextBoxColumn.DataPropertyName = "Project_Description";
            this.projectDescriptionDataGridViewTextBoxColumn.HeaderText = "Project_Description";
            this.projectDescriptionDataGridViewTextBoxColumn.Name = "projectDescriptionDataGridViewTextBoxColumn";
            this.projectDescriptionDataGridViewTextBoxColumn.ReadOnly = true;
            this.projectDescriptionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // functionGuidDataGridViewTextBoxColumn
            // 
            this.functionGuidDataGridViewTextBoxColumn.DataPropertyName = "Function_Guid";
            this.functionGuidDataGridViewTextBoxColumn.HeaderText = "Function_Guid";
            this.functionGuidDataGridViewTextBoxColumn.Name = "functionGuidDataGridViewTextBoxColumn";
            this.functionGuidDataGridViewTextBoxColumn.ReadOnly = true;
            this.functionGuidDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // functionDescriptionDataGridViewTextBoxColumn
            // 
            this.functionDescriptionDataGridViewTextBoxColumn.DataPropertyName = "Function_Description";
            this.functionDescriptionDataGridViewTextBoxColumn.HeaderText = "Function_Description";
            this.functionDescriptionDataGridViewTextBoxColumn.Name = "functionDescriptionDataGridViewTextBoxColumn";
            this.functionDescriptionDataGridViewTextBoxColumn.ReadOnly = true;
            this.functionDescriptionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // fundGuidDataGridViewTextBoxColumn
            // 
            this.fundGuidDataGridViewTextBoxColumn.DataPropertyName = "Fund_Guid";
            this.fundGuidDataGridViewTextBoxColumn.HeaderText = "Fund_Guid";
            this.fundGuidDataGridViewTextBoxColumn.Name = "fundGuidDataGridViewTextBoxColumn";
            this.fundGuidDataGridViewTextBoxColumn.ReadOnly = true;
            this.fundGuidDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // fundDescriptionDataGridViewTextBoxColumn
            // 
            this.fundDescriptionDataGridViewTextBoxColumn.DataPropertyName = "Fund_Description";
            this.fundDescriptionDataGridViewTextBoxColumn.HeaderText = "Fund_Description";
            this.fundDescriptionDataGridViewTextBoxColumn.Name = "fundDescriptionDataGridViewTextBoxColumn";
            this.fundDescriptionDataGridViewTextBoxColumn.ReadOnly = true;
            this.fundDescriptionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // regionGuidDataGridViewTextBoxColumn
            // 
            this.regionGuidDataGridViewTextBoxColumn.DataPropertyName = "Region_Guid";
            this.regionGuidDataGridViewTextBoxColumn.HeaderText = "Region_Guid";
            this.regionGuidDataGridViewTextBoxColumn.Name = "regionGuidDataGridViewTextBoxColumn";
            this.regionGuidDataGridViewTextBoxColumn.ReadOnly = true;
            this.regionGuidDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // regionDescriptionDataGridViewTextBoxColumn
            // 
            this.regionDescriptionDataGridViewTextBoxColumn.DataPropertyName = "Region_Description";
            this.regionDescriptionDataGridViewTextBoxColumn.HeaderText = "Region_Description";
            this.regionDescriptionDataGridViewTextBoxColumn.Name = "regionDescriptionDataGridViewTextBoxColumn";
            this.regionDescriptionDataGridViewTextBoxColumn.ReadOnly = true;
            this.regionDescriptionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // costingGuidDataGridViewTextBoxColumn
            // 
            this.costingGuidDataGridViewTextBoxColumn.DataPropertyName = "Costing_Guid";
            this.costingGuidDataGridViewTextBoxColumn.HeaderText = "Costing_Guid";
            this.costingGuidDataGridViewTextBoxColumn.Name = "costingGuidDataGridViewTextBoxColumn";
            this.costingGuidDataGridViewTextBoxColumn.ReadOnly = true;
            this.costingGuidDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // costingDescriptionDataGridViewTextBoxColumn
            // 
            this.costingDescriptionDataGridViewTextBoxColumn.DataPropertyName = "Costing_Description";
            this.costingDescriptionDataGridViewTextBoxColumn.HeaderText = "Costing_Description";
            this.costingDescriptionDataGridViewTextBoxColumn.Name = "costingDescriptionDataGridViewTextBoxColumn";
            this.costingDescriptionDataGridViewTextBoxColumn.ReadOnly = true;
            this.costingDescriptionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // recommendedInvoiceGuidDataGridViewTextBoxColumn
            // 
            this.recommendedInvoiceGuidDataGridViewTextBoxColumn.DataPropertyName = "Recommended_Invoice_Guid";
            this.recommendedInvoiceGuidDataGridViewTextBoxColumn.HeaderText = "Recommended_Invoice_Guid";
            this.recommendedInvoiceGuidDataGridViewTextBoxColumn.Name = "recommendedInvoiceGuidDataGridViewTextBoxColumn";
            this.recommendedInvoiceGuidDataGridViewTextBoxColumn.ReadOnly = true;
            this.recommendedInvoiceGuidDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // recommendedInvoiceDescriptionDataGridViewTextBoxColumn
            // 
            this.recommendedInvoiceDescriptionDataGridViewTextBoxColumn.DataPropertyName = "Recommended_Invoice_Description";
            this.recommendedInvoiceDescriptionDataGridViewTextBoxColumn.HeaderText = "Recommended_Invoice_Description";
            this.recommendedInvoiceDescriptionDataGridViewTextBoxColumn.Name = "recommendedInvoiceDescriptionDataGridViewTextBoxColumn";
            this.recommendedInvoiceDescriptionDataGridViewTextBoxColumn.ReadOnly = true;
            this.recommendedInvoiceDescriptionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // recommendedReceiptGuidDataGridViewTextBoxColumn
            // 
            this.recommendedReceiptGuidDataGridViewTextBoxColumn.DataPropertyName = "Recommended_Receipt_Guid";
            this.recommendedReceiptGuidDataGridViewTextBoxColumn.HeaderText = "Recommended_Receipt_Guid";
            this.recommendedReceiptGuidDataGridViewTextBoxColumn.Name = "recommendedReceiptGuidDataGridViewTextBoxColumn";
            this.recommendedReceiptGuidDataGridViewTextBoxColumn.ReadOnly = true;
            this.recommendedReceiptGuidDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // recommendedReceiptDescriptionDataGridViewTextBoxColumn
            // 
            this.recommendedReceiptDescriptionDataGridViewTextBoxColumn.DataPropertyName = "Recommended_Receipt_Description";
            this.recommendedReceiptDescriptionDataGridViewTextBoxColumn.HeaderText = "Recommended_Receipt_Description";
            this.recommendedReceiptDescriptionDataGridViewTextBoxColumn.Name = "recommendedReceiptDescriptionDataGridViewTextBoxColumn";
            this.recommendedReceiptDescriptionDataGridViewTextBoxColumn.ReadOnly = true;
            this.recommendedReceiptDescriptionDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // idISUVaultDataGridViewTextBoxColumn
            // 
            this.idISUVaultDataGridViewTextBoxColumn.DataPropertyName = "Id_ISU_Vault";
            this.idISUVaultDataGridViewTextBoxColumn.HeaderText = "Id_ISU_Vault";
            this.idISUVaultDataGridViewTextBoxColumn.Name = "idISUVaultDataGridViewTextBoxColumn";
            this.idISUVaultDataGridViewTextBoxColumn.ReadOnly = true;
            this.idISUVaultDataGridViewTextBoxColumn.Visible = false;
            // 
            // lookupISUVaultBindingSource1
            // 
            this.lookupISUVaultBindingSource1.DataMember = "Lookup_ISU_Vault";
            this.lookupISUVaultBindingSource1.DataSource = this.mSCOA_VaultDataSet1;
            // 
            // mSCOA_VaultDataSet1
            // 
            this.mSCOA_VaultDataSet1.DataSetName = "mSCOA_VaultDataSet1";
            this.mSCOA_VaultDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // statusStrip1
            // 
            this.statusStrip1.Dock = System.Windows.Forms.DockStyle.None;
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.filterStatusLabel,
            this.showAllLabel});
            this.statusStrip1.Location = new System.Drawing.Point(730, 3);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(202, 22);
            this.statusStrip1.TabIndex = 51;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // filterStatusLabel
            // 
            this.filterStatusLabel.Name = "filterStatusLabel";
            this.filterStatusLabel.Size = new System.Drawing.Size(0, 17);
            this.filterStatusLabel.Visible = false;
            // 
            // showAllLabel
            // 
            this.showAllLabel.IsLink = true;
            this.showAllLabel.LinkBehavior = System.Windows.Forms.LinkBehavior.HoverUnderline;
            this.showAllLabel.Name = "showAllLabel";
            this.showAllLabel.Size = new System.Drawing.Size(53, 17);
            this.showAllLabel.Text = "Show &All";
            this.showAllLabel.Visible = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.ForeColor = System.Drawing.Color.Blue;
            this.label3.Location = new System.Drawing.Point(48, 12);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(246, 13);
            this.label3.TabIndex = 40;
            this.label3.Text = "Hold CTRL key down to select multiple rows in grid";
            // 
            // btnUpdate
            // 
            this.btnUpdate.Location = new System.Drawing.Point(359, 265);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(75, 23);
            this.btnUpdate.TabIndex = 39;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = true;
            // 
            // cboProject
            // 
            this.cboProject.FormattingEnabled = true;
            this.cboProject.Location = new System.Drawing.Point(72, 223);
            this.cboProject.Name = "cboProject";
            this.cboProject.Size = new System.Drawing.Size(778, 21);
            this.cboProject.TabIndex = 49;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(12, 231);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(40, 13);
            this.label8.TabIndex = 50;
            this.label8.Text = "Project";
            // 
            // cboCosting
            // 
            this.cboCosting.FormattingEnabled = true;
            this.cboCosting.Location = new System.Drawing.Point(72, 138);
            this.cboCosting.Name = "cboCosting";
            this.cboCosting.Size = new System.Drawing.Size(778, 21);
            this.cboCosting.TabIndex = 43;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 80);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(38, 13);
            this.label2.TabIndex = 38;
            this.label2.Text = "Contra";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 146);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(42, 13);
            this.label5.TabIndex = 44;
            this.label5.Text = "Costing";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 42);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 13);
            this.label1.TabIndex = 37;
            this.label1.Text = "Direct";
            // 
            // cboRegion
            // 
            this.cboRegion.FormattingEnabled = true;
            this.cboRegion.Location = new System.Drawing.Point(72, 169);
            this.cboRegion.Name = "cboRegion";
            this.cboRegion.Size = new System.Drawing.Size(778, 21);
            this.cboRegion.TabIndex = 45;
            // 
            // cboDirect
            // 
            this.cboDirect.FormattingEnabled = true;
            this.cboDirect.Location = new System.Drawing.Point(72, 42);
            this.cboDirect.Name = "cboDirect";
            this.cboDirect.Size = new System.Drawing.Size(778, 21);
            this.cboDirect.TabIndex = 36;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(12, 177);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(41, 13);
            this.label6.TabIndex = 46;
            this.label6.Text = "Region";
            // 
            // cboContra
            // 
            this.cboContra.FormattingEnabled = true;
            this.cboContra.Location = new System.Drawing.Point(72, 72);
            this.cboContra.Name = "cboContra";
            this.cboContra.Size = new System.Drawing.Size(778, 21);
            this.cboContra.TabIndex = 35;
            // 
            // cboFund
            // 
            this.cboFund.FormattingEnabled = true;
            this.cboFund.Location = new System.Drawing.Point(72, 196);
            this.cboFund.Name = "cboFund";
            this.cboFund.Size = new System.Drawing.Size(778, 21);
            this.cboFund.TabIndex = 47;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 113);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(48, 13);
            this.label4.TabIndex = 42;
            this.label4.Text = "Function";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(12, 204);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(31, 13);
            this.label7.TabIndex = 48;
            this.label7.Text = "Fund";
            // 
            // cboFunction
            // 
            this.cboFunction.FormattingEnabled = true;
            this.cboFunction.Location = new System.Drawing.Point(72, 105);
            this.cboFunction.Name = "cboFunction";
            this.cboFunction.Size = new System.Drawing.Size(778, 21);
            this.cboFunction.TabIndex = 41;
            // 
            // lookupISUVaultBindingSource
            // 
            this.lookupISUVaultBindingSource.DataMember = "Lookup_ISU_Vault";
            this.lookupISUVaultBindingSource.DataSource = this.mSCOA_VaultDataSet1;
            // 
            // lookup_ISU_VaultTableAdapter
            // 
            this.lookup_ISU_VaultTableAdapter.ClearBeforeFill = true;
            // 
            // mSCOA_VaultDataSet
            // 
            this.mSCOA_VaultDataSet.DataSetName = "mSCOA_VaultDataSet";
            this.mSCOA_VaultDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // consVaultBindingSource
            // 
            this.consVaultBindingSource.DataMember = "Cons_Vault";
            this.consVaultBindingSource.DataSource = this.mSCOA_VaultDataSet;
            // 
            // cons_VaultTableAdapter
            // 
            this.cons_VaultTableAdapter.ClearBeforeFill = true;
            // 
            // consVaultBindingSource1
            // 
            this.consVaultBindingSource1.DataMember = "Cons_Vault";
            this.consVaultBindingSource1.DataSource = this.mSCOA_VaultDataSet;
            // 
            // Lookup_HCM_Vault
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(862, 572);
            this.Controls.Add(this.splitContainer1);
            this.Name = "Lookup_HCM_Vault";
            this.Text = "Lookup_HCM_Vault";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lookupISUVaultBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mSCOA_VaultDataSet1)).EndInit();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.lookupISUVaultBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mSCOA_VaultDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.consVaultBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.consVaultBindingSource1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.BindingSource lookupISUVaultBindingSource1;
        private mSCOA_VaultDataSet1 mSCOA_VaultDataSet1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.ComboBox cboProject;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ComboBox cboCosting;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cboRegion;
        private System.Windows.Forms.ComboBox cboDirect;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox cboContra;
        private System.Windows.Forms.ComboBox cboFund;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox cboFunction;
        private System.Windows.Forms.BindingSource lookupISUVaultBindingSource;
        private mSCOA_VaultDataSet1TableAdapters.Lookup_ISU_VaultTableAdapter lookup_ISU_VaultTableAdapter;
        private mSCOA_VaultDataSet mSCOA_VaultDataSet;
        private System.Windows.Forms.BindingSource consVaultBindingSource;
        private mSCOA_VaultDataSetTableAdapters.Cons_VaultTableAdapter cons_VaultTableAdapter;
        private System.Windows.Forms.BindingSource consVaultBindingSource1;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn rATECATDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn dESCDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn divisionDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn nameDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn codeDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn mainCodeDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn mainsDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn subCodeDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn subDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn docTypeDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn divFiCaDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn fiCaMainsDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn subsFiCaDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn dbtCntGLDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn revenueGLDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn sAPCodeDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn sAPDescriptionDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn nonFinGroupCodeDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn nonFinGroupDescriptionDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn nonFinSubGroupCodeDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn nonFinSubGroupDescriptionDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn projectGuidDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn projectDescriptionDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn functionGuidDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn functionDescriptionDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn fundGuidDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn fundDescriptionDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn regionGuidDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn regionDescriptionDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn costingGuidDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn costingDescriptionDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn recommendedInvoiceGuidDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn recommendedInvoiceDescriptionDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn recommendedReceiptGuidDataGridViewTextBoxColumn;
        private DataGridViewAutoFilter.DataGridViewAutoFilterTextBoxColumn recommendedReceiptDescriptionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn idISUVaultDataGridViewTextBoxColumn;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel filterStatusLabel;
        private System.Windows.Forms.ToolStripStatusLabel showAllLabel;
    }
}