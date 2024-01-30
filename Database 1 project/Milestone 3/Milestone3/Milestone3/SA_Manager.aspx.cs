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
    public partial class SA_Manager : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void viewPlayedMatches(object sender, EventArgs e)        //SQL View working
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            con.Open();

            SqlCommand played_info = new SqlCommand("SELECT * from playedMatches", con);
            SqlDataReader r = played_info.ExecuteReader();
            GridViewPlayed.DataSource = r;
            GridViewPlayed.DataBind();

            con.Close();

        }
        protected void viewUpcomingMatches(object sender, EventArgs e)  //SQL View working
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            con.Open();

            SqlCommand upcoming_info = new SqlCommand("SELECT * from upcomingMatches", con);
            SqlDataReader r = upcoming_info.ExecuteReader();
            if (r.HasRows == true)
            {
                Label1.Text = "working";

                while (r.Read())
                {
                    GridViewUpcoming.DataSource = r;
                    GridViewUpcoming.DataBind();
                }
            }
            else
            {
                Label1.Text = "not working";
            }

            con.Close();

        }
        protected void viewclubsNeverMatched(object sender, EventArgs e)        //SQL View working
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            con.Open();

            SqlCommand clubs_info = new SqlCommand("SELECT * from clubsNeverMatched", con);
            SqlDataReader r = clubs_info.ExecuteReader();
            if (r.HasRows == true)
            {
                while (r.Read())
                {
                    GridView3.DataSource = r;
                    GridView3.DataBind();
                }
            }

            con.Close();

        }
        protected void DeleteMatch(object sender, EventArgs e)
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            if (String.IsNullOrEmpty(TextBox5.Text) || String.IsNullOrEmpty(TextBox6.Text) || String.IsNullOrEmpty(TextBox7.Text) || String.IsNullOrEmpty(TextBox8.Text))
            {
                Label1.Text = "Please fill all fields when Deleting a match.";
            }
            else
            {
                String Hname = TextBox5.Text.ToString();
                String Gname = TextBox6.Text.ToString();
                String sTime = TextBox7.Text.ToString();
                String eTime = TextBox8.Text.ToString();


                SqlCommand add = new SqlCommand("deleteMatch", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Clear();
                add.Parameters.Add(new SqlParameter("@Host_Club_Name", Hname));
                add.Parameters.Add(new SqlParameter("@Guest_club_name", Gname));
                add.Parameters.Add(new SqlParameter("@Start_time", sTime));
                add.Parameters.Add(new SqlParameter("@End_time", eTime));


                con.Open();
                add.ExecuteNonQuery();
                con.Close();

                Label1.Text = "Match Deleted successfully";
            }
        }
        protected void addNewMatch(object sender, EventArgs e)
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            if (String.IsNullOrEmpty(TextBox1.Text) || String.IsNullOrEmpty(TextBox2.Text) || String.IsNullOrEmpty(TextBox3.Text) || String.IsNullOrEmpty(TextBox4.Text))
            {
                Label1.Text = "Please fill all fields when adding a match.";
            }
            else
            {
                String Hname = TextBox1.Text.ToString();
                String Gname = TextBox2.Text.ToString();
                String sTime = TextBox3.Text.ToString();
                String eTime = TextBox4.Text.ToString();



                SqlCommand add = new SqlCommand("addNewMatch", con);
                add.CommandType = CommandType.StoredProcedure;

                add.Parameters.Add(new SqlParameter("@Host_Club_Name", Hname));
                add.Parameters.Add(new SqlParameter("@Guest_club_name", Gname));
                add.Parameters.Add(new SqlParameter("@Start_time", sTime));
                add.Parameters.Add(new SqlParameter("@end_time", eTime));



                con.Open();
                add.ExecuteNonQuery();
                con.Close();

                Label1.Text = "Match Added Successfully";
            }
        }
        protected void GoTo(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");

        }
    }
}
