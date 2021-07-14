using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Learning_System
{
    public partial class datewisewebinar : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkPickDate_Click(object sender, EventArgs e)
        {
            datepicker1.Visible = true;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            datepicker.Visible = true;
        }

        protected void datepicker1_SelectionChanged(object sender, EventArgs e)
        {
            txtToDate.Text = datepicker1.SelectedDate.ToLongDateString();
            datepicker1.Visible = false;
        }

        protected void datepicker_SelectionChanged(object sender, EventArgs e)
        {
            txtFromDate.Text = datepicker.SelectedDate.ToLongDateString();
            datepicker.Visible = false;
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Title,Type,Level,StartDate,EndDate,Description from tbl_Webinar where Startdate between @Fromdate and @Todate", con);
            cmd.Parameters.AddWithValue("@Fromdate", txtFromDate.Text);
            cmd.Parameters.AddWithValue("@Todate", txtFromDate.Text);
            // 3. add parameter to command, which
            SqlDataReader rde = cmd.ExecuteReader();
            GridView1.DataSource = rde;
            GridView1.DataBind();
            con.Close();
        }
    }
}