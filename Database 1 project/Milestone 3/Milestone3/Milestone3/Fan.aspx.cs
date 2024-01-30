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
    public partial class Fan : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void view_matches(object sender, EventArgs e)
        {

            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);

            if (string.IsNullOrEmpty(starttime.Text))
            {
                Label1.Text = "Please fill all fields when adding a club.";
            }
            else
            {
                DateTime start_time =DateTime.Parse( starttime.Text);
                con.Open();
                SqlCommand add = new SqlCommand("all_matches", con);
                add.CommandType = CommandType.StoredProcedure;

                add.Parameters.Add(new SqlParameter("@starttime", start_time));

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
        protected void purchase_ticket(object sender, EventArgs e)
        {
            String conS = WebConfigurationManager.ConnectionStrings["M3DB"].ToString();
            SqlConnection con = new SqlConnection(conS);
            if (string.IsNullOrEmpty(n_id.Text) || string.IsNullOrEmpty(gname.Text) ||
                string.IsNullOrEmpty(hname.Text) || string.IsNullOrEmpty(stime.Text))
            {
                Label1.Text = "Please fill all fields when adding a club.";
            }
            else
            {
                string n_iid = n_id.Text.ToString();
                string guest_name = gname.Text.ToString();
                string host_name = hname.Text.ToString();
                string start_time = stime.Text.ToString();

                con.Open();
                SqlCommand add = new SqlCommand("purchaseTicket", con);
                add.CommandType = CommandType.StoredProcedure;

                add.Parameters.Add(new SqlParameter("@national_id", n_iid));
                add.Parameters.Add(new SqlParameter("@guest_name", guest_name));
                add.Parameters.Add(new SqlParameter("@host_name", host_name));
                add.Parameters.Add(new SqlParameter("@start_time", start_time));
                add.ExecuteNonQuery();
                con.Close();
                Label1.Text = "Ticket Purchased!";
            }

        }
        protected void GoTo(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");

        }
    }
}
