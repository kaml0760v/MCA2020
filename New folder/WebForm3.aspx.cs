using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace E_Learning_System
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable td = getData();
                Response.Write(DataTableToJSONWithJSONNet(td));
                Response.Write(AscMyJson(DataTableToJSONWithJSONNet(td)));
            }
        }
        public DataTable getData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("sId", typeof(Int32));
            dt.Columns.Add("sName", typeof(string));
            dt.Columns.Add("sOrganization", typeof(string));
            dt.Columns.Add("sQualification", typeof(string));
            dt.Columns.Add("sDescription", typeof(string));
            dt.Rows.Add(1, "Mr. Hemant Shah", "Vedant Infotech", "MCA" , "Secure 1st rank in innovative research awards 2020");
            dt.Rows.Add(2, "Amit Sarna", "Mstr Com Sci", "MCA", "Secure 1st rank in innovative research awards 2020");
            dt.Rows.Add(3, "Andrea Ely", "Bsc Bio-Chemistry", "MCA", "Secure 1st rank in innovative research awards 2020");
            dt.Rows.Add(4, "Leslie Mac", "MSC", "MCA", "Secure 1st rank in innovative research awards 2020");
            dt.Rows.Add(5, "Vaibhav Adhyapak", "MBA", "Secure 1st rank in innovative research awards 2020");
            return dt;
        }
        public string DataTableToJSONWithJSONNet(DataTable table)
        {
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(table);
            return JSONString;
        }

        public class RootObject
        {
            public string name { get; set; }
            public string Organization { get; set; }
            public string id { get; set; }
            public string Qualification { get; set; }
            public string Description { get; set; }

        }

        private string AscMyJson(string json)
        {
            var listOb = JsonConvert.DeserializeObject<List<RootObject>>(json);
            var descListOb = listOb.OrderBy(x => x.name);
            return JsonConvert.SerializeObject(descListOb);
        }
    }
}