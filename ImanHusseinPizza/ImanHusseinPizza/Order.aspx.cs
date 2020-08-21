using ImanHusseinPizza.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ImanHusseinPizza
{
    public partial class Order : System.Web.UI.Page
    {
        decimal price = 0;
        // here to select the size of pizza
        protected void updatePrice()
        {
            price = Convert.ToDecimal(DropDownListPizzaSize.SelectedValue);
            // for topping
            for (int i = 0; i < CheckBoxListToppings.Items.Count; i++)
            {
                if (CheckBoxListToppings.Items[i].Selected)
                {
                    price += Convert.ToDecimal(CheckBoxListToppings.Items[i].Value);
                }
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
               Response.Write("<script language=javascript> var agree; agree=confirm('You have to log in first'); window.location='Login.aspx';</script>");

            }
            updatePrice();
            LabelPrice.Text = "Total Price (not including Tax):" + price;


        }

        protected void ButtonNext_Click(object sender, EventArgs e)
        {

            updatePrice();
            string toppings = "";
            for (int i = 0; i < CheckBoxListToppings.Items.Count; i++)
            {
                if (CheckBoxListToppings.Items[i].Selected)
                {
                    toppings += CheckBoxListToppings.Items[i].Text + ", ";

                }
            }//close for loop
            ShoppingCartUti cart = new ShoppingCartUti();

            //The below line needs to be changed later on.
           cart.UserName = Session["user"].ToString();
            cart.PizzaSize = DropDownListPizzaSize.SelectedItem.ToString();
            cart.PizzaStyle = DropDownListPizzaStyle.SelectedItem.ToString();
            cart.Toppings = toppings;
            cart.Price = (double)price * (1.07);
            cart.insertShoppingCart();
            //The below line (Response) needs to be removed by
            //Response.Redirect("OrderConfirm.aspx?=id"+cart.ID);
           // Response.Write("<script language=javascript> var agree;agree=confirm('You have successfully added into ShoppingCart table'); </script>");

            Response.Redirect("OrderConfirm.aspx?id="+cart.ID);
        }

        protected void CheckBoxListToppings_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CheckBoxListToppings.Items.FindByText("Grilled Chicken").Selected)
            {
                ImageChicken.Visible = true;
            }
            else
            {
                ImageChicken.Visible = false;
            }
            if (CheckBoxListToppings.Items.FindByText("Pepperoni").Selected)
            {
                ImagePepperoni.Visible = true;
            }

            else
            {

                ImagePepperoni.Visible = false;
            }
            if (CheckBoxListToppings.Items.FindByText("Steak").Selected)
            {
                ImageSteak.Visible = true;
            }
            else
            {
                ImageSteak.Visible = false;
            }


        }//close order class
    }
}