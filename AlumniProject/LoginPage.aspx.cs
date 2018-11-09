using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlumniProject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session.Abandon();
            if(Request.QueryString["userid"] != null)
            {
                UserNameTextBox.Text = Request.QueryString["userid"];
            }
            LoginErrorLabel.Visible = false;
            Label4.Visible = false;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["AlumniPortalConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlConnection con1 = new SqlConnection(CS);
            SqlConnection con2 = new SqlConnection(CS);
            HttpCookie cookie = new HttpCookie("userInfo");
            
            SqlCommand cmd1 = new SqlCommand("select * from Survey where RegNo = @regno1", con1);
            cmd1.Parameters.AddWithValue("@regno1", UserNameTextBox.Text);
            con1.Open();
            SqlDataReader rdr = cmd1.ExecuteReader();
            if (rdr.HasRows)
            {
                Label4.Visible = true;
                rdr.Close();
               
            }
            else
            {
                con1.Close();
                SqlCommand cmd = new SqlCommand("select Password from Student where RegNo = @regno", con);
                cmd.Parameters.AddWithValue("@regno", UserNameTextBox.Text);
                try
                {
                    con.Open();
                    string password = (string)cmd.ExecuteScalar();
                    if (PasswordTextBox.Text.Equals(password))
                    {

                        Session["UserName"] = UserNameTextBox.Text;
                        cookie["userType"] = "student";
                        Response.Cookies.Add(cookie);
                        Response.Redirect("~/SurveyPage.aspx");
                        

                    }
                    con.Close();
                    
                    cmd = new SqlCommand("select Password from Admin where Id=@id", con2);
                    cmd.Parameters.AddWithValue("@id", UserNameTextBox.Text);
                    con2.Open();
                    password = cmd.ExecuteScalar().ToString();
                    if (PasswordTextBox.Text.Equals(password))
                    {
                        Session["UserName"] = UserNameTextBox.Text;
                        cookie["userType"] = "admin";
                        Response.Cookies.Add(cookie);
                        Response.Redirect("~/HomePage.aspx");
                    }
                    else
                    {
                        LoginErrorLabel.Visible = true;
                    }
                }
                catch (Exception ex) { }
                finally
                {
                    con2.Close();
                }
            }
        }

       
    }
}