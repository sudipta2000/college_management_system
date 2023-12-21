using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentBAL;
using System.Data.SqlClient;
using System.Configuration;

namespace FinalProject
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                idNamePopulation();
                if (check() == null || check() == "")
                {
                    Response.Redirect("StudentDashboard.aspx");
                }
                else
                {
                    dataPopulation();
                }

            }
        }

        //Cheking the student has filled up his/her form yet
        protected string check()
        {
            string fName = "";
            try
            {
                
                using (SqlConnection con = new SqlConnection(conString))
                {
                    SqlCommand cmd = new SqlCommand("select appln_fname from dbo.applications where appln_id=@applnID", con);
                    cmd.Parameters.AddWithValue("applnID", lblAppln.Text);
                    con.Open();
                    fName = cmd.ExecuteScalar().ToString();
                    con.Close();
                }
                
            }
            catch
            {
                lblMsg.Text = "Somehings wrong, Contact Admin";
            }
            return fName;

        }

        //Application ID and Name population into the download form
        protected void idNamePopulation()
        {
            try
            {
                string email = Session["email"].ToString();
                string[] id_name = new string[2];
                id_name = new StudentBALCRUD().getIdName(email);
                lblAppln.Text = id_name[0];
                lblName.Text = id_name[1];
            }
            catch
            {
                lblMsg.Text = "Session Expired, Login again to proceed";
            }
            
        }

        //All the data of the student populating in the download form
        protected void dataPopulation()
        {
            try
            {
                string[] studentDetails = new string[15];
                studentDetails = new StudentBALCRUD().showStudentData(lblAppln.Text);
                lblFname.Text = studentDetails[0];
                lblMname.Text = studentDetails[1];
                lblAddress.Text = studentDetails[2];
                lblGender.Text = studentDetails[3];
                lblDOB.Text = studentDetails[4];
                lblMobile.Text = studentDetails[5];
                imgPhotograph.ImageUrl = studentDetails[6];
                imgSignature.ImageUrl = studentDetails[7];
                lblCollege.Text = new StudentBALCRUD().getCollegeByID(Convert.ToInt32(studentDetails[8]));
                lblCourse.Text = new StudentBALCRUD().getCourseByID(Convert.ToInt32(studentDetails[9]));
                lblLastExam.Text = new StudentBALCRUD().getExamByID(Convert.ToInt32(studentDetails[11]));
                lblLastExamBoard.Text = new StudentBALCRUD().getBoardByID(Convert.ToInt32(studentDetails[12]));
                lblMarks.Text = studentDetails[13];
                lblPercentage.Text = studentDetails[14];
            }
            catch
            {
                lblMsg.Text = "Somehings wrong populating the data, Try again";
            }
            
        }
    }
}