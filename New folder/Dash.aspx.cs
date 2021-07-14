using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Learning_System
{
    public partial class Dash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Username"] != null)
            {
                DateTime now = DateTime.Now;
                lblWelcome.Text += Session["Username"].ToString();
                Label1.Text = "Last login: "+now.ToString();
            }
        }
        void Session_Start(object sender, EventArgs e)
        {
            Session.Timeout = 600;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx",false);
        }
    }
}