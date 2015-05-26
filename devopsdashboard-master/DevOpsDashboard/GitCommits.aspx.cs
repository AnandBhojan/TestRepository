using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using RestSharp;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;
using System.Data;
using System.Drawing;

namespace DevOpsDashboard
{
    public partial class GitCommits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                populateProjectNamesddl();
                getCommitHistoryfromGIT();
            }

        }


        private void populateProjectNamesddl()
        {
            List<string> projectNames = new List<string>();
            projectNames.Add("test");
            projectNames.Add("devopsdashboard");


            foreach (string projectName in projectNames)
            {
                ddlProjects.Items.Add(projectName);
            }

        }


      
        private  void getCommitHistoryfromGIT()
        {

            var client = new RestClient("https://api.github.com/");
            string repositoryName = "repos/narthka/" + ddlProjects.SelectedValue + "/commits";
            client.Authenticator = new SimpleAuthenticator("username", "narthka", "password", "wipro@123");

            //  var request = new RestRequest("orgs/emcconsulting/repos", Method.GET);
            var request = new RestRequest(repositoryName, Method.GET);
            // var request = new RestRequest("repos/narthka/test/commits/171a1cc3173b44e9c7b521e268f23c294215ee3b", Method.GET);
            var response = client.Execute(request);
            var responsecontent = response.Content;
            deserializeGITCommitsResponse(responsecontent);

        }
        
        

        private void deserializeGITCommitsResponse(string responsecontent)
        {

            var commitsList = JsonConvert.DeserializeObject<dynamic>(responsecontent);

            if (commitsList != null && commitsList.Count > 0)
            {


                CommitDetails CommitDetailsRec = new CommitDetails();
                List<CommitDetails> CommitDetailsList = new List<CommitDetails>();

                for (int i = 0; i < commitsList.Count; i++)
                {
                    CommitDetailsRec = new CommitDetails();

                    var commitmessage = commitsList[i].commit.message.Value;
                    var commitername = commitsList[i].commit.committer.name.Value;
                    //var commiteremail = commitsList[i].commit.committer.email.Value;
                    var commitdate = commitsList[i].commit.committer.date.Value;

                    CommitDetailsRec.Name = commitername;
                    // CommitDetailsRec.Email = commiteremail;
                    CommitDetailsRec.Date = commitdate.ToString();
                    CommitDetailsRec.Message = commitmessage;

                    CommitDetailsList.Add(CommitDetailsRec);
                }

                bindCommitsHistoryToWebpage(CommitDetailsList);
            }

            else
            {
              //  GitHistorylabel.InnerText = "No Commit History Available";
            }



        }
        private void bindCommitsHistoryToWebpage(List<CommitDetails> CommitDetailsList)
        {

            gridViewGITHistory.DataSource = CommitDetailsList;
            gridViewGITHistory.DataBind();
            gridViewGITHistory.HeaderStyle.BackColor = System.Drawing.Color.Navy;
            gridViewGITHistory.HeaderRow.ForeColor = System.Drawing.Color.White;
            gridViewGITHistory.RowStyle.HorizontalAlign = HorizontalAlign.Left;
            gridViewGITHistory.RowStyle.BackColor = System.Drawing.Color.White;

            //gridViewGITHistory.BorderStyle = BorderStyle.None;
            // gridViewGITHistory.RowStyle.BorderStyle = BorderStyle.None;

        }

        protected void ddlProjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCommitHistoryfromGIT();
        }

    }
}