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
    public partial class MainApp : Form
    {
        public MainApp()
        {
            InitializeComponent();
        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            int But = Convert.ToInt16(e.ClickedItem.Tag.ToString());
            if (splitContainer1.Panel2.Controls.Count > 0 )
            {
                splitContainer1.Panel2.Controls.RemoveAt(0);
            }
            switch (But)
            {
                case 1: //ISU
                    Lookup_ISU_Vault obj = new Lookup_ISU_Vault();
                    obj.TopLevel = false;
                    splitContainer1.Panel2.Controls.Add(obj);
                    obj.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
                    obj.Dock = DockStyle.Fill;
                    obj.Show();
                    break;
                case 2: // Vault
                    Lookup_Vault obj1 = new Lookup_Vault();
                    obj1.TopLevel = false;
                    splitContainer1.Panel2.Controls.Add(obj1);
                    obj1.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
                    obj1.Dock = DockStyle.Fill;
                    obj1.Show();
                    break;
                case 3: //HCM
                    Lookup_HCM_Vault obj2 = new Lookup_HCM_Vault();
                    obj2.TopLevel = false;
                    splitContainer1.Panel2.Controls.Add(obj2);
                    obj2.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
                    obj2.Dock = DockStyle.Fill;
                    obj2.Show();
                    break;
                case 4: //Assets
                    Lookup_Assets_Vault obj3 = new Lookup_Assets_Vault();
                    obj3.TopLevel = false;
                    splitContainer1.Panel2.Controls.Add(obj3);
                    obj3.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
                    obj3.Dock = DockStyle.Fill;
                    obj3.Show();
                    break;
                case 5: // Lookup_Vault_Budget_2Segment_Combo
                    Budget_2Segment  obj5 = new Budget_2Segment();
                    obj5.TopLevel = false;
                    splitContainer1.Panel2.Controls.Add(obj5);
                    obj5.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
                    obj5.Dock = DockStyle.Fill;
                    obj5.Show();
                    break;
            }
        }
    }
}
