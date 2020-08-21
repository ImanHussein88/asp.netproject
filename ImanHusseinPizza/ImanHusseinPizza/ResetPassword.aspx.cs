using ImanHusseinPizza.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ImanHusseinPizza
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Buttonrestpassord_Click(object sender, EventArgs e)
        {
            CustomerUtility c = new CustomerUtility().getUserInfo(TextBoxuserName.Text);
            if (c.email.Equals(TextBoxEmail.Text))
            {
                int rand = new Random().Next(100000, 999999);
                string newPassword = "bsu" + rand;
                c.resetPassord(newPassword);
                LabelMessage.Visible = true;
                LabelMessage.Text = "Your Password has been reset,Please check your email";
                LabelMessage.ForeColor = System.Drawing.Color.Red;
                sendNotification(c.email, newPassword);


            }
            else
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = "Your username or email is not correct";
                LabelMessage.ForeColor = System.Drawing.Color.Red;

            }
        }

        protected void sendNotification(string email, string newPassword)
        {
            SmtpClient smtpClient = new SmtpClient("smtp.office365.com", 587);
            smtpClient.UseDefaultCredentials = true;
            //YourEmail is actually a company sender’s email; 
            smtpClient.Credentials = new System.Net.NetworkCredential("iyhussein@bsu.edu","IMAali123+&%");
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            MailMessage mail = new MailMessage();

            //Setting From , To and CC
            mail.From = new MailAddress("iyhussein@bsu.edu","bsuPizzaCompany", System.Text.Encoding.UTF8);
            mail.To.Add(new MailAddress(email));
            mail.Subject = "Reset Password";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Your password has been reset as " + newPassword;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            smtpClient.Send(mail);

        }//close sendNotification() method 
        
       
        }
    }
