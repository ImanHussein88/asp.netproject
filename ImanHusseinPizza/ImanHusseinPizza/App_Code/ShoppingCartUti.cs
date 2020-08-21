using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ImanHusseinPizza.App_Code
{
    
    public class ShoppingCartUti
    {
        public string ID { get; set; }
        public string UserName { get; set; }
        public string PizzaSize { get; set; }
        public string PizzaStyle { get; set; }
        public string Toppings { get; set; }
        public double Price { get; set; }
       
        public void insertShoppingCart()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["pizzaDBSummer2017"].ConnectionString);
            conn.Open();
            string qryStr = "insert into [ShoppingCart] values (@UserName, @PizzaSize,@PizzaStyle,@Toppings, @Price) select @@identity";
            ////@@IDENTITY returns the last identity value generated for any table in the current session
            SqlCommand cmd = new SqlCommand(qryStr, conn);
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@PizzaSize", PizzaSize);
            cmd.Parameters.AddWithValue("@PizzaStyle", PizzaStyle);
            cmd.Parameters.AddWithValue("@Toppings", Toppings);
            cmd.Parameters.AddWithValue("@Price", Price);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            ID = dr[0].ToString();
            dr.Close();
            conn.Close();
        }//close insertShoppingCart method
        public void readRecordById()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["pizzaDBSummer2017"].ConnectionString);
            conn.Open();
            string qryStr = "select * from ShoppingCart where (id = @id)";
            SqlCommand cmd = new SqlCommand(qryStr, conn);
            cmd.Parameters.AddWithValue("@id", ID);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            ID = dr["Id"].ToString();
            UserName = dr["UserName"].ToString();
            PizzaSize = dr["PizzaSize"].ToString();
            PizzaStyle = dr["PizzaStyle"].ToString();
            Toppings = dr["Toppings"].ToString();
            Price = Convert.ToDouble(dr["Price"].ToString());
            dr.Close();
            conn.Close();
        }//close readRecordById method

        public void removeRecord()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["pizzaDBSummer2017"].ConnectionString);
            conn.Open();
            string qryStr = "delete from [ShoppingCart] where (Id = @id)";
            SqlCommand cmd = new SqlCommand(qryStr, conn);
            cmd.Parameters.AddWithValue("@id", ID);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

    }

    }