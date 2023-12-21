using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string username = txtUserName.Text;
                string password = txtPassword.Text;
                if (username == "RaspyWine" && password == "admin")
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    txtUserName.Text = "";
                    txtPassword.Text = "";
                    lblMsg.Text = "Incorrect Username/Password";
                }
            }
            catch
            {
                lblMsg.Text = "Somethings wrong, Contact IT";
            }
            
        }
    }
}