using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Learning_System.ServiceReference1;

namespace E_Learning_System
{
    public partial class Co_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
            //con.Open();
            //SqlCommand com = new SqlCommand("select * from tbl_Coordinator where Username = @Username and password = @Password", con);
            //com.Parameters.AddWithValue("@Username", txtUsername.Text);
            //com.Parameters.AddWithValue("@Password", txtPassword.Text);
            //SqlDataAdapter sda = new SqlDataAdapter(com);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            //int i = com.ExecuteNonQuery();
            //con.Close();
            //String ID = dt.Rows[0].ToString();
            //if (dt.Rows.Count > 0)
            //{
            //    Session["CoUserID"] = ID;
            //    Response.Redirect("Co-DashBoard.aspx");
            //}
            //else
            //{
            //    Response.Write("<script> alert('Invalid Username or Password!!')</script>");
            //}
            Searching obj = new Searching();
            DataSet ds = obj.Login(txtUsername.Text, txtPassword.Text);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["CoUserID"] = ID;
                Response.Redirect("Co-DashBoard.aspx");
            }
            else
            {
                Response.Write("<script> alert('Invalid Username or Password!!')</script>"); 
            }
        }
    }
}