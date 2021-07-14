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
    public partial class Login : System.Web.UI.Page
    {
        String OTP = "1234";
        protected void Page_Load(object sender, EventArgs e)
        {
            //OTP = Request.Form[hiddenElement.ClientID];
            //System.Diagnostics.Debug.WriteLine("pdf is " + OTP);

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from LearnerRegistration where Username = @username and Password = @password", con);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            String ID = cmd.ExecuteScalar().ToString();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            cmd.ExecuteNonQuery();
            con.Close();
           
            System.Diagnostics.Debug.WriteLine("pdf is " + ID);
            if (dt.Rows.Count > 0)
            {
                Console.WriteLine("HELOO"+OTP);
                System.Diagnostics.Debug.WriteLine("pdf is " + OTP);
                if (OTP == txtOTP.Text)
                {
                    HttpCookie cookie = new HttpCookie("UserID");
                    cookie["ID"] = ID;
                    cookie.Expires = DateTime.Now.AddDays(10);
                    Response.Cookies.Add(cookie);
                    Response.Redirect("Webinar_Workshop.aspx");
                }
                else
                {
                    Response.Write("<script> alert('Invalid OTP') </script>");
                }
            }
            else
            {
                Response.Write("<script> alert('Invalid username or password!') </script>");
            }

        }

    }
}