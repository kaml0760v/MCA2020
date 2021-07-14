using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace E_Learning_System
{
    /// <summary>
    /// Summary description for Searching
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Searching : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public void Reg(String username, String fname, String mname, String lname, String mobile, String email, String address, String city, String gender, String password, String DOB, String AdharcardNo, String Profile, String identitydoc, String subscription)
        {
            using (SqlConnection con = new SqlConnection("Data Source = HP; Initial Catalog = ELearning; Integrated Security = True; Pooling = False"))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("insert into LearnerRegistration(Username,Fname,Mname,Lname,Mobileno,Email,Address,City,Gender,Password,DOB,AdharcardNo,Profile,identitydoc,subscription,status) values(@Username,@Fname,@Mname,@Lname,@Mobileno,@Email,@Address,@City,@Gender,@Password,@DOB,@AdharcardNo,@Profile,@identitydoc,@subscription)"))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Fname", fname);
                    cmd.Parameters.AddWithValue("@Mname", mname);
                    cmd.Parameters.AddWithValue("@Lname", lname);
                    cmd.Parameters.AddWithValue("@Mobileno", mobile);
                    cmd.Parameters.AddWithValue("@AdharcardNo", AdharcardNo);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@City", city);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@DOB", Convert.ToDateTime(DOB));
                    cmd.Parameters.AddWithValue("@Profile", Profile);
                    cmd.Parameters.AddWithValue("@identitydoc", identitydoc);
                    cmd.Parameters.AddWithValue("@subscription", subscription);
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        [WebMethod]
        public DataSet Login(string uname, string pwd)
        {
            SqlConnection con = new SqlConnection("Data Source = HP; Initial Catalog = ELearning; Integrated Security = True; Pooling = False");


            SqlDataAdapter da = new SqlDataAdapter("select * from tbl_Coordinator where Username ='" + uname + "' and Password='" + pwd + "' ", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public List<string> Search(string title)
        {
            List<string> Emp = new List<string>();
            string query = string.Format("SELECT title FROM tbl_Webinar WHERE Title LIKE '%{0}%'", title);
            using (SqlConnection con = new SqlConnection(@"Data Source = HP; Initial Catalog = ELearning; Integrated Security = True; Pooling = False"))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Emp.Add(reader.GetString(0));
                    }
                }
            }
            return Emp;
        }
    }
}
