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
using System.Xml;

namespace DevOpsDashboard
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string strjenkinsURL = "http://localhost:8080/api/xml";
        string strJobURL = "http://localhost:8080/job/";
        string strAPI = "/lastBuild/api/xml";
        Common oCommon = new Common();
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
            projectNames.Add("WordPress");
            //projectNames.Add("devopsdashboard");
            foreach (string projectName in projectNames)
            {
                ddlProjects.Items.Add(projectName);
            }

        }


        private void getCommitHistoryfromGIT()
        {

            var client = new RestClient("https://api.github.com/");
            //string repositoryName = "repos/narthka/" + ddlProjects.SelectedValue + "/commits";
            string repositoryName = "repos/DevOpsTestAdmin/" + ddlProjects.SelectedValue + "/commits";
            client.Authenticator = new SimpleAuthenticator("username", "devopstestadmin", "password", "password2015");

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

                for (int i = 0; i < 10; i++)
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
                // GitHistorylabel.InnerText = "No Commit History Available";
            }



        }
        private void bindCommitsHistoryToWebpage(List<CommitDetails> CommitDetailsList)
        {

            gridViewGITHistory.DataSource = CommitDetailsList;
            gridViewGITHistory.DataBind();


            //gridViewGITHistory.BorderStyle = BorderStyle.None;
            // gridViewGITHistory.RowStyle.BorderStyle = BorderStyle.None;

        }

        protected void ddlProjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCommitHistoryfromGIT();
        }


       
        private void GetJenkinsBuildHistory()
        {
            List<string> CIServerList = new List<string>();
            DataTable table = new DataTable();
            string[] arrval = new string[6];
            table.Columns.Add("Build Info.", typeof(string));
            table.Columns.Add("BuildNumber", typeof(string));
            table.Columns.Add("Description", typeof(string));
            table.Columns.Add("Status", typeof(bool));
            table.Columns.Add("Date", typeof(string));
            table.Columns.Add("Url", typeof(string));
            int j = 0;
            foreach (var file in Directory.EnumerateFiles(@"C:\\DWH\\XML\\" + "CI-SP" + "\\", "*.xml"))
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(file);
                //doc.LoadXml("C:\\XML\\lastbuild.xml");

                int i = 1;
                if (j == 0)
                {
                    arrval[0] = "Last Build";
                }
                if (j == 1)
                {
                    arrval[0] = "Last Failed Build";
                }
                if (j == 2)
                {
                    arrval[0] = "Last Success Build";
                }
                j++;
                foreach (XmlNode node in doc.DocumentElement.ChildNodes)
                {
                    if (node.Name == "action" || node.Name == "number" || node.Name == "id" || node.Name == "result" || node.Name == "url")
                    {
                        if (node.Name == "action")
                        {
                            if (node.FirstChild != null && node.FirstChild.FirstChild.Name == "shortDescription")
                            {
                                arrval[i] = node.FirstChild.FirstChild.InnerText.ToString();
                                i++;
                            }
                        }
                        else
                        {
                            arrval[i] = node.InnerText.ToString();
                            i++;
                        }
                    }

                }
                String MyString = arrval[2].ToString(); // get value from text field
                DateTime MyDateTime = new DateTime();
                MyDateTime = DateTime.ParseExact(MyString, "yyyy-MM-dd_HH-mm-ss", null);
                String MyString_new = MyDateTime.ToString("dd-MMM-yyyy hh:mm:ss tt");
                arrval[2] = MyString_new.ToString();
                table.Rows.Add(arrval[0], arrval[3], arrval[1], arrval[4], arrval[2], arrval[5]);
            }

          
        }
       

        protected void btnNavigate_Click(object sender, EventArgs e)
        {
            Response.Redirect("JobHistory.aspx", true);
        }


    }
}