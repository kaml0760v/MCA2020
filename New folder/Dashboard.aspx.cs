using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Learning_System
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["User"]!= null)
            {
                Label1.Text = "Full name : " + Request.Cookies["User"]["Fname"].ToString() + Request.Cookies["User"]["Mname"].ToString() + 
                     Request.Cookies["User"]["Lname"].ToString();
                Label4.Text = "Mobiile number : " + Request.Cookies["User"]["Mobile"].ToString();
                Label5.Text = "Email Id : " + Request.Cookies["User"]["Email"].ToString();
                Label6.Text = "Date of birth : " + Request.Cookies["User"]["DOb"].ToString();
                Label7.Text = "Adharcard number : " + Request.Cookies["User"]["Adhar"].ToString();
                Label8.Text = "City : " + Request.Cookies["User"]["City"].ToString();
                Label9.Text = "Address : " + Request.Cookies["User"]["Address"].ToString();
                Label10.Text = "Gender : " + Request.Cookies["User"]["Gender"].ToString();
                Label11.Text = "Username : " + Request.Cookies["User"]["Username"].ToString();
                Label12.Text = "Password : " + Request.Cookies["User"]["Password"].ToString();
                Label13.Text = "Subscription : " + Request.Cookies["User"]["subscription"].ToString();
            }
        }
    }
}