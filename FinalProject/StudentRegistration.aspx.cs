using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                
                formDataPopulation();
                //Checking if the student has already filled up the form or not
                //if yes then she/he will be redirected to Edit Form Page.
                if(check()==""|| check() == null)
                {
                    ddlCollegeDetails();
                    ddlCourseSelection();
                    ddlExamSelection();
                    ddlBoardSelection();
                }
                else
                {
                    Response.Redirect("EditRegistrationForm.aspx");
                }
            }
        }

        //Checking if the stduent is already registered or not
        protected string check()
        {
            string fName = "";
            using (SqlConnection con = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand("select appln_fname from dbo.applications where appln_id=@applnID", con);
                cmd.Parameters.AddWithValue("applnID", lblAppln.Text);
                con.Open();
                fName = cmd.ExecuteScalar().ToString();
                con.Close();
            }
            return fName;
        }
        //populating the dropdowns for different fields
        protected void ddlCollegeDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(conString);
                string cmd = "select clgcd, clgnm from COLLEGE_MASTER";
                SqlDataAdapter sda = new SqlDataAdapter(cmd, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ddlCollege.DataSource = dt;
                ddlCollege.DataTextField = "clgnm";
                ddlCollege.DataValueField = "clgcd";
                ddlCollege.DataBind();
            }
            catch
            {
                lblMsg.Text = "Somethings Wrong, Contact Admin";
            }
        }

        protected void ddlCourseSelection()
        {
            try
            {
                SqlConnection con = new SqlConnection(conString);
                string cmd = "select course_id, course_details from COURSE_MASTER";
                SqlDataAdapter sda = new SqlDataAdapter(cmd, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ddlCourse.DataSource = dt;
                ddlCourse.DataTextField = "course_details";
                ddlCourse.DataValueField = "course_id";
                ddlCourse.DataBind();
            }
            catch
            {
                lblMsg.Text = "Somethings Wrong, Contact Admin";
            }
            
        }

        protected void ddlExamSelection()
        {
            try
            {
                SqlConnection con = new SqlConnection(conString);
                string cmd = "select exam_id, exam_name from EXAM_MASTER";
                SqlDataAdapter sda = new SqlDataAdapter(cmd, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ddlExam.DataSource = dt;
                ddlExam.DataTextField = "exam_name";
                ddlExam.DataValueField = "exam_id";
                ddlExam.DataBind();
            }
            catch
            {
                lblMsg.Text = "Somethings Wrong, Contact Admin";
            }
            
        }

        protected void ddlBoardSelection()
        {
            try
            {
                SqlConnection con = new SqlConnection(conString);
                string cmd = "select board_id,board_name from BOARD_MASTER";
                SqlDataAdapter sda = new SqlDataAdapter(cmd, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ddlBoard.DataSource = dt;
                ddlBoard.DataTextField = "board_name";
                ddlBoard.DataValueField = "board_id";
                ddlBoard.DataBind();
            }
            catch
            {
                lblMsg.Text = "Somethings Wrong, Contact Admin";
            }
            
        }
        //Getting fees from course ID
        protected int getFees(int courseId)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(conString))
            {
                
                string query = "select course_fees from course_master where course_id=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("id", courseId);
                con.Open();
                result = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
            }
            return result;
            
            

        }

        //Sending the data to DataBase Application table
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
                string picFileName = Path.GetFileName(picture.PostedFile.FileName);
                picture.SaveAs(Server.MapPath("~/UploadedDocs/picture/" + picFileName));
                string sigFileName = Path.GetFileName(signature.PostedFile.FileName);
                signature.SaveAs(Server.MapPath("~/UploadedDocs/signature/" + sigFileName));
                string applnID = lblAppln.Text;
                string fname = txtFathersName.Text;
                string mname = txtMothersName.Text;
                string address = txtAddress.Text;
                string gender = radioGender.SelectedValue;
                string dob = txtDOB.Text;
                string mobileNo = txtMobile.Text;
                string photoPath = "/UploadedDocs/picture/" + picFileName;
                string sigPath = "/UploadedDocs/signature/" + sigFileName;
                int college = Convert.ToInt32(ddlCollege.SelectedItem.Value);
                int course = Convert.ToInt32(ddlCourse.SelectedItem.Value);
                int fees = getFees(course);
                string lastExam = ddlExam.SelectedItem.Value.ToString();
                string lastExamBoard = ddlBoard.SelectedItem.Value.ToString();
                string marks = txtMarks.Text;
                string grade = txtPercentage.Text;

                result = new StudentBAL.StudentBALCRUD().formDataInsert(applnID, fname, mname, address, gender, dob, mobileNo,
                                                                        photoPath, sigPath, college, course, fees, lastExam, lastExamBoard, marks, grade);
                if (result > 0)
                {
                    lblMsg.Text = "Data uploaded successfully";
                }
                else
                {
                    lblMsg.Text = "Upload Failed";
                }
            }
            catch
            {
                lblMsg.Text = "Somethings Wrong, Contact Admin";
            }
            
        }

        //Populating the Student name and Application number in the from
        protected void formDataPopulation()
        {
            try
            {
                string email = Session["email"].ToString();
                using (SqlConnection con = new SqlConnection(conString))
                {
                    SqlCommand cmd = new SqlCommand("spFormPopulation", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("mail", email);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        lblAppln.Text = rdr["APPLN_ID"].ToString();
                        txtName.Text = rdr["APPLN_NAME"].ToString();
                    }
                    con.Close();
                }
            }
            catch
            {
                lblMsg.Text = "Somethings Wrong, Contact Admin";
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtFathersName.Text = "";
            txtMothersName.Text = "";
            txtAddress.Text = "";
            radioGender.ClearSelection();
            txtDOB.Text = "";
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
                lblMsg.Text = "Page not found";
            }
            
        }
    }
}