using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace Milestone3
{
    public partial class SystemAdmin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddClub(object sender, EventArgs e)
        {
            var conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            var con = new SqlConnection(conS);

            if (string.IsNullOrEmpty(add_cname.Text) || string.IsNullOrEmpty(add_cl.Text))
            {
                Label1.Text = "Please fill all fields when adding a club.";
            }
            else
            {
                var name = add_cname.Text.ToString();
                var loc = add_cl.Text.ToString();

                var add = new SqlCommand("addClub", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@Club_name", name));
                add.Parameters.Add(new SqlParameter("@club_location", loc));

                con.Open();
                add.ExecuteNonQuery();
                con.Close();

                Label1.Text = "Club Added!";
            }
        }

        protected void DeleteClub(object sender, EventArgs e)
        {
            var conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            var con = new SqlConnection(conS);

            if (string.IsNullOrEmpty(d_cname.Text))
            {
                Label1.Text = "Please fill all fields when Deleting a club.";
            }
            else
            {
                var name = d_cname.Text.ToString();

                var add = new SqlCommand("deleteClub", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@Club_name", name));

                con.Open();
                add.ExecuteNonQuery();
                con.Close();

                Label1.Text = "Club Deleted!";
            }
        }

        protected void AddStadium(object sender, EventArgs e)
        {
            var conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            var con = new SqlConnection(conS);

            if (string.IsNullOrEmpty(add_sname.Text) || string.IsNullOrEmpty(add_sl.Text) || string.IsNullOrEmpty(add_sc.Text))
            {
                Label1.Text = "Please fill all fields when adding a Stadium.";
            }
            else
            {
                var name = add_sname.Text.ToString();
                var loc = add_sl.Text.ToString();
                var cap = int.Parse(add_sc.Text);

                var add = new SqlCommand("addStadium", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@stadium_name", name));
                add.Parameters.Add(new SqlParameter("@Stadium_location", loc));
                add.Parameters.Add(new SqlParameter("@Stadium_capacity ", cap));

                con.Open();
                add.ExecuteNonQuery();
                con.Close();

                Label1.Text = "Stadium Added!";
            }
        }

        protected void DeleteStadium(object sender, EventArgs e)
        {
            var conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            var con = new SqlConnection(conS);

            if (string.IsNullOrEmpty(d_sname.Text))
            {
                Label1.Text = "Please fill all fields when Deleting a Stadium.";
            }
            else
            {
                var name = d_sname.Text.ToString();

                var add = new SqlCommand("deleteStadium", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@name", name));

                con.Open();
                add.ExecuteNonQuery();
                con.Close();

                Label1.Text = "Stadium Deleted!";
            }
        }

        protected void Bfan(object sender, EventArgs e)
        {
            var conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            var con = new SqlConnection(conS);

            if (string.IsNullOrEmpty(F_id.Text))
            {
                Label1.Text = "Please fill all fields when blocking a fan.";
            }
            else
            {
                var ID = F_id.Text.ToString();

                var add = new SqlCommand("blockFan", con);
                add.CommandType = CommandType.StoredProcedure;
                add.Parameters.Add(new SqlParameter("@id ", ID));

                con.Open();
                add.ExecuteNonQuery();
                con.Close();

                Label1.Text = "Fan Blocked!";
            }
        }
    }
}