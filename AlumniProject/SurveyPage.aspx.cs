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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CompanyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CompanyNameTextBox.ReadOnly = false;
            CTCTextBox.ReadOnly = false;
            CGPACutoffTextBox.ReadOnly = false;
            string CS = ConfigurationManager.ConnectionStrings["AlumniPortalConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("select Name, CTC, CGPA_Cutoff from Company where Id=@id", con);
            cmd.Parameters.AddWithValue("@id", int.Parse(CompanyDropDownList.SelectedValue));
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    CompanyNameTextBox.Text = reader["Name"].ToString();
                    CTCTextBox.Text = reader["CTC"].ToString();
                    CGPACutoffTextBox.Text = reader["CGPA_Cutoff"].ToString();
                }
                
                CompanyNameTextBox.ReadOnly = true;
                CTCTextBox.ReadOnly = true;
                CGPACutoffTextBox.ReadOnly = true;
            }catch(Exception ex) { }
            finally
            {
                con.Close();
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //HttpCookie cookie = Request.Cookies["Student"];
            //string companyid = cookie["Company_ID"].ToString();
            //string offertype = cookie["Offer_Type"].ToString();
            string companyid = CompanyDropDownList.SelectedValue;
            string offertype = DropDownList1.SelectedValue; 
            string CS = ConfigurationManager.ConnectionStrings["AlumniPortalConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            if(Session["UserName"] == null)
            {
                Session["UserName"] = 000000000;
            }
            string regno = Session["UserName"].ToString();
            SqlCommand cmd1 = new SqlCommand("UPDATE Student SET Company_Id=@companyid, OfferType=@offertype where RegNo=@regno", con);
            cmd1.Parameters.AddWithValue("@companyid", int.Parse(companyid));
            cmd1.Parameters.AddWithValue("@offertype", offertype);
            cmd1.Parameters.AddWithValue("@regno",regno);
            SqlCommand cmd2 = new SqlCommand("insert into Survey values (@regno, @studentclub, @companyid, @difficulty, @rounds, @offertype)", con);
            cmd2.Parameters.AddWithValue("@regno", int.Parse(regno));
            cmd2.Parameters.AddWithValue("@studentclub", StudentClubTextBox.Text);
            cmd2.Parameters.AddWithValue("@companyid", int.Parse(companyid));
            cmd2.Parameters.AddWithValue("@difficulty", float.Parse(DifficultyTextBox.Text));
            cmd2.Parameters.AddWithValue("@rounds", int.Parse(RoundsTextBox.Text));
            cmd2.Parameters.AddWithValue("@offertype", offertype);
            try
            {
                con.Open();
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
            }catch(Exception ex) { }
            finally
            {
                con.Close();
            }

            Response.Redirect("~/ExitPage.aspx");

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpCookie newCookie = new HttpCookie("Student");
            newCookie["Company_ID"] = CompanyDropDownList.SelectedValue;
            newCookie["Offer_Type"] = DropDownList1.SelectedValue;
            Response.Cookies.Add(newCookie);
        }
    }
}