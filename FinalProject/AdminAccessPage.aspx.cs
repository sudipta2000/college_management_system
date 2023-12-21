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
    public partial class WebForm10 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindData();
            }
        }


        //binding data to gridview from database
        protected void bindData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    SqlCommand cmd = new SqlCommand("select * from applications where status='Y'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gridViewAdmin.DataSource = dt;
                    gridViewAdmin.DataBind();
                }
            }
            catch
            {
                lblMsg.Text = "Failed to retrive data for gridview";
            }
            
        }

        

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridViewAdmin.EditIndex = -1;
            bindData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int result = 0;
                GridViewRow row = gridViewAdmin.Rows[e.RowIndex];
                string applnID = (row.FindControl("lblApplnID") as Label).Text;
                string name = (row.FindControl("txtName") as TextBox).Text;
                string fname = (row.FindControl("txtFname") as TextBox).Text;
                string mname = (row.FindControl("txtMname") as TextBox).Text;
                string address = (row.FindControl("txtAddress") as TextBox).Text;
                string gender = (row.FindControl("txtGender") as TextBox).Text;
                string dob = (row.FindControl("txtDOB") as TextBox).Text;
                string mobile = (row.FindControl("txtMobileNo") as TextBox).Text;
                int clgCode = Convert.ToInt32((row.FindControl("txtCollege") as TextBox).Text);
                int courseCode = Convert.ToInt32((row.FindControl("txtCourse") as TextBox).Text);
                int fees = Convert.ToInt32((row.FindControl("txtFees") as TextBox).Text);
                string lastExam = (row.FindControl("txtLastExam") as TextBox).Text;
                string lastBoard = (row.FindControl("txtLastBoard") as TextBox).Text;
                string marks = (row.FindControl("txtMarks") as TextBox).Text;
                string percentage = (row.FindControl("txtPercentage") as TextBox).Text;

                result = new StudentBALCRUD().updateByAdmin(applnID, name, fname, mname, address, gender, dob,
                                                mobile, clgCode, courseCode, fees, lastExam,
                                                lastBoard, marks, percentage);
                gridViewAdmin.EditIndex = -1;
                bindData();

                if (result > 0)
                {
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                    lblMsg.Text = "Updation Successful";
                }
                else
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Updation Failed";
                }
            }
            catch
            {
                lblMsg.Text = "Somethings wrong, cantact IT";
            }
            
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridViewAdmin.EditIndex = e.NewEditIndex;
            bindData();
        }

        protected void gridViewAdmin_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int result = 0;
                string applnID = gridViewAdmin.DataKeys[e.RowIndex].Values[0].ToString();
                result = new StudentBALCRUD().dataDeleteByAdmin(applnID);
                bindData();
                if (result > 0)
                {
                    lblMsg.Text = "Data Deleted";
                }
                else
                {
                    lblMsg.Text = "Nope";
                }
            }
            catch
            {
                lblMsg.Text = "Somethings wrong, Contact IT";
            }
            
        }

        protected void gridViewAdmin_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridViewAdmin.PageIndex = e.NewPageIndex;
            bindData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
                Session["email"] = txtSearch.Text;
                string email = txtSearch.Text;
                result = new StudentBALCRUD().checkEmail(email);
                if (result == 1)
                {
                    Response.Redirect("StudentRegistration.aspx");
                }
                else
                {
                    lblMsg.Text = "No registered student with this email id";
                }
            }
            catch
            {
                lblMsg.Text = "Somethings wrong, Contact IT";
            }
            
            
        }
    }
}