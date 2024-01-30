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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
        }
        protected void GoToContact(object sender, EventArgs e)
        {

            Response.Redirect("Contact.aspx");

        }
        protected void log_inn(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(UN.Text) || String.IsNullOrEmpty(Pass.Text))
            {
                Label1.Text = "Please fill all fields when adding a club.";
            }
            else {
                String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
                SqlConnection con = new SqlConnection(conS);
                string user = UN.Text;
                string pass = Pass.Text;
                con.Open();
                SqlCommand loginn = new SqlCommand("login", con);
                loginn.CommandType = CommandType.StoredProcedure;
                loginn.Parameters.Add(new SqlParameter("@username", user));
                loginn.Parameters.Add(new SqlParameter("@password", pass));
                SqlParameter outt = loginn.Parameters.Add(new SqlParameter("@type", SqlDbType.VarChar, 80));
                outt.Direction = ParameterDirection.Output;

                loginn.ExecuteNonQuery();
                con.Close();
                Session["Usrname"] = user;
                Session["typo"] = outt;


                string s = Convert.ToString(loginn.Parameters["@type"].Value);

                if (s == "fan")
                {
                   
                    Response.Redirect("Fan.aspx");
                }
                else if (s == "stadium manager")
                {
                    Response.Redirect("Stadium_Manager.aspx");
                }
                else if (s == "club representatives")
                {
                    Response.Redirect("Club_Rep.aspx");
                }
                else if (s == "System Admin")
                {
                    Response.Redirect("SystemAdmin.aspx");
                }
                else if(s == "sports association manager")
                {
                    Response.Redirect("SA_Manager.aspx");

                }
                else
                {
                    Label1.Text = "Invalid Credentials";
                }
            }
               
        }
        protected void NLogin(object sender, EventArgs e)
        {

        }
        protected void newLogin(object sender, EventArgs e)
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            con.Open();
            String type = "";

            if (String.IsNullOrEmpty(UN.Text) || String.IsNullOrEmpty(Pass.Text))
            {
                Label1.Text = "Please Fill out all Fields";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select * from Fan INNER JOIN SystemUser SU ON Fan.Username = SU.Username where Fan.Username='" + UN.Text.Trim() + "' AND SU.password='" + Pass.Text.Trim() + "'", con);
                SqlDataReader data = cmd.ExecuteReader();
                if (data.HasRows)
                {
                    
                    while (data.Read())
                    {
                        type = "FAN";
                    }
                }
                 cmd = new SqlCommand("select * from Sports_Association_Manager  INNER JOIN SystemUser SU ON Sports_Association_Manager.Username = SU.Username where  Sports_Association_Manager.Username='" + UN.Text.Trim() + "' AND SU.password='" + Pass.Text.Trim() + "'", con);
                 data = cmd.ExecuteReader();

                if (data.HasRows)
                {
                   
                    while (data.Read())
                    {
                        type = "SAM";
                    }
                }
                cmd = new SqlCommand("select * from Stadium_Manager  INNER JOIN SystemUser SU ON Stadium_Manager.Username = SU.Username where Stadium_Manager.Username='" + UN.Text.Trim() + "' AND SU.password='" + Pass.Text.Trim() + "'", con);
                 data = cmd.ExecuteReader();
                if (data.HasRows)
                {
                
                    while (data.Read())
                    {
                        type = "SM";
                    }
                }
                cmd = new SqlCommand("select * from System_Admin INNER JOIN SystemUser SU ON System_Admin.Username = SU.Username where  System_Admin.Username='" + UN.Text.Trim() + "' AND SU.password='" + Pass.Text.Trim() + "'", con);
                data = cmd.ExecuteReader();

                if (data.HasRows)

                {
                    while (data.Read())
                    {
                        type = "SA";

                    }
                }
           
                cmd = new SqlCommand("select * from Club_Representative INNER JOIN SystemUser SU ON Club_Representative.Username = SU.Username where Club_Representative.Username='" + UN.Text.Trim() + "' AND SU.password='" + Pass.Text.Trim() + "'", con);
                 data = cmd.ExecuteReader();
                if (data.HasRows)
                {
                   
                    while (data.Read())
                    {
                        type = "CR";
                        Response.Redirect("Club_Rep.aspx");
                    }
                }
           
            }

            if (type == "FAN")
            {
                Response.Redirect("Fan.aspx");
            }
            else if (type == "SAM")
             {
                Response.Redirect("SA_Manager.aspx");
            }
            else if (type == "SM")
            {
                Response.Redirect("Stadium_Manager.aspx");
            }
            else if(type == "CR")
            {
                Response.Redirect("Club_Rep.aspx");
            }
            else if (type == "SA")
            {
                Response.Redirect("SystemAdmin.aspx");
            }
            else
            {
                Label1.Text = "Invalid credentials";
            }
        }
        protected void reg(object sender, EventArgs e)
        {
            if (listtype.SelectedValue == "Fan")
            {
                Response.Redirect("fan_reg.aspx");
            }
            else if (listtype.SelectedValue == "Sports Association Manager")
            {
                Response.Redirect("SAM_reg.aspx");
            }
            else if (listtype.SelectedValue == "Stadium Manager")
            {
                Response.Redirect("SM_reg.aspx");
            }
            else if (listtype.SelectedValue == "Club Representative")
            {
                Response.Redirect("CR_reg.aspx");
            }
           
            else
            {
                Label1.Text = "Select a User Type To Register As. ";
            }
        }

        protected void Login(object sender, EventArgs e)
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            con.Open();
            if (String.IsNullOrEmpty(UN.Text) || String.IsNullOrEmpty(Pass.Text))
            {
                Label1.Text = "Please Fill out all Fields";
            }
            else
            {
                if (listtype.SelectedValue == "" || listtype.SelectedValue == "Login as a")
                {
                    Label1.Text = "Please Select a User Type";
                }
                else if (listtype.SelectedValue == "Fan")
                {
                    SqlCommand cmd = new SqlCommand("select * from Fan INNER JOIN SystemUser SU ON Fan.Username = SU.Username where Fan.Username='" + UN.Text.Trim() + "' AND SU.password='" + Pass.Text.Trim() + "'", con);
                    SqlDataReader data = cmd.ExecuteReader();
                    if (data.HasRows)
                    {
                       
                        while (data.Read())
                        {
                            Response.Redirect("Fan.aspx");
                        }
                    }
                    else
                    {
                        Label1.Text = "Invalid credentials";
                    }
                }
                else if (listtype.SelectedValue == "Sports Association Manager")
                {
                    SqlCommand cmd = new SqlCommand("select * from Sports_Association_Manager  INNER JOIN SystemUser SU ON Sports_Association_Manager.Username = SU.Username where  Sports_Association_Manager.Username='" + UN.Text.Trim() + "' AND SU.password='" + Pass.Text.Trim() + "'", con);
                    SqlDataReader data = cmd.ExecuteReader();

                    if (data.HasRows)
                    {
                        while (data.Read())
                        {
                            Response.Redirect("SA_Manager.aspx");
                        }
                    }
                    else
                    {
                        Label1.Text = "Invalid credentials";
                    }

                }
                else if (listtype.SelectedValue == "Stadium Manger")
                {
                    SqlCommand cmd = new SqlCommand("select * from Stadium_Manager  INNER JOIN SystemUser SU ON Stadium_Manager.Username = SU.Username where Stadium_Manager.Username='" + UN.Text.Trim() + "' AND SU.password='" + Pass.Text.Trim() + "'", con);
                    SqlDataReader data = cmd.ExecuteReader();
                    if (data.HasRows)
                    {
                        while (data.Read())
                        {
                            Response.Redirect("Stadium_Manager.aspx");
                        }
                    }
                    else
                    {
                        Label1.Text = "Invalid credentials";
                    }

                }
                else if(listtype.SelectedValue == "Club Representative")
                {
                    SqlCommand cmd = new SqlCommand("select * from Club_Representative INNER JOIN SystemUser SU ON Club_Representative.Username = SU.Username where Club_Representative.Username='" + UN.Text.Trim() + "' AND SU.password='" + Pass.Text.Trim() + "'", con);
                    SqlDataReader data = cmd.ExecuteReader();
                    if (data.HasRows)
                    {
                        while (data.Read())
                        {
                            Response.Redirect("Club_Rep.aspx");
                        }
                    }
                    else
                    {
                        Label1.Text = "Invalid credentials";
                    }
                }
                else if (listtype.SelectedValue == "System Admin")
                {
                    SqlCommand cmd = new SqlCommand("select * from System_Admin INNER JOIN SystemUser SU ON System_Admin.Username = SU.Username where  System_Admin.Username='" + UN.Text.Trim() + "' AND SU.password='" + Pass.Text.Trim() + "'", con);
                    SqlDataReader data = cmd.ExecuteReader();
                    Label1.Text = "FIRST";
                    if (data.HasRows)

                    {
                        
                  

                        while (data.Read())
                        {
                            Response.Redirect("SystemAdmin.aspx");

                        }
                    }
                    else
                    {
                        Label1.Text = "Invalid credentials";
                    }
                }
                
            }
        }

        protected void GoToRegister(object sender, EventArgs e)
        {
           

        }
    }
}

