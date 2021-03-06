﻿using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace DevOpsDashboard
{
    public partial class JobHistorytab : System.Web.UI.Page
    {
        string strjenkinsURL = ConfigurationManager.AppSettings["AllJobURL"].ToString();
        string strJobURL = ConfigurationManager.AppSettings["JobURL"].ToString();
        string strAPI = ConfigurationManager.AppSettings["LastBuildApi"].ToString();

        string strExtension = "/api/xml";
        Common oCommon = new Common();
        System.Net.WebClient client = new System.Net.WebClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopulateProjectNamesJenkins();
                BindJobDetails();
                BindEmptyTable();
                populateProjectNamesddl();
                getCommitHistoryfromGIT();
            }
        }


        private void PopulateProjectNamesJenkins()
        {

            List<string> strJobs = oCommon.PopulateProjectNamesJenkins();
            ddlProjectsJenkins.DataSource = strJobs;
            ddlProjectsJenkins.DataBind();
            ddlProjectsJenkins.Items.Insert(0, "-ALL-");
        }


        private void BindJobDetails()
        {
            List<string> strJobs = new List<string>();
            DataTable dtTable = CreateDataTable();
            System.Net.WebClient client = new System.Net.WebClient();
            client.Headers[HttpRequestHeader.ContentType] = "application/json";
            client.BaseAddress = strjenkinsURL;
            if (ddlProjectsJenkins.SelectedValue != "-ALL-")
            {
                string strResponse = client.DownloadString(strJobURL + ddlProjectsJenkins.SelectedItem.Value + strAPI);
                dtTable = oCommon.GetJobdetails(dtTable, strResponse);

            }
            else
            {
                foreach (ListItem jobitems in ddlProjectsJenkins.Items)
                {
                    if (jobitems.Value != "-ALL-")
                    {
                        string strResponse = client.DownloadString(strJobURL + jobitems.Value + strAPI);
                        dtTable = oCommon.GetJobdetails(dtTable, strResponse);
                    }
                }
            }

            gridViewJenkins.DataSource = dtTable;
            gridViewJenkins.DataBind();
        }

        private DataTable CreateDataTable()
        {
            DataTable dtTable = new DataTable();
            dtTable.Columns.Add("BuildNumber", typeof(string));
            dtTable.Columns.Add("BuildOn", typeof(string));
            dtTable.Columns.Add("StartedBy", typeof(string));
            dtTable.Columns.Add("Status", typeof(bool));
            dtTable.Columns.Add("JobName", typeof(string));
            dtTable.Columns.Add("Artifacts", typeof(string));
            dtTable.Columns.Add("JobUrl", typeof(string));
            return dtTable;
        }

        protected void ddlProjectsJenkins_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindJobDetails();
            DataTable dtTable = BindonLoad();
            if (dtTable.Rows.Count > 0)
            {
                grdJobHistory.DataSource = dtTable;
                grdJobHistory.DataBind();
                divChart.Visible = true;
                GetChartData(dtTable);
            }
            else
            {
                BindEmptyTable();

            }

        }
        private void BindEmptyTable()
        {
            DataTable dtTable = CreateDataTable();
            dtTable.Rows.Add(dtTable.NewRow());
            grdJobHistory.DataSource = dtTable;
            grdJobHistory.DataBind();
            int columncount = grdJobHistory.Rows[0].Cells.Count;
            grdJobHistory.Rows[0].Cells.Clear();
            grdJobHistory.Rows[0].Cells.Add(new TableCell());
            grdJobHistory.Rows[0].Cells[0].ColumnSpan = columncount;
            grdJobHistory.Rows[0].Cells[0].Text = "No Records Found";
            divChart.Visible = false;
        }


        public void GetChartData(DataTable dt)
        {
            StringBuilder str = new StringBuilder();
            str.Append(@"<script type='text/javascript'> google.load('visualization', '1', {'packages':['motionchart']});

                google.setOnLoadCallback(drawChart); function drawChart() { var data = new google.visualization.DataTable();

                data.addColumn('string', 'product');

                data.addColumn('number', 'sales');

                data.addColumn('number', 'expenses');

                data.addColumn('string', 'location');

                data.addRows([");


           int count = dt.Rows.Count - 1;
            for (int i = 0; i <= count; i++)
            {
                if (i == count)
                {
                    str.Append("['" + "1" + " aaa" + ", " +"111" + ", '" + dt.Rows[i]["location"].ToString() + "']");

                }
                else
                {
                    str.Append("['" + dt.Rows[i]["product"].ToString() + "', new Date (" + dt.Rows[i]["date"].ToString() + "), " + dt.Rows[i]["sales"].ToString() + ", " + dt.Rows[i]["expenses"].ToString() + ", '" + dt.Rows[i]["location"].ToString() + "'],");
                }

            }



            str.Append(" ]);");

            str.Append("  var chart = new google.visualization.MotionChart(document.getElementById('chart_div'));");

            str.Append(" chart.draw(data, {width: 600, height:300}); }");

            str.Append("</script>");

            lt.Text = str.ToString();
        }

        private DataTable BindonLoad()
        {
            DataTable dtTable = new DataTable();
            try
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/json";
                client.BaseAddress = strjenkinsURL;
                dtTable = CreateDataTable();
                if (ddlProjectsJenkins.SelectedValue != "-ALL-")
                {
                    string strResponse = client.DownloadString(strJobURL + ddlProjectsJenkins.SelectedItem.Value + strAPI);
                    int BuildNo = GetBuildNo(strResponse);
                    BindJobHistoryDetails(BuildNo, dtTable);

                }
            }
            catch (Exception ex)
            {

            }
            return dtTable;
        }

        private void BindJobHistoryDetails(int BuildNo, DataTable dtTable)
        {

            int TotalBuild = 0;
            client.Headers[HttpRequestHeader.ContentType] = "application/json";
            client.BaseAddress = strjenkinsURL;
            List<string> strJobs = new List<string>();
            for (int i = BuildNo; i > 0; i--)
            {
                try
                {
                    if (TotalBuild <= 20)
                    {
                        string strResponse = client.DownloadString(strJobURL + ddlProjectsJenkins.SelectedItem.Value + "/" + i + strExtension);
                        dtTable = oCommon.GetJobdetails(dtTable, strResponse);
                        TotalBuild = TotalBuild + 1;
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }



        private int GetBuildNo(string strResponse)
        {
            XmlDocument xml = new XmlDocument();
            xml.LoadXml(strResponse);
            int BuildID = Convert.ToInt32(xml.FirstChild["id"].InnerText);
            return BuildID;
        }

        protected void btnbvack_Click(object sender, EventArgs e)
        {
            Response.Redirect("DashBoard.aspx", true);
        }

        private void populateProjectNamesddl()
        {
            List<string> projectNames = new List<string>();
            projectNames.Add("WordPress");
            foreach (string projectName in projectNames)
            {
                ddlProjects.Items.Add(projectName);
            }

        }

        private void getCommitHistoryfromGIT()
        {

            var client = new RestClient("https://api.github.com/");
            string repositoryName = "repos/DevOpsTestAdmin/" + ddlProjects.SelectedValue + "/commits";
            client.Authenticator = new SimpleAuthenticator("username", "devopstestadmin", "password", "password2015");
            var request = new RestRequest(repositoryName, Method.GET);
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
                    var commitdate = commitsList[i].commit.committer.date.Value;
                    CommitDetailsRec.Name = commitername;
                    CommitDetailsRec.Date = commitdate.ToString();
                    CommitDetailsRec.Message = commitmessage;
                    CommitDetailsList.Add(CommitDetailsRec);
                }
                bindCommitsHistoryToWebpage(CommitDetailsList);
            }
        }

        private void bindCommitsHistoryToWebpage(List<CommitDetails> CommitDetailsList)
        {

            gridViewGITHistory.DataSource = CommitDetailsList;
            gridViewGITHistory.DataBind();
        }

        protected void ddlProjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCommitHistoryfromGIT();
        }
    }
}