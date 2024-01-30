using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace Milestone3
{
    public partial class SAM_reg : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void reg(object sender, EventArgs e)
        {
        }

        protected void addAssociationManager(object sender, EventArgs e)              //WORKING
        {
            var conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            var con = new SqlConnection(conS);

            if (string.IsNullOrEmpty(SAMname.Text) || string.IsNullOrEmpty(SAMusername.Text) || string.IsNullOrEmpty(SAMpassword.Text))
            {
                Label1.Text = "Please make sure to fill all required fields";
            }
            else
            {
                var name = SAMname.Text.ToString();
                var username = SAMusername.Text.ToString();
                var password = SAMpassword.Text.ToString();

                var add = new SqlCommand("addAssociationManager", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@name", name));
                add.Parameters.Add(new SqlParameter("@user_name", username));
                add.Parameters.Add(new SqlParameter("@password", password));

                con.Open();
                add.ExecuteNonQuery();
                con.Close();

                
                Label1.Text = "Account added!";
                System.Threading.Thread.Sleep(500);
                Label1.Text = "You will be redirected in...3";
                System.Threading.Thread.Sleep(1000);
                Label1.Text = "You will be redirected in...2";
                System.Threading.Thread.Sleep(1000);
                Label1.Text = "You will be redirected in...1";
                System.Threading.Thread.Sleep(500);
                Response.Redirect("Default.aspx");
            }
        }
    }
}