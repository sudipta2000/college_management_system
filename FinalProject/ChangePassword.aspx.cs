using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentBAL;

namespace FinalProject
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblmsg.Text = "";
            }
        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            try
            {
                //Checking if the old and new passwords credential all matches or not.
                int result = 0;
                string email = Session["email"].ToString();
                string oldPass = txtOldPass.Text;
                string newPass = txtNewPass.Text;
                result = new StudentBALCRUD().changePassword(email, oldPass, newPass);

                if (result > 0)
                {
                    lblmsg.Text = "Password Changed successfully";
                    txtOldPass.Text = "";
                    txtNewPass.Text = "";
                    txtConPass.Text = "";
                    Response.Redirect("LoginPage.aspx");
                }
                else
                {
                    lblmsg.Text = "Password change failed";
                    txtOldPass.Text = "";
                    txtNewPass.Text = "";
                    txtConPass.Text = "";
                }
            }
            catch
            {
                lblmsg.Text = "Somethings wrong, try again or contact admin";
            }
            
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentDashboard.aspx");
        }
    }
}