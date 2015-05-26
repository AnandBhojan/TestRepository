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
    
    public partial class JenkinsCI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopulateProjectNamesJenkins();
                GetJenkinsBuildHistory();
                //GetBuildHistoryfromCI();
            }
        }

        private void PopulateProjectNamesJenkins()
        {
            List<string> projectNames = new List<string>();
            projectNames.Add("CI-SP");
            projectNames.Add("SharePointBuild");


            foreach (string projectName in projectNames)
            {
                ddlProjects.Items.Add(projectName);
            }

        }

        private void GetJenkinsBuildHistory()
        {
            List<string> CIServerList = new List<string>();
            DataTable table = new DataTable();
            string[] arrval = new string[6];
            table.Columns.Add("Build Info.", typeof(string));
            table.Columns.Add("BuildNumber", typeof(string));
            table.Columns.Add("Description", typeof(string));
            table.Columns.Add("Status", typeof(string));
            table.Columns.Add("Date", typeof(string));
            table.Columns.Add("Url", typeof(string));
            int j = 0;
            foreach (var file in Directory.EnumerateFiles(@"C:\\XML\\"+ddlProjects.SelectedValue+"\\", "*.xml"))
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
                table.Rows.Add(arrval[0],arrval[3], arrval[1], arrval[4], arrval[2], arrval[5]);
            }

            bindCommitsHistoryToWebpageJenkins(table);
        }


        private void bindCommitsHistoryToWebpageJenkins(DataTable citable)
        {

            gridViewJenkins.DataSource = citable;
            gridViewJenkins.DataBind();           

        }
        

        protected void ddlProjectsJenkins_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetJenkinsBuildHistory();
        }
    }
}