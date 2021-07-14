using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Learning_System
{
    public partial class manageWebinar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String BannerPath = fileBanner.PostedFile.FileName;
            String Bannername = Path.GetFileName(BannerPath);
            String Bannerext = Path.GetExtension(Bannername);
            if (fileBanner.HasFile)
            {
                String str = fileBanner.FileName;
                String Image = String.Empty;
                String[] fileext = { ".jpg", ".jpeg", ".png", ".gif", ".bmp" };
                bool fileOK = false;
                for (int i = 0; i < fileext.Length; i++)
                {
                    if (Bannerext == fileext[i])
                    {
                        fileOK = true;
                        break;
                    }
                }
                if (fileOK)
                {
                    SqlConnection conn = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("insert into tbl_Webinar(Title,Type,Level,StartDate,EndDate,Description,bannerImage) values" +
                        "(@Title,@Type,@Level,@StartDate,@EndDate,@Description,@bannerImage)", conn);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Type", rdoSession.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Level", drpLevel.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(txtFromdate.Text));
                    cmd.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(txtTodate.Text));
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                    fileBanner.PostedFile.SaveAs(Server.MapPath("~/banner/" + Bannername));
                    Image = "~/banner/" + Bannername;
                    cmd.Parameters.AddWithValue("@bannerImage", Image);
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        Response.Write("<script> alert('Successfully Created') </script>");
                        Session["webtitle"] = txtTitle.Text;
                        Response.Redirect("SessionEntry.aspx");
                    }
                    else
                    {
                        Response.Write("<script> alert('Something went Wrong.') </script>");
                    }
                }
                else
                {
                    Response.Write("<script> alert('Please select Banner') </script>");
                }
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            rdoSession.ClearSelection();
            txtTitle.Text = "";
            drpLevel.ClearSelection();
            txtDescription.Text = "";
            txtFromdate.Text = "";
            txtTodate.Text = "";
            txtDescription.Text = "";
            fileBanner.Dispose();
            
        }
    }
}