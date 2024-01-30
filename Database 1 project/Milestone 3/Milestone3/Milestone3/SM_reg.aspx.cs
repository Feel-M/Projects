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
    public partial class SM_reg : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void addStadiumManager(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(SAname.Text) || string.IsNullOrEmpty(SApassword.Text) || string.IsNullOrEmpty(SAusername.Text) || string.IsNullOrEmpty(SAstadium.Text))
            {
                Label1.Text = "Please fill all fields.";
            }
            else
            {
                String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
                SqlConnection con = new SqlConnection(conS);

                string usernn = SAusername.Text.ToString();
                SqlCommand check = new SqlCommand("checksm_username", con);
                check.CommandType = CommandType.StoredProcedure;

                check.Parameters.AddWithValue("@sm_username", usernn);
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
                    string name = SAname.Text.ToString();
                    string usern = SAusername.Text.ToString();
                    string pass = SApassword.Text.ToString();
                    string stadiumName = SAstadium.Text.ToString();
                    con.Open();
                    SqlCommand add = new SqlCommand("addStadiumManager", con);
                    add.CommandType = CommandType.StoredProcedure;
                    add.Parameters.Add(new SqlParameter("@name", name));
                    add.Parameters.Add(new SqlParameter("@s_name", stadiumName));
                    add.Parameters.Add(new SqlParameter("@userName", usern));
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