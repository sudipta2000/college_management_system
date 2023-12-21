using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StudentDAL;

namespace StudentBAL
{
    public class StudentBALCRUD
    {
        public int insertSignUpData(string name, string email, string pass)
        {
            return new StudentDALCRUD().insertSignUpDataintoDB(name, email, pass);
        }

        public int StudentAuth(string mail, string pass)
        {
            return new StudentDALCRUD().studentLoginAuth(mail, pass);
        }

        public int formDataInsert(string applID, string fname, string mname, string address, string gender, string dob,
                                    string mobileNo, string photoPath, string signaturePath, int college,
                                    int course, int fees, string lastExam, string lastExamBoard, string marks, string grade)
        {
            return new StudentDALCRUD().formFillupData(applID, fname, mname, address, gender, dob, mobileNo, photoPath, signaturePath, college,
                course, fees, lastExam, lastExamBoard, marks, grade);
        }

        public int changePassword(string email, string oldPass, string newPass)
        {
            return new StudentDALCRUD().passChange(email, oldPass, newPass);
        }

        public int queryInsert(string queryDeatails, string author)
        {
            return new StudentDALCRUD().querySubmit(queryDeatails, author);
        }

        public string[] getIdName(string email)
        {
            return new StudentDALCRUD().formDataPopulation(email);
        }

        public string[] showStudentData(string applnID)
        {
            return new StudentDALCRUD().getStudentDetails(applnID);
        }

        public string getCollegeByID(int collegeID)
        {
            return new StudentDALCRUD().getClgName(collegeID);
        }

        public string getCourseByID(int courseID)
        {
            return new StudentDALCRUD().getCourse(courseID);
        }

        public string getExamByID(int examID)
        {
            return new StudentDALCRUD().getExam(examID);
        }

        public string getBoardByID(int boardID)
        {
            return new StudentDALCRUD().getBoard(boardID);
        }

        public int updateByAdmin(string applID,string name, string fname, string mname, string address, string gender, string dob,
                                    string mobileNo, int college,
                                    int course, int fees, string lastExam, string lastExamBoard, string marks, string grade)
        {
            return new StudentDALCRUD().adminDataUpdation(applID,name, fname, mname, address, gender, dob, mobileNo, college,
                course, fees, lastExam, lastExamBoard, marks, grade);
        }


        public int dataDeleteByAdmin(string applnID)
        {
            return new StudentDALCRUD().adminDataDelete(applnID);
        }

        public int adminReply(int queryID, string reply)
        {
            return new StudentDALCRUD().queryUpdate(queryID, reply);
        }

        public int studentQueryUpdation(int queryID)
        {
            return new StudentDALCRUD().stduentQueryDelete(queryID);
        }

        public int checkEmail(string email)
        {
            return new StudentDALCRUD().emailCheck(email);
        }
    }
}
