namespace ReportTool.ReportTypes
{
    partial class GenarateDemarcation
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
            this.grpFields = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txtMuniciplaIdentifier = new System.Windows.Forms.TextBox();
            this.cboMonth = new System.Windows.Forms.ComboBox();
            this.btnGenerate = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.radioButton1 = new System.Windows.Forms.RadioButton();
            this.rdoAC = new System.Windows.Forms.RadioButton();
            this.rdoAD = new System.Windows.Forms.RadioButton();
            this.rdoCString = new System.Windows.Forms.RadioButton();
            this.grpFields.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpFields
            // 
            this.grpFields.Controls.Add(this.label2);
            this.grpFields.Controls.Add(this.label1);
            this.grpFields.Controls.Add(this.txtMuniciplaIdentifier);
            this.grpFields.Controls.Add(this.cboMonth);
            this.grpFields.Controls.Add(this.btnGenerate);
            this.grpFields.Location = new System.Drawing.Point(218, 12);
            this.grpFields.Name = "grpFields";
            this.grpFields.Size = new System.Drawing.Size(574, 231);
            this.grpFields.TabIndex = 5;
            this.grpFields.TabStop = false;
            this.grpFields.Text = "Select Values";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(67, 59);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(85, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Municipal Month";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(61, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(91, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Municipalidentifier";
            // 
            // txtMuniciplaIdentifier
            // 
            this.txtMuniciplaIdentifier.Location = new System.Drawing.Point(158, 30);
            this.txtMuniciplaIdentifier.Name = "txtMuniciplaIdentifier";
            this.txtMuniciplaIdentifier.Size = new System.Drawing.Size(199, 20);
            this.txtMuniciplaIdentifier.TabIndex = 2;
            // 
            // cboMonth
            // 
            this.cboMonth.FormattingEnabled = true;
            this.cboMonth.Location = new System.Drawing.Point(158, 56);
            this.cboMonth.Name = "cboMonth";
            this.cboMonth.Size = new System.Drawing.Size(199, 21);
            this.cboMonth.TabIndex = 1;
            // 
            // btnGenerate
            // 
            this.btnGenerate.Location = new System.Drawing.Point(158, 192);
            this.btnGenerate.Name = "btnGenerate";
            this.btnGenerate.Size = new System.Drawing.Size(195, 33);
            this.btnGenerate.TabIndex = 0;
            this.btnGenerate.Text = "Generate";
            this.btnGenerate.UseVisualStyleBackColor = true;
            this.btnGenerate.Click += new System.EventHandler(this.btnGenerate_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.radioButton1);
            this.groupBox1.Controls.Add(this.rdoAC);
            this.groupBox1.Controls.Add(this.rdoAD);
            this.groupBox1.Controls.Add(this.rdoCString);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(200, 231);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Select Report";
            // 
            // radioButton1
            // 
            this.radioButton1.AutoSize = true;
            this.radioButton1.Location = new System.Drawing.Point(16, 102);
            this.radioButton1.Name = "radioButton1";
            this.radioButton1.Size = new System.Drawing.Size(88, 17);
            this.radioButton1.TabIndex = 3;
            this.radioButton1.Tag = "4";
            this.radioButton1.Text = "Age Creditors";
            this.radioButton1.UseVisualStyleBackColor = true;
            this.radioButton1.CheckedChanged += new System.EventHandler(this.radioButton1_CheckedChanged);
            // 
            // rdoAC
            // 
            this.rdoAC.AutoSize = true;
            this.rdoAC.Location = new System.Drawing.Point(16, 79);
            this.rdoAC.Name = "rdoAC";
            this.rdoAC.Size = new System.Drawing.Size(84, 17);
            this.rdoAC.TabIndex = 2;
            this.rdoAC.Tag = "3";
            this.rdoAC.Text = "Age Debtors";
            this.rdoAC.UseVisualStyleBackColor = true;
            this.rdoAC.CheckedChanged += new System.EventHandler(this.rdoAC_CheckedChanged);
            // 
            // rdoAD
            // 
            this.rdoAD.AutoSize = true;
            this.rdoAD.Location = new System.Drawing.Point(16, 56);
            this.rdoAD.Name = "rdoAD";
            this.rdoAD.Size = new System.Drawing.Size(46, 17);
            this.rdoAD.TabIndex = 1;
            this.rdoAD.Tag = "2";
            this.rdoAD.Text = "BSA";
            this.rdoAD.UseVisualStyleBackColor = true;
            this.rdoAD.CheckedChanged += new System.EventHandler(this.rdoAD_CheckedChanged);
            // 
            // rdoCString
            // 
            this.rdoCString.AutoSize = true;
            this.rdoCString.Checked = true;
            this.rdoCString.Location = new System.Drawing.Point(16, 30);
            this.rdoCString.Name = "rdoCString";
            this.rdoCString.Size = new System.Drawing.Size(47, 17);
            this.rdoCString.TabIndex = 0;
            this.rdoCString.TabStop = true;
            this.rdoCString.Tag = "1";
            this.rdoCString.Text = "OSA";
            this.rdoCString.UseVisualStyleBackColor = true;
            this.rdoCString.CheckedChanged += new System.EventHandler(this.rdoCString_CheckedChanged);
            // 
            // GenarateDemarcation
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(799, 252);
            this.Controls.Add(this.grpFields);
            this.Controls.Add(this.groupBox1);
            this.Name = "GenarateDemarcation";
            this.Text = "GenarateDemarcation";
            this.grpFields.ResumeLayout(false);
            this.grpFields.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpFields;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtMuniciplaIdentifier;
        private System.Windows.Forms.ComboBox cboMonth;
        private System.Windows.Forms.Button btnGenerate;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton radioButton1;
        private System.Windows.Forms.RadioButton rdoAC;
        private System.Windows.Forms.RadioButton rdoAD;
        private System.Windows.Forms.RadioButton rdoCString;
    }
}