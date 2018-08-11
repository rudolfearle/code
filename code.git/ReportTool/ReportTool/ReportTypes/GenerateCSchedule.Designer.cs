namespace ReportTool.ReportTypes
{
    partial class GenerateCSchedule
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
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txtMuniciplaIdentifier = new System.Windows.Forms.TextBox();
            this.cboMonth = new System.Windows.Forms.ComboBox();
            this.btnGenerate = new System.Windows.Forms.Button();
            this.lblSavedFile = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(65, 52);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(85, 13);
            this.label2.TabIndex = 14;
            this.label2.Text = "Municipal Month";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(59, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(91, 13);
            this.label1.TabIndex = 13;
            this.label1.Text = "Municipalidentifier";
            // 
            // txtMuniciplaIdentifier
            // 
            this.txtMuniciplaIdentifier.Location = new System.Drawing.Point(156, 23);
            this.txtMuniciplaIdentifier.Name = "txtMuniciplaIdentifier";
            this.txtMuniciplaIdentifier.Size = new System.Drawing.Size(199, 20);
            this.txtMuniciplaIdentifier.TabIndex = 12;
            // 
            // cboMonth
            // 
            this.cboMonth.FormattingEnabled = true;
            this.cboMonth.Location = new System.Drawing.Point(156, 49);
            this.cboMonth.Name = "cboMonth";
            this.cboMonth.Size = new System.Drawing.Size(199, 21);
            this.cboMonth.TabIndex = 11;
            // 
            // btnGenerate
            // 
            this.btnGenerate.Location = new System.Drawing.Point(111, 111);
            this.btnGenerate.Name = "btnGenerate";
            this.btnGenerate.Size = new System.Drawing.Size(195, 33);
            this.btnGenerate.TabIndex = 10;
            this.btnGenerate.Text = "Generate";
            this.btnGenerate.UseVisualStyleBackColor = true;
            this.btnGenerate.Click += new System.EventHandler(this.btnGenerate_Click_1);
            // 
            // lblSavedFile
            // 
            this.lblSavedFile.AutoSize = true;
            this.lblSavedFile.Location = new System.Drawing.Point(62, 174);
            this.lblSavedFile.Name = "lblSavedFile";
            this.lblSavedFile.Size = new System.Drawing.Size(35, 13);
            this.lblSavedFile.TabIndex = 15;
            this.lblSavedFile.Text = "label3";
            // 
            // GenerateCSchedule
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(432, 199);
            this.Controls.Add(this.lblSavedFile);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtMuniciplaIdentifier);
            this.Controls.Add(this.cboMonth);
            this.Controls.Add(this.btnGenerate);
            this.Name = "GenerateCSchedule";
            this.Text = "GenerateCSchedule";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtMuniciplaIdentifier;
        private System.Windows.Forms.ComboBox cboMonth;
        private System.Windows.Forms.Button btnGenerate;
        private System.Windows.Forms.Label lblSavedFile;
    }
}