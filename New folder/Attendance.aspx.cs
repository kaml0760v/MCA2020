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
    public partial class Attendance : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
        String value = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            SqlDataAdapter adpt = new SqlDataAdapter("select * from SessionDetails", conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "Session_title";
            DropDownList1.DataValueField = "web_Id";
            DropDownList1.DataBind();
            conn.Close();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

       

        protected void BindGridView(string value)
        {
            conn.Open();
            DataTable dt = new DataTable();

            SqlCommand cmd = new SqlCommand("select LearnerRegistration.ID,Fname,MobileNo from LearnerRegistration inner join WebinarHistory on LearnerRegistration.Id = WebinarHistory.Learner_id ", conn);//and WebinarHistory.Webinar_id= @id
            //cmd.Parameters.AddWithValue("@id",value);
            SqlDataAdapter da = new SqlDataAdapter(); 
            da.SelectCommand = cmd;
            da.Fill(dt);
            //da.Fill(dt);
            conn.Close();
            if (dt.Rows.Count > 0)

            {
                GridView1.DataSource = dt;

                GridView1.DataBind();

            }
            else
            {
                Response.Write("<script> alert('No attende!!!') </script>");
            }
        }

        protected void btnGet_Click(object sender, EventArgs e)
        {
            BindGridView(DropDownList1.SelectedValue);
            //conn.Open();
            //SqlCommand cmd = new SqlCommand("select * from WebinarHistory where Webinsar_id = '" + DropDownList1.SelectedValue + "'", conn);
            //SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //Adpt.Fill(dt);
            //GridView1.DataSource = dt;
            //GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                if (checkbox.Checked)
                {
                    var lblID = gvrow.FindControl("id") as Label;
                    var lblName = gvrow.FindControl("Fname") as Label;
                    var lblCity = gvrow.FindControl("MobileNo") as Label;
                    SqlCommand cmd = new SqlCommand("insert into tbl_attendence (Session_id,Learner_id,attendence) values (@Session_id,@Learner_id,@attendence)", conn);
                    cmd.Parameters.AddWithValue("Session_id", lblID.Text);
                    cmd.Parameters.AddWithValue("Learner_id", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("attendence", "Present");
                    conn.Open();
                    int i = cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }
    }
}