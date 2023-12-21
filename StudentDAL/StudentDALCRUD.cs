using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace StudentDAL
{
    public class StudentDALCRUD
    {
        //Connection String from web.config
        static string _conString = ConfigurationManager.ConnectionStrings["ConDB"].ConnectionString;

        //inserting data into registered student details and applications table
        public int insertSignUpDataintoDB(string name, string email, string pass)
        {
            int returnValue = 0;
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("spSignUpDataInsert", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@mail", email);
                cmd.Parameters.AddWithValue("@pass", pass);
                con.Open();
                returnValue = cmd.ExecuteNonQuery();
                con.Close();
            }
            return returnValue;
           }
        //Checking student login authentication
        public int studentLoginAuth(string email, string pass)
        {
            int returnValue = 0;
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("spStudentLoginAuth", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("mail", email);
                cmd.Parameters.AddWithValue("pass", pass);
                con.Open();
                returnValue = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
            }
            return returnValue;
        }

        //inserting/Updating data to application table when a student fillup/update his/her form
        public int formFillupData(string applID,string fname, string mname, string address, string gender, string dob,
                                    string mobileNo, string photoPath, string signaturePath, int college,
                                    int course, int fees, string lastExam, string lastExamBoard, string marks, string grade)
        {
            int returnValue = 0;
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("spFormFillup", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("applnID", applID);
                cmd.Parameters.AddWithValue("fname", fname);
                cmd.Parameters.AddWithValue("mname", mname);
                cmd.Parameters.AddWithValue("address", address);
                cmd.Parameters.AddWithValue("gender", gender);
                cmd.Parameters.AddWithValue("dob", dob);
                cmd.Parameters.AddWithValue("mobileNo", mobileNo);
                cmd.Parameters.AddWithValue("photoPath", photoPath);
                cmd.Parameters.AddWithValue("signaturePath", signaturePath);
                cmd.Parameters.AddWithValue("college", college);
                cmd.Parameters.AddWithValue("course", course);
                cmd.Parameters.AddWithValue("fees", fees);
                cmd.Parameters.AddWithValue("lastExam", lastExam);
                cmd.Parameters.AddWithValue("lastExamBoard", lastExamBoard);
                cmd.Parameters.AddWithValue("marks", marks);
                cmd.Parameters.AddWithValue("grade", grade);
                con.Open();
                returnValue = cmd.ExecuteNonQuery();
                con.Close();
            }
            return returnValue;
         }
        //Checking the password change credentials
        public int passChange(string email, string oldPass, string newPass)
        {
            int returnValue = 0;
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("spChangePassword", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("email", email);
                cmd.Parameters.AddWithValue("oldPass", oldPass);
                cmd.Parameters.AddWithValue("newPass", newPass);
                con.Open();
                returnValue = cmd.ExecuteNonQuery();
                con.Close();
            }
            return returnValue;
         }
        //Student query submission and inserting into DB
        public int querySubmit(string queryDetails, string queryAuthor)
        {
            int returnValue = 0;
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("spInsertQuery", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("queryDetails", queryDetails);
                cmd.Parameters.AddWithValue("queryPostedBy", queryAuthor);
                con.Open();
                returnValue = cmd.ExecuteNonQuery();
                con.Close();
            }
            return returnValue;
         }

        //populating the form with name and application number every time the page loads
        public string[] formDataPopulation(string email)
        {
            string[] id_name = new string[2];
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("select user_name,appln_id from testing.registered_user where user_mail = @mail", con);
                cmd.Parameters.AddWithValue("mail", email);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    id_name[0] = rdr["appln_id"].ToString();
                    id_name[1] = rdr["user_name"].ToString();
                    
                }
                con.Close();
            }
            return id_name; ;
        }

        //Getting the student details for populating the update form
        public string[] getStudentDetails(string applnID)
        {
            string[] details = new string[16];
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("select * from APPLICATIONS where appln_id=@applnID ", con);
                cmd.Parameters.AddWithValue("@applnID", applnID);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    details[0] = rdr["APPLN_FNAME"].ToString();
                    details[1] = rdr["APPLN_MNAME"].ToString();
                    details[2] = rdr["APPLN_ADD"].ToString();
                    details[3] = rdr["APPLN_GENDER"].ToString();
                    details[4] = rdr["APPLN_DOB"].ToString();
                    details[5] = rdr["APPLN_MOB"].ToString();
                    details[6] = rdr["APPLN_PHOTO"].ToString();
                    details[7] = rdr["APPLN_SIGN"].ToString();
                    details[8] = rdr["APPLN_COLCD"].ToString();
                    details[9] = rdr["APPLN_CRSCD"].ToString();
                    details[10] = rdr["APPLN_FEES"].ToString();
                    details[11] = rdr["APPLN_LAST_EXAM"].ToString();
                    details[12] = rdr["APPLN_LAST_BOARD"].ToString();
                    details[13] = rdr["APPLN_LAST_OBTM"].ToString();
                    details[14] = rdr["APPLN_PERCTG"].ToString();
                    details[15] = rdr["APPLN_FILLED_BY"].ToString();
                }
                con.Close();
                return details;
            }
        }

        //getting college name using college ID
        public string getClgName(int clgCode)
        {
            string name = "";
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("select clgnm from dbo.COLLEGE_MASTER where CLGCD=@clgCode", con);
                cmd.Parameters.AddWithValue("@clgCode", clgCode);
                con.Open();
                name = cmd.ExecuteScalar().ToString();
                con.Close();
            }
            return name;
        }

        //Geting couse details from course ID
        public string getCourse(int courseID)
        {
            string name = "";
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("select course_details from dbo.COURSE_MASTER where course_id=@courseID", con);
                cmd.Parameters.AddWithValue("@courseID", courseID);
                con.Open();
                name = cmd.ExecuteScalar().ToString();
                con.Close();
            }
            return name;
        }
        
        //Getting exam name using exam ID
        public string getExam(int examID)
        {
            string name = "";
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("select exam_name from dbo.exam_master where exam_id=@examID", con);
                cmd.Parameters.AddWithValue("@examID", examID);
                con.Open();
                name = cmd.ExecuteScalar().ToString();
                con.Close();
            }
            return name;
        }


        //Getting board name using board ID
        public string getBoard(int boardID)
        {
            string name = "";
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("select board_name from dbo.board_master where board_id=@boardID", con);
                cmd.Parameters.AddWithValue("@boardID", boardID);
                con.Open();
                name = cmd.ExecuteScalar().ToString();
                con.Close();
            }
            return name;
        }


        //Admin data update previlage through gridview
        public int adminDataUpdation(string applID, string name, string fname, string mname, string address, string gender, string dob,
                                    string mobileNo, int college,
                                    int course, int fees, string lastExam, string lastExamBoard, string marks, string grade)
        {
            int returnValue = 0;
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("spAdminDataUpdation", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("applnID", applID);
                cmd.Parameters.AddWithValue("name", name);
                cmd.Parameters.AddWithValue("fname", fname);
                cmd.Parameters.AddWithValue("mname", mname);
                cmd.Parameters.AddWithValue("address", address);
                cmd.Parameters.AddWithValue("gender", gender);
                cmd.Parameters.AddWithValue("dob", dob);
                cmd.Parameters.AddWithValue("mobileNo", mobileNo);
                cmd.Parameters.AddWithValue("college", college);
                cmd.Parameters.AddWithValue("course", course);
                cmd.Parameters.AddWithValue("fees", fees);
                cmd.Parameters.AddWithValue("lastExam", lastExam);
                cmd.Parameters.AddWithValue("lastExamBoard", lastExamBoard);
                cmd.Parameters.AddWithValue("marks", marks);
                cmd.Parameters.AddWithValue("grade", grade);
                con.Open();
                returnValue = cmd.ExecuteNonQuery();
                con.Close();
            }
            return returnValue;
        }

        //Admin data deletion from gridview
        public int adminDataDelete(string applnID)
        {
            int returnValue = 0;
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("spDeleteRowFromAdmin", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("applnID", applnID);
                con.Open();
                returnValue = cmd.ExecuteNonQuery();
                con.Close();
            }
            return returnValue;
         }

        //Admin query reply
        public int queryUpdate(int queryID, string reply)
        {
            int returnValue = 0;
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("spQueryUpdate", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("queryID", queryID);
                cmd.Parameters.AddWithValue("queryReply", reply);
                con.Open();
                returnValue = cmd.ExecuteNonQuery();
                con.Close();
            }
            return returnValue;
        }

        //Student query marked as solved.
        public int stduentQueryDelete(int queryID)
        {
            int returnValue = 0;
            using (SqlConnection con= new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("spStudentQueryDelete", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("queryID", queryID);
                con.Open();
                returnValue = cmd.ExecuteNonQuery();
                con.Close();
            }
            return returnValue;
        }

        //Cheking for existing student from admin side to fillup their form
        public int emailCheck(string email)
        {
            int returnValue = 0;
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("spEmailCheck", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("email", email);
                con.Open();
                returnValue =Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
            }
            return returnValue;
        }
    }
}
