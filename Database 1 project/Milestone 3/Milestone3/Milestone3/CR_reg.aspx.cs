using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class CR_reg : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void addRepresentative(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(CRusername.Text) || string.IsNullOrEmpty(CRpassword.Text) || string.IsNullOrEmpty(CRname.Text) || string.IsNullOrEmpty(CRclub.Text))
            {
                Label1.Text = "Please fill all fields.";
            }
            else
            {

           
                String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);

            string usernn = CRusername.Text.ToString();
            SqlCommand check = new SqlCommand("checkCR_username", con);
            check.CommandType = CommandType.StoredProcedure;

            check.Parameters.AddWithValue("@cr_username", usernn);
            SqlParameter outt2 = check.Parameters.Add("@check", SqlDbType.VarChar, 80);
            outt2.Direction = ParameterDirection.Output;
            // string s = Convert.ToString(check.Parameters["@check"].Value);

            con.Open();
            check.ExecuteNonQuery();
            con.Close();


            if (outt2.Value.ToString() == "false")
            {
                Response.Write("this username already exits");
            }
            else
            {

                string name = CRname.Text.ToString();
                string usern = CRusername.Text.ToString();
                string pass = CRpassword.Text.ToString();
                string clubName = CRclub.Text.ToString();
                con.Open();
                SqlCommand add = new SqlCommand("addRepresentative", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@Rep_name", name));
                add.Parameters.Add(new SqlParameter("@Club_name", clubName));
                add.Parameters.Add(new SqlParameter("@R_User_name", usern));
                add.Parameters.Add(new SqlParameter("@password", pass));

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
}