using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


namespace FinalProject
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAccessPage.aspx");
        }

        protected void btnQueryCheck_Click(object sender, EventArgs e)
        {
            Response.Redirect("QueryReplyPage.aspx");
        }

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
            Response.Redirect("AdminLoginPage.aspx");
        }
    }
}