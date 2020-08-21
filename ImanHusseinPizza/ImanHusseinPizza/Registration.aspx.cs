using ImanHusseinPizza.App_Code;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ImanHusseinPizza
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            CustomerUtility customer = new CustomerUtility();
            customer.userName = TextBoxUserName.Text;
            customer.fName = TextBoxFname.Text;
            customer.lName = TextBoxLname.Text;
            customer.email = TextBoxEmail.Text;
            customer.country = DropDownListCountry.SelectedItem.ToString();
            customer.password = TextBoxPassword.Text;
            customer.age = Convert.ToInt32(TextBoxAge.Text);
            if (RadioButtonFemale.Checked)
            {
                customer.gender = 'F';
            }
            else
            {
                customer.gender = 'M';
            }
            if (!customer.checkUserExist())
            { 
                customer.insertData();
            LabelWelcome.Text = "You have register with BSU pizaa sucsusfully";
            LabelWelcome.ForeColor = Color.Red;
                Response.AddHeader("refresh","3;url=Login.aspx");
        }
            else
            {
                LabelWelcome.Text = "User already exist";
                LabelWelcome.ForeColor = Color.Red;
                Response.AddHeader("refresh", "3;url=Login.aspx");
            }
        }//close Buttonsubmit
    }
}