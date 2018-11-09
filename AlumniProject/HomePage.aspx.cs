using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlumniProject
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        //DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (Session["UserName"] != null)
                welcomeLabel.Text = "Welcome " + cookie["userType"] + "! Your Id is: " + Session["UserName"];
            else
                welcomeLabel.Text = "Welcome " + cookie["userType"] + "! Your Id is:";
            if (!IsPostBack)
            {
                YearDropDownList.Enabled = false;
                BranchDropDownList.Enabled = false;
                CompanyDropDownList.Enabled = false;
                string CS = ConfigurationManager.ConnectionStrings["AlumniPortalConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("select RegNo, Name, Branch_Id, Email, ContactNo, Company_Id, OfferType, GraduationYear from Student", con);
                try
                {
                    con.Open();
                    GridView2.DataSource = cmd.ExecuteReader();
                    GridView2.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    con.Close();
                }
            }

            //GridView2.DataSource = null;
            //GridView2.DataBind();
        }

        protected void ApplyFilterButton_Click(object sender, EventArgs e)
        {
            int[] value = {0, 0, 0};

            if (YearCheckBox.Checked == true)
                value[0] = 1;
            if (BranchCheckBox.Checked == true)
                value[1] = 1;
            if (CompanyCheckBox.Checked == true)
                value[2] = 1;

            string val = String.Join(",", value.Select(x => x.ToString()).ToArray());
            Response.Write(val);

            string CS = ConfigurationManager.ConnectionStrings["AlumniPortalConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            string sqlQuery = "select RegNo, Name, Branch_Id, Email, ContactNo, Company_Id, OfferType, GraduationYear from Student";
            SqlCommand cmd = new SqlCommand(sqlQuery, con);
            switch (val)
            {
                case "0,0,0": cmd = new SqlCommand(sqlQuery, con);
                            break;
                case "0,0,1": sqlQuery += " where Company_Id = @companyid";
                            cmd = new SqlCommand(sqlQuery, con);
                            cmd.Parameters.AddWithValue("@companyid", int.Parse(CompanyDropDownList.SelectedValue));

                    break;
                case "0,1,0": sqlQuery += " where Branch_Id = @branchid";
                            cmd = new SqlCommand(sqlQuery, con);
                            cmd.Parameters.AddWithValue("@branchid", int.Parse(BranchDropDownList.SelectedValue));

                    break;
                case "0,1,1": sqlQuery += " where Company_Id = @companyid and Branch_Id = @branchid";
                            cmd = new SqlCommand(sqlQuery, con);
                            cmd.Parameters.AddWithValue("@companyid", int.Parse(CompanyDropDownList.SelectedValue));
                            cmd.Parameters.AddWithValue("@branchid", int.Parse(BranchDropDownList.SelectedValue));
                            break;
                case "1,0,0": sqlQuery += " where GraduationYear = @gradyear";
                            cmd = new SqlCommand(sqlQuery, con);
                            cmd.Parameters.AddWithValue("@gradyear", int.Parse(YearDropDownList.SelectedValue));
                            break;
                case "1,0,1": sqlQuery += " where GraduationYear = @gradyear and Company_Id = @companyid";
                            cmd = new SqlCommand(sqlQuery, con);
                            cmd.Parameters.AddWithValue("@gradyear", int.Parse(YearDropDownList.SelectedValue));
                            cmd.Parameters.AddWithValue("@companyid", int.Parse(CompanyDropDownList.SelectedValue));
                            break;
                case "1,1,0": sqlQuery += " where GraduationYear = @gradyear and Branch_Id = @branchid";
                            cmd = new SqlCommand(sqlQuery, con);
                            cmd.Parameters.AddWithValue("@gradyear", int.Parse(YearDropDownList.SelectedValue));
                            cmd.Parameters.AddWithValue("@branchid", int.Parse(BranchDropDownList.SelectedValue));
                            break;
                case "1,1,1": sqlQuery += " where GraduationYear = @gradyear and Branch_Id = @branchid and Company_id = @companyid";
                            cmd = new SqlCommand(sqlQuery, con);
                            cmd.Parameters.AddWithValue("@branchid", int.Parse(BranchDropDownList.SelectedValue));
                            cmd.Parameters.AddWithValue("@gradyear", int.Parse(YearDropDownList.SelectedValue));
                            cmd.Parameters.AddWithValue("@companyid", int.Parse(CompanyDropDownList.SelectedValue));
                            break;
            }

            try
            {
                con.Open();
                SqlDataReader r = cmd.ExecuteReader();

                GridView2.DataSource = r;
                GridView2.DataBind();

            }
            catch (Exception ex) { }
            finally
            {
                con.Close();
            }
        }

        protected void YearCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if(YearCheckBox.Checked == true)
            {
                //YearCheckBox.Checked = false;
                YearDropDownList.Enabled = true;
            }
            else
            {
                //YearCheckBox.Checked = true;
                YearDropDownList.Enabled = false;
            }
        }

        protected void BranchCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (BranchCheckBox.Checked == true)
            {
                //BranchCheckBox.Checked = false;
                BranchDropDownList.Enabled = true;
            }
            else
            {
                //BranchCheckBox.Checked = true;
                BranchDropDownList.Enabled = false;
            }
        }

        protected void CompanyCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if(CompanyCheckBox.Checked == true)
            {
                CompanyDropDownList.Enabled = true;
            }
            else
            {
                CompanyDropDownList.Enabled = false;
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("UserName");
            Response.Redirect("~/LoginPage.aspx");
        }
    }
}