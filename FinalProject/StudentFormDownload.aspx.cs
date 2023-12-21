using StudentBAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class StudentFormDownload : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                idNamePopulation();
                //Check if the student has filled up the form or not
                //if yes they can doenload the form
                //else they will be redirected to the form-fillup page
                if (check() == null || check() == "")
                {
                    Response.Redirect("StudentRegistration.aspx");
                }
                else
                {
                    dataPopulation();
                }

            }
        }

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
                lblMsg.Text = "Somethings wrong, Contact Admin";
            }
            return fName;

        }
        //getting student name and application ID
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
                lblMsg.Text = "Session has expired, login again";
            }
            
        }

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
                lblMsg.Text = "Data populatioin falied due to some error";
            }
            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentDashboard.aspx");
        }
    }
}