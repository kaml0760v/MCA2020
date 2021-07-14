using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Learning_System
{
    public partial class TopFive : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void BindGridView()
        {
           
            con.Open();
            //SqlCommand cmd = new SqlCommand("select TOP(5) count(Learner_id) as TOTAL,Webinar_id from WebinarHistory GROUP BY Webinar_id", con);
            SqlCommand cmd = new SqlCommand("select TOP(5) web.City,his.Total from LearnerRegistration web INNER JOIN(select Learner_id,count(Learner_id) as Total from WebinarHistory group by Learner_id) his on web.Id = his.Learner_id order by Total DESC", con);

            SqlDataReader rde = cmd.ExecuteReader();
            GridView1.DataSource = rde;
            GridView1.DataBind();
            con.Close();    
        }
    }
}