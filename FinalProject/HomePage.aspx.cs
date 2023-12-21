using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentBAL;
namespace FinalProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Student registration on button click
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            int result = 0;
            try
            {
                string name = txtName.Text;
                string email = txtMail.Text;
                string pass = txtPassword.Text;
                //calling insert function from Business access layer
                result = new StudentBALCRUD().insertSignUpData(name, email, pass);
            }
            catch
            {
                lblmsg.Text = "Somethings wrong, try again or contact admin";
            }
            
            
            //Checking if the data inserted successfully or not
            if (result > 0)
            {
                lblmsg.Text = "Successfully Registered";
                txtName.Text = "";
                txtMail.Text = "";
            }
            else
            {
                txtName.Text = "";
                txtMail.Text = "";
                lblmsg.Text = "Registration failed";
            }
        }
    }
}