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
    public partial class fan_reg : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void addFan(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(fanname.Text) || string.IsNullOrEmpty(fanusername.Text) || string.IsNullOrEmpty(fanpassword.Text) || string.IsNullOrEmpty(Faddress.Text) || string.IsNullOrEmpty(Bdate.Text) || string.IsNullOrEmpty(Nid.Text) || string.IsNullOrEmpty(Pnum.Text))
            {
                Label1.Text = "Please fill all fields when adding a club.";
            }
            else
            {
                String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
                SqlConnection con = new SqlConnection(conS);

                string usern = fanusername.Text.ToString();
                SqlCommand check = new SqlCommand("checkF_usernaame", con);
                check.CommandType = CommandType.StoredProcedure;

                check.Parameters.AddWithValue("@f_username", usern);
                SqlParameter outt2 = check.Parameters.Add("@check", SqlDbType.VarChar, 80);
                outt2.Direction = ParameterDirection.Output;
                //string s = Convert.ToString(check.Parameters["@check"].Value);

                con.Open();
                check.ExecuteNonQuery();
                con.Close();

                string n_idd = Nid.Text.ToString();
                SqlCommand checkid = new SqlCommand("check_n_id", con);
                checkid.CommandType = CommandType.StoredProcedure;

                checkid.Parameters.AddWithValue("@n_id", n_idd);
                SqlParameter outt3 = checkid.Parameters.Add("@checkid", SqlDbType.VarChar, 80);
                outt3.Direction = ParameterDirection.Output;
                // string s2 = Convert.ToString(checkid.Parameters["@checkid"].ToString());

                con.Open();
                checkid.ExecuteNonQuery();
                con.Close();

                if (outt2.Value.ToString() == "false")
                {
                    Response.Write("this username already exits");
                }
                else if (outt3.Value.ToString() == "false")
                {
                    Response.Write("this n_id already exits");

                }
                else
                {
                    string name = fanname.Text.ToString();
                    string usern2 = fanusername.Text.ToString();
                    string pass = fanpassword.Text.ToString();
                    string n_id = Nid.Text.ToString();
                    string phoneNo = Pnum.Text.ToString();
                    string bdate = Bdate.Text.ToString();
                    string adresss = Faddress.Text.ToString();

                    SqlCommand add = new SqlCommand("addFan", con);
                    add.CommandType = CommandType.StoredProcedure;

                    add.Parameters.Add(new SqlParameter("@name", name));
                    add.Parameters.Add(new SqlParameter("@username", usern));
                    add.Parameters.Add(new SqlParameter("@password", pass));
                    add.Parameters.Add(new SqlParameter("@N_id", n_id));
                    add.Parameters.Add(new SqlParameter("@phoneNumber", phoneNo));
                    add.Parameters.Add(new SqlParameter("@birthdate", bdate));
                    add.Parameters.Add(new SqlParameter("@Address", adresss));
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
}