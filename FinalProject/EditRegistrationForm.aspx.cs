using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentBAL;

namespace FinalProject
{
    public partial class WebForm8 : System.Web.UI.Page
    {
     
        string conString = ConfigurationManager.ConnectionStrings["ConDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                idNamePopulation();
                if(check()==null || check() == "")
                {
                    Response.Redirect("StudentDashboard.aspx");
                }
                else
                {
                    dataPopulation();
                }
                
            }
        }


        //Check if the student has already filled up his form or not.
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
                Response.Redirect("LoginPage.aspx");
            }
            return fName;


        }

        //Name and application ID population on page load
        protected void idNamePopulation()
        {
            try
            {
                string email = Session["email"].ToString();
                string[] id_name = new string[2];
                id_name = new StudentBALCRUD().getIdName(email);
                lblAppln.Text = id_name[0];
                txtName.Text = id_name[1];
            }
            catch(Exception e)
            {
                lblMsg.Text = "No email Id found";
            }
            
        }
      
        //Form data population on page load
        protected void dataPopulation()
        {
            try
            {
                string[] studentDetails = new string[15];
                studentDetails = new StudentBALCRUD().showStudentData(lblAppln.Text);
                txtFathersName.Text = studentDetails[0];
                txtMothersName.Text = studentDetails[1];
                txtAddress.Text = studentDetails[2];
                if (studentDetails[3] == "M")
                {
                    radioGender.SelectedValue = "Male";
                }
                else
                {
                    radioGender.SelectedValue = "Female";
                }
                txtDOB.Text = studentDetails[4];
                txtMobile.Text = studentDetails[5];
                txtCollege.Text = new StudentBALCRUD().getCollegeByID(Convert.ToInt32(studentDetails[8]));
                txtCourse.Text = new StudentBALCRUD().getCourseByID(Convert.ToInt32(studentDetails[9]));
                txtLastExamPass.Text = new StudentBALCRUD().getExamByID(Convert.ToInt32(studentDetails[11]));
                txtLastExamBoard.Text = new StudentBALCRUD().getBoardByID(Convert.ToInt32(studentDetails[12]));
                txtMarks.Text = studentDetails[13];
                txtPercentage.Text = studentDetails[14];
            }
            catch
            {
                lblMsg.Text = "Something's wrong, Contact Admin";
            }  
           
        }

        //Update data
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
                string[] details = new string[16];
                details = new StudentBALCRUD().showStudentData(lblAppln.Text);
                string fname = txtFathersName.Text;
                string mname = txtMothersName.Text;
                string address = txtAddress.Text;
                string gender = radioGender.SelectedValue;
                string dob = txtDOB.Text;
                string mobileNo = txtMobile.Text;
                string photoPath = details[6];
                string sigPath = details[7];
                int college = Convert.ToInt32(details[8]);
                int course = Convert.ToInt32(details[9]);
                int fees = Convert.ToInt32(details[10]);
                string lastExam = details[11].ToString();
                string lastExamBoard = details[12].ToString();
                string marks = txtMarks.Text;
                string grade = txtPercentage.Text;

                result = new StudentBAL.StudentBALCRUD().formDataInsert(lblAppln.Text, fname, mname, address, gender, dob, mobileNo,
                                                                        photoPath, sigPath, college, course, fees, lastExam, lastExamBoard, marks, grade);
                if (result > 0)
                {
                    lblMsg.Text = "Updated Successfully";
                }
                else
                {
                    lblMsg.Text = "Nope";
                }
            }
            catch
            {
                lblMsg.Text = "Something's wrong, Contact Admin";
            }
            
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtFathersName.Text = "";
            txtMothersName.Text = "";
            txtAddress.Text = "";
            txtMobile.Text = "";
            txtMarks.Text = "";
            txtPercentage.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("StudentDashboard.aspx");
            }
            catch
            {
                lblMsg.Text = "Somethings wrong, Contact Admin";
            }
            
        }
    }
}