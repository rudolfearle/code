using ReportTool.ReportTypes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ReportTool
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
            if (splitContainer1.Panel2.Controls.Count > 0)
            {
                splitContainer1.Panel2.Controls.RemoveAt(0);
            }
            switch (But)
            {
                case 1: //a schedule
                    MessageBox.Show("Coming Soon!");
                    break;
                case 2: //c schedule
                    GenerateCSchedule objC = new GenerateCSchedule();
                    objC.TopLevel = false;
                    splitContainer1.Panel2.Controls.Add(objC);
                    objC.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
                    objC.Dock = DockStyle.Fill;
                    objC.Show();
                    break;
                case 3: //strings
                    GenerateStrings obj3 = new GenerateStrings();
                    obj3.TopLevel = false;
                    splitContainer1.Panel2.Controls.Add(obj3);
                    obj3.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
                    obj3.Dock = DockStyle.Fill;
                    obj3.Show();
                    break;
                case 4: //demarcation reporting
                    GenarateDemarcation OBJ4 = new GenarateDemarcation();
                    OBJ4.TopLevel = false;
                    splitContainer1.Panel2.Controls.Add(OBJ4);
                    OBJ4.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
                    OBJ4.Dock = DockStyle.Fill;
                    OBJ4.Show();
                    break;
            }
        }
    }
}
