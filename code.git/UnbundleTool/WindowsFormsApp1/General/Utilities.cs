using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1.General
{
    public class Utilities
    {

        internal static void LoadSCOACombobox(ComboBox cbo,DataGridTableStyle tbl)
        {
            cbo.DataSource = tbl;
            cbo.ValueMember = "GUID";
            cbo.DisplayMember = "Account_Name";
            cbo.Refresh();
        }

        internal static void LoadSCOACombobox(ComboBox cbo, mSCOA_VaultDataSet.Cons_VaultDataTable tbl)
        {
            cbo.DataSource = tbl;
            cbo.ValueMember = "GUID";
            cbo.DisplayMember = "Account_Name";
            cbo.Refresh();
        }
    }
}
