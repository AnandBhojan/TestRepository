using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Xml;
using System.Web.Services;

namespace DevOpsDashboard
{
    public class Common
    {
        string strjenkinsURL = "http://localhost:8080/api/xml";
        public List<string> PopulateProjectNamesJenkins()
        {
            List<string> strJobs = new List<string>();
            System.Net.WebClient client = new System.Net.WebClient();
            client.Headers[HttpRequestHeader.ContentType] = "application/json";
            client.BaseAddress = strjenkinsURL;
            string strResponse = client.DownloadString(strjenkinsURL);
            XmlDocument xml = new XmlDocument();
            xml.LoadXml(strResponse); // suppose that myXmlString contains "<Names>...</Names>"

            XmlNodeList xnList = xml.SelectNodes("/hudson/job");
            foreach (XmlNode xn in xnList)
            {
                strJobs.Add(xn["name"].InnerText);
            }
            return strJobs;
        }

        public DataTable GetJobdetails(DataTable dtTable, string strResponse)
        {

            XmlDocument xml = new XmlDocument();
            xml.LoadXml(strResponse);
            string strBuild = xml.FirstChild["id"].InnerText;
            string strStartedBy = string.Empty;
            string strArtifacts = string.Empty;
            XmlNodeList xnList = xml.SelectNodes("/freeStyleBuild/action/cause");
            foreach (XmlNode xn in xnList)
            {
                strStartedBy =  xn["userName"].InnerText + string.Empty;
            }
            XmlNodeList xnArtifacts = xml.SelectNodes("/freeStyleBuild/changeSet/item/path");
            foreach (XmlNode xn in xnList)
            {
                strArtifacts =  xn["file"] != null ? xn["file"].InnerText : string.Empty;
            }

            bool bStatus = xml.FirstChild["result"].InnerText == "SUCCESS" ? true : false;
            String strFullName = xml.FirstChild["fullDisplayName"].InnerText;
            string strURL = xml.FirstChild["url"].InnerText;
            Int64 timeStamp = Convert.ToInt64(xml.FirstChild["timestamp"].InnerText);
            DateTime dtBuldtime = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(Math.Round(timeStamp / 1000d)).ToLocalTime();
            string strDate = dtBuldtime.ToString("F");

            dtTable.Rows.Add(strBuild, strDate, strStartedBy, bStatus, strFullName,strArtifacts, strURL );
            return dtTable;
        }
        public int JobNo { get; set; }
        public string Status { get; set; }
    }
}