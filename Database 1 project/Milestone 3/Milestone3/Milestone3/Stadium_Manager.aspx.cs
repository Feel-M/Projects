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
    public partial class Stadium_Manager : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewAllStadiumInfo(object sender, EventArgs e)
        {

            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);

            if (string.IsNullOrEmpty(TextBox10.Text))
            {
                Label1.Text = "Please fill all fields.";
            }
            else
            {
                string stadiummanager = TextBox10.Text.ToString();
                con.Open();
                SqlCommand add = new SqlCommand("allstadiums_m", con);
                add.CommandType = CommandType.StoredProcedure;

                add.Parameters.Add("@sm_username", stadiummanager);

                SqlDataReader r = add.ExecuteReader();
                if (r.HasRows == true)
                    GridView1.DataSource = r;
                GridView1.DataBind();
                con.Close();
                con.Open();
                add.ExecuteNonQuery();
                con.Close();


            }
        }
        protected void recievedRequest(object sender, EventArgs e)
        {

            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            con.Open();

            if (string.IsNullOrEmpty(TextBox9.Text))
            {
                Label1.Text = "Please fill all fields.";
            }
            else
            {
                string username = TextBox9.Text.ToString();
                SqlCommand add = new SqlCommand("pend", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@sm_username", username));
                SqlDataReader rr = add.ExecuteReader();

                if (rr.HasRows == true)
                    GridView2.DataSource = rr;
                GridView2.DataBind();
                con.Close();
                con.Open();
                add.ExecuteNonQuery();
                con.Close();

            }

        }

        protected void acceptrecievedRequest(object sender, EventArgs e)
        {

            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);

            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text) ||
                string.IsNullOrEmpty(TextBox3.Text) || string.IsNullOrEmpty(TextBox4.Text))
            {
                Label1.Text = "Please fill all fields.";
            }
            else
            {

                string usern = TextBox1.Text.ToString();
                string host_club = TextBox2.Text.ToString();
                string guest_club = TextBox3.Text.ToString();
                string start_time = TextBox4.Text.ToString();
                con.Open();
                SqlCommand add = new SqlCommand("acceptRequest", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@Stadium_manager_username", usern));
                add.Parameters.Add(new SqlParameter("@guest_club_name", guest_club));
                add.Parameters.Add(new SqlParameter("@host_club_name", host_club));
                add.Parameters.Add(new SqlParameter("@start_time", start_time));
                add.ExecuteNonQuery();
                con.Close();
                Label1.Text = "the unhandled request is accepted!";

            }
        }
        protected void rejectrecievedRequest(object sender, EventArgs e)
        {

            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text) ||
           string.IsNullOrEmpty(TextBox3.Text) || string.IsNullOrEmpty(TextBox4.Text))
            {
                Label1.Text = "Please fill all fields.";
            }
            else
            {
                string usern = TextBox1.Text.ToString();
                string host_club = TextBox2.Text.ToString();
                string guest_club = TextBox3.Text.ToString();
                DateTime start_time = DateTime.Parse(TextBox4.Text);
                con.Open();
                SqlCommand add = new SqlCommand("rejectRequest", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@Stadium_manager_username", usern));
                add.Parameters.Add(new SqlParameter("@guest_club_name", guest_club));
                add.Parameters.Add(new SqlParameter("@host_club_name", host_club));
                add.Parameters.Add(new SqlParameter("@start_time", start_time));
                add.ExecuteNonQuery();
                con.Close();
                Label1.Text = "the unhandled request is rejected!";
            }
        }
    }
}
