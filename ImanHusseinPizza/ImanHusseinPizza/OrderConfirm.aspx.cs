using ImanHusseinPizza.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ImanHusseinPizza
{
    public partial class OrderConfirm : System.Web.UI.Page
    {
        string addressId;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCheckOut_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(addressId))
            {
                //Access Delivery_Address table
                AddressUti adr = new AddressUti();
                adr.AddressType = TextBoxAddressType.Text;
                adr.UserName = Session["user"].ToString();
                adr.Phone = TextBoxPhone.Text;
                adr.AddressLine1 = TextBoxAddressLine1.Text;
                adr.AddressLine2 = TextBoxAddressLine2.Text;
                adr.ZipCode = TextBoxZipCode.Text;
                adr.insertAddress();
                addressId = adr.Delivery_ID;
            }
            //Access ShoppingCartUti Table
            ShoppingCartUti cart = new ShoppingCartUti();
            cart.ID = Request.QueryString["id"].ToString();
            cart.readRecordById();

            //Access Order Table
            OrderUti order = new OrderUti();
            order.PizzaSize = cart.PizzaSize;
            order.PizzaStyle = cart.PizzaStyle;
            order.Price = cart.Price;
            order.Toppings = cart.Toppings;
            order.UserName = cart.UserName;
            order.Delivery_ID = addressId;
            order.insertOrder();
            cart.removeRecord();
            //You need to create a ThankYou Page
            Response.Redirect("ThankYou.aspx?id="+cart.ID);

        }//close ButtonCheckOut_Click method

        protected void DropDownListAddressType_SelectedIndexChanged(object sender, EventArgs e)
        {

            AddressUti adr = new AddressUti();
            adr.Delivery_ID = DropDownListAddressType.SelectedValue;
            adr.selectAddress();
            TextBoxAddressType.Text = adr.AddressType;
            TextBoxAddressLine1.Text = adr.AddressLine1;
            TextBoxAddressLine2.Text = adr.AddressLine2;
            TextBoxZipCode.Text = adr.ZipCode;
            TextBoxPhone.Text = adr.Phone;
            addressId = adr.Delivery_ID;

        }//close DropDownListAddressType_SelectedIndexChanged method

    }
}