using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace AlumniProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string CS = ConfigurationManager.ConnectionStrings["AlumniPortalConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("insert into Student (RegNo, Name, Branch_Id, Email, ContactNo, Company_Id, OfferType, Password, GraduationYear) values (@regno, @name, @branchid, @email, @contactno, 101, '', @password, @graduationyear)", con);
                cmd.Parameters.AddWithValue("@regno", RegistrationNoTextBox.Text);
                cmd.Parameters.AddWithValue("@name", NameTextBox.Text);
                cmd.Parameters.AddWithValue("@branchid", BranchDropDownList.SelectedIndex + 1);
                cmd.Parameters.AddWithValue("@email", EmailTextBox.Text);
                cmd.Parameters.AddWithValue("@contactno", Int64.Parse(ContactTextBox.Text));
                cmd.Parameters.AddWithValue("@password", PwdTextBox.Text);
                cmd.Parameters.AddWithValue("@graduationyear", int.Parse(YearOfGradDropDownList.SelectedValue));
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }catch(Exception ex) { Console.WriteLine(ex.StackTrace);  }
                finally
                {
                    con.Close();
                }
                string url = "~/LoginPage.aspx?userid=" + RegistrationNoTextBox.Text;
                //Session["ID"] = RegistrationNoTextBox.Text;
                Response.Redirect(url);
            }
        }
    }
}