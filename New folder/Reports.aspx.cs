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
    public partial class Reports : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
        String id = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.Cookies["UserID"]["ID"].ToString();
            if (!IsPostBack)
            {
               BindGridView();
            }
        }

        private void BindGridView()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            conn.Open();
            SqlCommand com = new SqlCommand("select Webinar_id,RegisterDate from WebinarHistory where Id=@Id", conn);
            com.Parameters.AddWithValue("@Id",id);
            da.SelectCommand = com;
        
            da.Fill(dt);
            conn.Close();
            if (dt.Rows.Count > 0)

            {

                GridView1.DataSource = dt;

                GridView1.DataBind();

            }
        }
    }
}