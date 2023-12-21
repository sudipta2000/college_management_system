using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentBAL;
using System.Data;

namespace FinalProject
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConDB"].ConnectionString;
        string userID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            GetStudentDetails();
            bindData();
        }
        //Populating gridview
        protected void bindData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    SqlCommand cmd = new SqlCommand("select * from helpdesk where query_active='Y' and query_post_by=@userID", con);
                    cmd.Parameters.AddWithValue("userID", userID);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvStudentQuery.DataSource = dt;
                    gvStudentQuery.DataBind();
                }
            }
            catch
            {
                lblmsg.Text = "Somethings wrong, try again or Contact Admin";
            }
            
        }



        protected void GetStudentDetails()
        {
            try
            {
                string email = Session["email"].ToString();

                using (SqlConnection con = new SqlConnection(conString))
                {
                    SqlCommand cmd = new SqlCommand("spGetStudentName", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("mail", email);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        lblName.Text = rdr["user_name"].ToString();
                        userID = rdr["user_id"].ToString();
                    }
                    con.Close();
                }
            }
            catch
            {
                lblmsg.Text = "Session Expired, Login again to continue";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
                string query = txtQuery.Text;
                result = new StudentBALCRUD().queryInsert(query, userID);
                bindData();
                if (result > 0)
                {
                    lblmsg.Text = "Query Submitted";

                }
                else
                {
                    lblmsg.Text = "Query submission failed";
                }
            }
            catch
            {
                lblmsg.Text = "Somethings wrong, contact Admin";
            }
            
        }

        protected void gvStudentQuery_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int res = 0;
                int queryID = Convert.ToInt32(gvStudentQuery.DataKeys[e.RowIndex].Values[0]);
                res = new StudentBALCRUD().studentQueryUpdation(queryID);
                bindData();
                if (res > 0)
                {
                    lblmsg.Text = "Query Deleted";
                }
                else
                {
                    lblmsg.Text = "Deletion Failed";
                }
            }
            catch
            {
                lblmsg.Text = "Somethings wrong, contact Admin";
            }

        }

        protected void gvStudentQuery_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudentQuery.PageIndex = e.NewPageIndex;
            bindData();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentDashboard.aspx");
        }
    }
}