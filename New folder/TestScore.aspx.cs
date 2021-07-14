using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace E_Learning_System
{
    public partial class TestScore : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
        String value = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            SqlDataAdapter adpt = new SqlDataAdapter("select * from tbl_Webinar", conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "Title";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();
            conn.Close();

            if (!IsPostBack)
            {
                this.BindDummyItem();
            }
        }
        private void BindDummyItem()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("Id");
            dummy.Columns.Add("Fname");
            dummy.Columns.Add("Profile");
            int count = dlImages.RepeatColumns == 0 ? 1 : dlImages.RepeatColumns;
            for (int i = 0; i < count; i++)
            {
                dummy.Rows.Add();
            }
            dlImages.DataSource = dummy;
            dlImages.DataBind();
        }

        [WebMethod]
        public static string GetImages(int pageIndex)
        {
            return GetImagesData(pageIndex).GetXml();
        }

        public static DataSet GetImagesData(int pageIndex)
        {
            int pageSize = 9;
            string query = "[GetImagesPageWise]";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            cmd.Parameters.Add("@PageCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            return GetData1(cmd);
        }

        private static DataSet GetData1(SqlCommand cmd)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["ELearningConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds, "LearnerRegistration");
                        DataTable dt = new DataTable("PageCount");
                        dt.Columns.Add("PageCount");
                        dt.Rows.Add();
                        dt.Rows[0][0] = cmd.Parameters["@PageCount"].Value;
                        ds.Tables.Add(dt);
                        return ds;
                    }
                }
            }
        }
        public class UserDetails
        {
            public string Profile { get; set; }
            public string Fname { get; set; }
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
           
        }

        protected static IEnumerable<UserDetails> GetUser()
        {
            var details = new List<UserDetails>();

            using (var connnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ELearningConnectionString"].ConnectionString.ToString()))
            using (var cmd = new SqlCommand("SELECT Profile,Fname from LearnerRegistration,", connnection))
            {
                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    yield return new UserDetails
                    {
                        Profile = reader.GetString(0),
                        Fname = reader.GetString(0),
                    };
                }
            }
        }

        [WebMethod]
        public static string BindDatatable()
        {
            var result = GetUser(); //this is a IEnumerable<UserDetails>, 

            var jsonSerialiser = new JavaScriptSerializer();
            var json = jsonSerialiser.Serialize(result); //this does everyting

            return json;
        }
        [WebMethod]
        public static string GetLearner()
        {
            string query = "SELECT Profile,Fname from LearnerRegistration";
            SqlCommand cmd = new SqlCommand(query);
            return GetData(cmd).GetXml();
        }

        private static DataSet GetData(SqlCommand cmd)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["ELearningConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);
                        return ds;

                    }
                }
            }
        }
    }
}