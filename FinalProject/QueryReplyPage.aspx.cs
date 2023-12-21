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
    public partial class WebForm12 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    bindData();
                }
            }
            catch
            {
                lblmsg.Text = "Failed to load data";
            }
            
        }

        protected void bindData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    SqlCommand cmd = new SqlCommand("select * from helpdesk where query_active='Y'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvQuery.DataSource = dt;
                    gvQuery.DataBind();
                }
            }
            catch
            {
                lblmsg.Text = "Failed to load data from gridview";
            }
            
        }

        protected void gvQuery_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                gvQuery.EditIndex = e.NewEditIndex;
                bindData();
            }
            catch
            {
                lblmsg.Text = "Some problem occurred";
            }
            
        }

        protected void gvQuery_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int result = 0;
                GridViewRow row = gvQuery.Rows[e.RowIndex];

                int queryID = Convert.ToInt32(gvQuery.DataKeys[e.RowIndex].Values[0]);
                string reply = (row.FindControl("txtReply") as TextBox).Text;
                result = new StudentBALCRUD().adminReply(queryID, reply);
                gvQuery.EditIndex = -1;
                bindData();

                if (result > 0)
                {
                    lblmsg.Text = "Replied Successfully";
                }
                else
                {
                    lblmsg.Text = "Reply failed";
                }
            }
            catch
            {
                lblmsg.Text = "Failed to update gridview";
            }
            
        }

        protected void gvQuery_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                gvQuery.EditIndex = -1;
                bindData();
            }
            catch
            {
                lblmsg.Text = "Some problem";
            }
            
        }

        protected void gvQuery_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvQuery.PageIndex = e.NewPageIndex;
                bindData();
            }
            catch
            {
                lblmsg.Text = "Some Problem occurred";
            }
            
        }
    }
}