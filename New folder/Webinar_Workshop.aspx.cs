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
    public partial class Webinar_Workshop : System.Web.UI.Page
    {
        //SqlConnection conn = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
        String id = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

            id = Request.Cookies["UserID"]["ID"].ToString();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button register = e.Item.FindControl("Button1") as Button;
                Label lblDate = e.Item.FindControl("StartDateLabel") as Label;
                //System.Diagnostics.Debug.WriteLine("image is " + date);
                DateTime dtDateTime = Convert.ToDateTime(lblDate.Text);
                DateTime dtCurrentDatetime = Convert.ToDateTime(System.DateTime.Now);
                String result = (dtDateTime - dtCurrentDatetime).TotalDays.ToString();
                if (double.Parse(result) <= 5.0)
                {
                    register.Enabled = false;
                }


            }
            //Label lb = (Label)e.Item.FindControl("");
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Register")
            {
                SqlConnection con = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
                con.Open();
                SqlCommand cmd = new SqlCommand("select count(*) from WebinarHistory where year(RegisterDate)='2021' group by MONTH(RegisterDate)", con);
                int count = (int)cmd.ExecuteScalar();
                if (count >= 2)
                {
                    Response.Write("<script> alert('Already registered in two events in this month')</script>");
                }
                else
                {
                    //int webid = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex].ToString());
                    SqlCommand com = new SqlCommand("insert into WebinarHistory(Webinar_id,Learner_id,RegisterDate) values(@Webinar_id,@Learner_id,@RegisterDate)", con);
                    String lbltext = String.Empty;
                    for (int i = 0; i < count; i++)
                    {
                        Label lbl = DataList1.Items[i].FindControl("LabelID") as Label;
                        lbltext = lbl.Text;
                    }
                    com.Parameters.AddWithValue("@Webinar_id", lbltext);
                    com.Parameters.AddWithValue("Learner_id", id);
                    com.Parameters.AddWithValue("RegisterDate", DateTime.Now);
                    com.ExecuteNonQuery();
                    
                }
                con.Close();

            }
        }
    }
}