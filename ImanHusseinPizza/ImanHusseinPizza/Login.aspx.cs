using ImanHusseinPizza.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ImanHusseinPizza
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            CustomerUtility c = new CustomerUtility();
            c.userName = TextBoxuser.Text;
            c.password = TextBoxPassword.Text;
            if (c.checkPassword())
            {
                Session["user"] = TextBoxuser.Text;
                LabelMessage.Visible = true;
                LabelMessage.Enabled = true;
                LabelMessage.Text = "Welcome back!!";
                LabelMessage.ForeColor = System.Drawing.Color.Red;
                Response.AddHeader("refresh", "3;url=Home.aspx");

            }
            else
            {
                LabelMessage.Visible = true;
                LabelMessage.Enabled = true;
                LabelMessage.Text = "User or Password is  not correct";
                LinkButtonForgotpaswword.Enabled= true;
                LinkButtonForgotpaswword.Visible = true;
            }
        }
    }
}