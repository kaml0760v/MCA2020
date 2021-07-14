using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Learning_System
{
    public partial class SessionEntry : System.Web.UI.Page
    {
          
        static string ID = string.Empty;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
            String web = Session["webtitle"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_Webinar where Title='" + web + "'",con);
            ID = cmd.ExecuteScalar().ToString();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public class session
        {
            public string title { get; set; }
            public string date { get; set; }
            public string time { get; set; }
            public string name { get; set; }
        }
        [WebMethod]
        public static string SaveData(string sessionData)
        {

            var serializeData = JsonConvert.DeserializeObject<List<session>>(sessionData);
            SqlConnection con = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
            foreach (var data in serializeData)
            {
                using (var cmd = new SqlCommand("INSERT INTO SessionDetails VALUES(@web_Id, @Session_title,@Session_date,@Session_time,@Speaker)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Web_Id", ID);
                    cmd.Parameters.AddWithValue("@Session_title", data.title);
                    cmd.Parameters.AddWithValue("@Session_date", data.date);
                    cmd.Parameters.AddWithValue("@Session_time", data.time);
                    cmd.Parameters.AddWithValue("@Speaker", data.name);
                    cmd.Connection = con;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            return null;
        }
    }
}