﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Learning_System.ServiceReference1;

namespace E_Learning_System
{
    public partial class Registration : System.Web.UI.Page
    {
        public Label[] label;
        public TextBox[] textbox;
        String[] labels = { "Degree name", "University", "percentage", "year" };
        String[] Id = { "txt0", "txt1", "txt2", "txt3" };
        String[] Ids = { "txtDegree", "txtUniversity", "txtPercentage", "txtYear" };
        // PlaceHolder[] placeholderLabel = { PlaceHolder1, PlaceHolder3, PlaceHolder4, PlaceHolder5 };
        String[] placeholderText = { "PlaceHolder2", "PlaceHolder6", "PlaceHolder7", "PlaceHolder8" };
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnQualification_Click(object sender, EventArgs e)
        {
            label = new Label[4];
            textbox = new TextBox[4];
            for (int i = 0; i < 4; i++)
            {
                label[i] = new Label();
                textbox[i] = new TextBox();
                label[i].Text = labels[i];
                label[i].Font.Bold = true;
                label[i].ID = Id[i];
                textbox[i].ID = Ids[i];
           
            }
            PlaceHolder1.Controls.Add(label[0]);
            PlaceHolder3.Controls.Add(label[1]);
            PlaceHolder4.Controls.Add(label[2]);
            PlaceHolder5.Controls.Add(label[3]);
            PlaceHolder2.Controls.Add(textbox[0]);
            PlaceHolder6.Controls.Add(textbox[1]);
            PlaceHolder7.Controls.Add(textbox[2]);
            PlaceHolder8.Controls.Add(textbox[3]);
            //PlaceHolder1.Controls.Add(label);

        }

        

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //if (fileProfile.HasFiles)
            //{
            //    try
            //    {
            //        String[] fileext = {".jpg",".jpeg","png",".gif",".bmp" };
            //        String fileExt = System.IO.Path.GetExtension(fileProfile.FileName.ToLower());
            //        Boolean fileOK = false;
            //        for (int i = 0; i < fileExt.Length; i++)
            //        {
            //            if (fileExt == fileext[i])
            //            {
            //                fileOK = true;
            //                break;
            //            }
            //        }
            //        if (fileOK)
            //        {
            //            if (fileProfile.FileBytes.Length <= 100)
            //            {
            //                fileProfile.SaveAs(Server.MapPath("~/profile/" + fileProfile.FileName.ToString()));
            //                Response.Write("<script>alert('file uploaded successfully')</script>");
            //            }
            //            else
            //            {
            //                Response.Write("<script>alert('File size must be maximum 100 KB')</script>");
            //            }
            //        }
            //        else
            //        {
            //            Response.Write("<script>alert('Please select image only')</script>");
            //        }
            //    }
            //    catch
            //    {
            //        Response.Write("<script>alert('Profile upload error!!!')</script>");
            //    }
            //}
            //else{
            //    Response.Write("<script>alert('Please choose file')</script>");
            //}


            //if (fileIdentity.HasFiles)
            //{
            //    String FileExt = System.IO.Path.GetExtension(fileIdentity.FileName.ToLower());
            //    Boolean fileOK = false;
            //    if (FileExt == ".pdf")
            //    {
            //         fileOK = true;
            //    }
                
            //    if (fileOK)
            //    {
            //        if (fileIdentity.FileBytes.Length <= (1024*2))
            //        {
            //            System.Diagnostics.Debug.WriteLine("done");
            //            fileIdentity.SaveAs(Server.MapPath("/document/" + fileIdentity.FileName));
            //        }
            //        else
            //        {
            //            lblProfile.Text = "File size must be maximum 2 MB";
            //        }
            //    }
            //    else
            //    {
            //        lblProfile.Text = "Please select pdf only";
            //    }
            //}
            DateTime date = DateTime.Now;
            string pdfPath = fileIdentity.PostedFile.FileName;
            string pdfName = Path.GetFileName(pdfPath);
            string pdfext = Path.GetExtension(pdfName);
            string imagePath = fileProfile.PostedFile.FileName;
            string Imagename = Path.GetFileName(imagePath);
            string imageext = Path.GetExtension(Imagename);
            if (fileProfile.HasFile && fileIdentity.HasFile)
            {
                string str = fileProfile.FileName;
                string Image = String.Empty;
                string PDF = string.Empty;
                String[] fileext = { ".jpg", ".jpeg", ".png", ".gif", ".bmp" };
                bool fileOK = false;
                for (int i = 0; i < fileext.Length; i++)
                {
                    if (imageext == fileext[i])
                    {
                        fileOK = true;
                        break;
                    }
                }
               
                if (fileOK && pdfext == ".pdf")
                {
                    try
                    {

                        Searching obj = new Searching();
                        
                    //SqlConnection conn = new SqlConnection("Data Source=HP;Initial Catalog=ELearning;Integrated Security=True;Pooling=False");
                    //conn.Open();
                    //SqlCommand com = new SqlCommand("insert into LearnerRegistration(Fname,Lname,Mname,Mobileno,Email,DOB,AdharcardNo,Address,City,Gender,Username,Password,Profile,identitydoc,subscription)" +
                    //    "values(@Fname,@Lname,@Mname,@Mobileno,@Email,@DOB,@AdharcardNo,@Address,@City,@Gender,@Username,@Password,@Profile,@identitydoc,@subscription)", conn);
                    //com.Parameters.AddWithValue("@Fname", txtfirstname.Text);
                    //com.Parameters.AddWithValue("@Lname", txtLastname.Text);
                    //com.Parameters.AddWithValue("@Mname", txtMiddlename.Text);
                    //com.Parameters.AddWithValue("@Mobileno", txtMobileno.Text);
                    //com.Parameters.AddWithValue("@Email", txtEmail.Text);
                    //com.Parameters.AddWithValue("@DOB", Convert.ToDateTime(txtDOB.Text));
                    //com.Parameters.AddWithValue("@AdharcardNo", txtAdhar.Text);
                    //com.Parameters.AddWithValue("@Address", txtAddress.Text);
                    //com.Parameters.AddWithValue("@City", drpDownCity.SelectedItem.Value);
                    //com.Parameters.AddWithValue("@Gender", rdoGender.SelectedItem.Value);
                    //com.Parameters.AddWithValue("@Username", txtUsername.Text);
                    //com.Parameters.AddWithValue("@Password", txtPassword.Text);
                        System.Diagnostics.Debug.WriteLine("image is "+ fileProfile.FileBytes.Length);
                        if (fileProfile.FileBytes.Length <= (100*1024))
                    {
                            fileProfile.PostedFile.SaveAs(Server.MapPath("~/profile/" + str));
                            Image = "~/profile/" + str.ToString();
                            //com.Parameters.AddWithValue("@Profile", Image);
                    }
                    else
                    {
                            Response.Write("<script> alert('Image must be maximum 100 KB')</script>");
                    }
                        System.Diagnostics.Debug.WriteLine("pdf is " + fileIdentity.FileBytes.Length);
                        if (fileIdentity.FileBytes.Length <= (1024*2048))
                    {
                        fileIdentity.PostedFile.SaveAs(Server.MapPath("~/document/" + fileIdentity.FileName));
                        PDF = "~/document/" + fileIdentity.FileName;
                        //Stream fs = fileIdentity.PostedFile.InputStream;
                        //BinaryReader br = new BinaryReader(fs); //reads the binary files  
                        //Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        //com.Parameters.AddWithValue("@identitydoc", PDF);
                    }
                    else
                    {
                            Response.Write("<script>alert('PDF must be maximum 2 MB')</script>");
                    }
                        obj.Reg(txtUsername.Text, txtfirstname.Text, txtMiddlename.Text, txtLastname.Text,
                                txtMobileno.Text, txtEmail.Text, txtAddress.Text, drpDownCity.SelectedItem.Value, rdoGender.SelectedItem.Value,
                                txtPassword.Text, txtDOB.Text, txtAdhar.Text, Image, PDF, chkSub.Checked == true ? date.AddYears(1).ToString() : null);

                        //if (chkSub.Checked == true)
                        //{
                        //    com.Parameters.AddWithValue("@subscription", date.AddYears(1).ToString());


                        //}
                        //else
                        //{
                        //    com.Parameters.AddWithValue("@subscription", null);
                        //}
                        //if (com.ExecuteNonQuery() == 1)
                        //{
                        //    Response.Write("<script>alert('Success')</script>");
                        //}
                        //else
                        //{
                        //    Response.Write("<script>alert('Fail')</script>");
                        //}
                        }
                        catch(Exception ex)
                        {
                            Response.Write(ex.Message.ToString());
                        }
                    

                }
                else
                {
                    Response.Write("<script>alert('Please select valide file')</script>");
                }
               

            }
            else
            {
                Response.Write("<script>alert('Please select file')</script>");
            }
            
            //HttpCookie coockie = new HttpCookie("User");
            //coockie["Fname"] = txtfirstname.Text;
            //coockie["Lname"] = txtLastname.Text;
            //coockie["Mname"] = txtMiddlename.Text;
            //coockie["Mobile"] = txtMobileno.Text;
            //coockie["Email"] = txtEmail.Text;
            //coockie["DOb"] = txtDOB.Text;
            //coockie["Adhar"]= txtAdhar.Text;
            //coockie["Address"] = txtAddress.Text;
            //coockie["City"]= drpDownCity.SelectedItem.Value;
            //coockie["Gender"] = rdoGender.SelectedItem.Value;
            //coockie["Username"] = txtUsername.Text;
            //coockie["Password"] = txtPassword.Text;
            //if(chkSub.Checked == true)
            //{
            //    coockie["subscription"] = "Subscription is active till " 
            //        + date.AddYears(1).ToString();
            //}
            //else
            //{
            //    coockie["subscription"] = "not subscribed.";
            //}
            //coockie.Expires = DateTime.Now.AddHours(1);
            //Response.Cookies.Add(coockie);
            //Response.Redirect("Dashboard.aspx");

        }
    }
}