using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentBAL;

namespace FinalProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMsg.Text = "";
            }
        }
        //Student details authentication on button click
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
                string mail = txtEmail.Text;
                string pass = txtPassword.Text;
                result = new StudentBALCRUD().StudentAuth(mail, pass);

                if (result == 1)
                {
                    //Taking the email into the session object for further use
                    Session["email"] = txtEmail.Text;
                    Response.Redirect("StudentDashboard.aspx");
                    txtEmail.Text = "";
                    txtPassword.Text = "";
                }
                else
                {
                    lblMsg.Text = "Incorrect Email/Password";
                    txtEmail.Text = "";
                    txtPassword.Text = "";
                }
            }
            catch
            {
                lblMsg.Text = "Somethings wrong, contact Admin";
            }
            
        }
    }
}