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
    public partial class Club_Rep
        : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void allClubs(object sender, EventArgs e)
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            if (string.IsNullOrEmpty(club_rep_id.Text))
            {
                Label1.Text = "Please fill all fields.";
            }
            else
            {
                string clubrepid = club_rep_id.Text.ToString();

                con.Open();
                SqlCommand add = new SqlCommand("club_info", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@clubrep_id", clubrepid));
                SqlDataReader r = add.ExecuteReader();
                GridView1.DataSource = r;
                GridView1.DataBind();
                con.Close();
                con.Open();
                add.ExecuteNonQuery();
                con.Close();
            }
        }
        protected void upcomingmatches(object sender, EventArgs e)
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            if (string.IsNullOrEmpty(crep_username.Text))
            {
                Label1.Text = "Please fill all fields.";
            }
            else
            {
                string club_name = TextBox2.Text;
                string club_rep = crep_username.Text;
                con.Open();
                SqlCommand add = new SqlCommand("UP_matches", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add("@club_name", club_name);
                add.Parameters.Add("@clubrep_username", club_rep);
                SqlDataReader r = add.ExecuteReader();

                if (r.HasRows)
                {
                    while (r.Read())
                    {
                        GridView3.DataSource = r;
                        GridView3.DataBind();
                    }
                }


                con.Close();
                con.Open();
                add.ExecuteNonQuery();
                con.Close();
            }
        }
        protected void allstadiums(object sender, EventArgs e)
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            if (string.IsNullOrEmpty(date.Text))
            {
                Label1.Text = "Please fill all fields.";
            }
            else
            {
                DateTime name = DateTime.Parse(date.Text);
                con.Open();
                SqlCommand add = new SqlCommand("available_stadiums", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@date", name));
                SqlDataReader r = add.ExecuteReader();
                GridView2.DataSource = r;
                GridView2.DataBind();
                con.Close();
                con.Open();
                add.ExecuteNonQuery();
                con.Close();
            }

        }
        protected void addhostrequest(object sender, EventArgs e)
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            if (string.IsNullOrEmpty(club_namee.Text) || string.IsNullOrEmpty(TextBox1.Text) ||
                  string.IsNullOrEmpty(TextBox4.Text) || string.IsNullOrEmpty(TextBox3.Text))
            {
                Label1.Text = "Please fill all fields.";
            }
            else
            {
                string club_name = club_namee.Text.ToString();
                string stadium_name = TextBox1.Text.ToString();
                string clubrep_username = TextBox4.Text.ToString();
                DateTime name = DateTime.Parse(TextBox3.Text);
                con.Open();
                SqlCommand add = new SqlCommand("addHostRequest", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add("@club_name", club_name);
                add.Parameters.Add("@stadium_name", stadium_name);
                add.Parameters.Add("@clubRep_username", clubrep_username);
                add.Parameters.Add("@start_time", name);
                Label1.Text = "the request id added!";


            }
        }

    }
}

  