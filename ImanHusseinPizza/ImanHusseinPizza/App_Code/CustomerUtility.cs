using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace ImanHusseinPizza.App_Code
{
    public class CustomerUtility
    {//Instance variable
        public string userName { get; set; }
        public string fName { get; set; }
        public string lName { get; set; }
        public string email { get; set; }
        public string country { get; set; }
        public string password { get; set; }
        public int age { get; set; }
        public char gender { get; set; }

        //methods
        public void insertData()
        {//build connect
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings
                ["pizzaDBSummer2017"].ConnectionString);
            conn.Open();
            string insertString = "insert into Customer(UserName,FName,LName,Email,Country,Password,Age,Gender)values(@UserName, @FName, @LName, @Email, @Country, @Password,@Age,@Gender)";
                SqlCommand comd = new SqlCommand(insertString, conn);
                comd.Parameters.AddWithValue("@UserName", this.userName);
                comd.Parameters.AddWithValue("@FName", this.fName);
                comd.Parameters.AddWithValue("@lName", this.lName);
                comd.Parameters.AddWithValue("@Email", this.email);
                comd.Parameters.AddWithValue("@Country", this.country);
               comd.Parameters.AddWithValue("@Password", EncryptPassword.encryptString(this.password));
             // comd.Parameters.AddWithValue("@Password", this.password);
                comd.Parameters.AddWithValue("@Age", this.age);
                comd.Parameters.AddWithValue("@Gender", this.gender);
                comd.ExecuteNonQuery();
                conn.Close();



        }// close insertData method
        public bool checkUserExist() {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings
                   ["pizzaDBSummer2017"].ConnectionString);
            conn.Open();
            string checkuser = "select* from Customer where UserName=@UserName";
                SqlCommand comd = new SqlCommand(checkuser, conn);
            comd.Parameters.AddWithValue("@username", this.userName);
            SqlDataReader dr = comd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
                conn.Close();
                return true;


            }

            return false;
        }//checkUserExist()
        //start password
        public bool checkPassword()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings
                   ["pizzaDBSummer2017"].ConnectionString);
            conn.Open();
            string checkuser = "select* from Customer where UserName=@UserName";
            SqlCommand comd = new SqlCommand(checkuser, conn);
            comd.Parameters.AddWithValue("@username", this.userName);
            SqlDataReader dr = comd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                if (dr["Password"].ToString().Equals(EncryptPassword.encryptString(this.password)))
               {
                    //if (dr["Password"].ToString().Equals(this.password))
                    // {
                    dr.Close();
                    conn.Close();
                    return true;
                }
            }
           // dr.Close();
           // conn.Close();
            return false;
        }// get user info 7-13 after reset password
        public CustomerUtility getUserInfo(string userNameInput)
        {
            CustomerUtility c = new CustomerUtility();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings
               ["pizzaDBSummer2017"].ConnectionString);
            conn.Open();
            string searchStr = "select UserName, FName, LName, Email, Country, Password, Age, Gender from Customer where UserName=@userName";
            SqlCommand comd = new SqlCommand(searchStr, conn);
            comd.Parameters.AddWithValue("@userName", userNameInput);
            SqlDataReader dr = comd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                c.userName = dr[0].ToString();
                c.fName = dr[1].ToString();
                c.lName = dr[2].ToString();
                c.email = dr[3].ToString();
                c.country = dr[4].ToString();
                c.password = dr[5].ToString();
                c.age = Convert.ToInt32(dr[6].ToString());
                c.gender = dr[7].ToString().ToCharArray()[0];

            }
            dr.Close();
            conn.Close();


            return c;
        }//close gettuser info
        public void resetPassord(string newPassword)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings
               ["pizzaDBSummer2017"].ConnectionString);
            conn.Open();
            string updateStr = "update Customer Set Customer.Password=@password where Customer.UserName=@userName";
            SqlCommand comd = new SqlCommand(updateStr, conn);
            comd.Parameters.AddWithValue("@userName",this.userName);
 
            comd.Parameters.AddWithValue("@password", EncryptPassword.encryptString(newPassword));
            comd.ExecuteNonQuery();
            conn.Close();
        }

    }//close customerutility class

}