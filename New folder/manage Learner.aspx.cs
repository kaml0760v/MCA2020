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
    public partial class manage_Learner : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=    HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
            //con.Open();
            //SqlCommand com = new SqlCommand("select Fname,MobileNo,Email,Address,City,subscription from LearnerRegistration ORDER BY subscription DESC", con);
            //GridView1.DataSource = com.ExecuteReader();
            //GridView1.DataBind();
            //con.Close();
            if (!IsPostBack)
            {
                BindGridView();
            }

        }

        protected void BindGridView()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select ID,Fname,MobileNo,Email,Address,City,subscription,status from LearnerRegistration", conn);
            conn.Open();
            da.Fill(dt);
            conn.Close();
            if (dt.Rows.Count > 0)

            {

                GridView1.DataSource = dt;

                GridView1.DataBind();

            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)

        {

            if (e.Row.RowType == DataControlRowType.DataRow)

            {

                ImageButton img = (ImageButton)e.Row.FindControl("img_user");
                if (e.Row.Cells[6].Text == "Active")
                { 
                    img.ImageUrl = "~/Images/active.png";
                }
                else
                {
                    img.ImageUrl = "~/Images/inactive.png";
                }
            }

        }
        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string id = GridView1.DataKeys[e.NewSelectedIndex].Value.ToString();

            string status = GridView1.Rows[e.NewSelectedIndex].Cells[6].Text;
            if (status == "Active")
            {
                status = "Inactive";
            }
            else if (status == "Inactive")
            {
                status = "Active";
            }
            //else if (status == "Pending")
            //{
            //    status = "Active";
            //}
            SqlCommand cmd = new SqlCommand("update LearnerRegistration set status ='" + status + "' where ID=" + id, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            BindGridView();
        }
    }
}