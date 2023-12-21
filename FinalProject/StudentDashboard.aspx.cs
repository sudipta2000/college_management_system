using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace FinalProject
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Directing to different pages of Student access
        protected void btnFormFillup_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentRegistration.aspx");
        }

        protected void btnFormDownload_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentFormDownload.aspx");
        }

        protected void btnEditForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditRegistrationForm.aspx");
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentQuery.aspx");
        }

        protected void btnPassChange_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }
        //Logout of the session and clear the session data
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            
            Session.Abandon();
            Session.Clear();
            FormsAuthentication.SignOut();
            FormsAuthentication.Initialize();
            HttpContext context = HttpContext.Current;
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, string.Empty);
            cookie.Path = FormsAuthentication.FormsCookiePath;
            cookie.Expires = DateTime.Now;
            context.Response.Cookies.Remove(FormsAuthentication.FormsCookieName);
            context.Response.Cookies.Add(cookie);
            Response.Redirect("LoginPage.aspx");
        }
    }
}