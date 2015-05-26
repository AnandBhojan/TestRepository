<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobHistory.aspx.cs" Inherits="DevOpsDashboard.JobHistory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Job History</title>
    <meta http-equiv="refresh" content="30">
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet" />
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet" />
    <link href="data/styles.css" type="text/css" rel="stylesheet" />
    <link href="files/dasboard/styles.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="Jquery/jquery-ui.js"></script>
    <script type="text/javascript" src="Jquery/jquery-ui.min.js"></script>
    <link href="StyleSheets/jquery-ui.css" type="text/css" rel="stylesheet" />

    <style>
        .bar {
            border-style: none !important;
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="StyleSheets/jquery-ui.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">

        $(function () {
            $("#dvAccordian").accordion({
                autoHeight: false
            });
        });
    </script>


   
</head>

<body>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <asp:HiddenField ID="hdnval" Value="0" runat="server" />
        <div style="vertical-align: middle; text-align: center; font-family: Calibri; font-size: x-large; font-weight: 400; color: #000000;" aria-atomic="False">
            <strong>JENKINS DASHBOARD
            </strong>
            <br />
            <br />
        </div>
        <div id="dvAccordian" style="font-family: Calibri;">
            <h3>ALL JOBS</h3>
            <div>
                <table width="100%" style="font-family: Calibri; font-size: 15px">
                    <tr>
                        <td colspan="2" height="20px"></td>
                    </tr>
                    <tr style="font-family: Calibri; font-size: 14px">
                        <td width="20%">Select Job</td>
                        <td width="80%" allign="Right">
                            <asp:DropDownList ID="ddlProjectsJenkins" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProjectsJenkins_SelectedIndexChanged">
                            </asp:DropDownList>
                            <br />
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gridViewJenkins" runat="server" Width="100%" GridLines="None" AutoGenerateColumns="false" CssClass="GridViewStyle">
                                <AlternatingRowStyle BackColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Image runat="server" ID="ImgCatStatus" ImageUrl='<%#Eval("Status").Equals(true) ?"~/images/dasboard/checkmark_64.png" : "~/images/dasboard/error_64.png" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Build Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBuildNo" runat="server" Text='<%# Bind("BuildNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Build Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBuildDuration" runat="server" Text='<%# Bind("BuildOn") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Started By">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBuildstartedBy" runat="server" Text='<%# Bind("StartedBy") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Job Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblJobName" runat="server" Text='<%# Bind("JobName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Artifacts">
                                        <ItemTemplate>
                                            <asp:Label ID="lblArtifacts" runat="server" Text='<%# Bind("Artifacts") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Job URL">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlView" Target="_blank" runat="server" Text="More Details" NavigateUrl='<%# Bind("JobUrl") %>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>

                </table>
            </div>
            <h3>JOB HISTORY</h3>
            <div>

                <table width="100%" style="font-family: Calibri; font-size: 15px">
                    <tr>
                        <td colspan="2" height="20px"></td>
                    </tr>
                    <%-- <tr style="font-family: Calibri; font-size: 14px">
                        <td width="20%">Select Job</td>
                        <td width="80%" allign="Right">
                            <asp:DropDownList ID="ddljobs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddljobs_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>--%>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">

                            <asp:GridView ID="grdJobHistory" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="GridViewStyle" OnRowDataBound="grdJobHistory_RowDataBound">
                                <AlternatingRowStyle BackColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Image runat="server" ID="ImgCatStatus" ImageUrl='<%#Eval("Status").Equals(true) ?"~/images/dasboard/checkmark_64.png" : "~/images/dasboard/error_64.png" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Build Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBuildNo" runat="server" Text='<%# Bind("BuildNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Build Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBuildDuration" runat="server" Text='<%# Bind("BuildOn") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Started By">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBuildstartedBy" runat="server" Text='<%# Bind("StartedBy") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Job Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblJobName" runat="server" Text='<%# Bind("JobName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Artifacts">
                                        <ItemTemplate>
                                            <asp:Label ID="lblArtifacts" runat="server" Text='<%# Bind("Artifacts") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Job URL">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlView" Target="_blank" runat="server" Text="More Details" NavigateUrl='<%# Bind("JobUrl") %>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr style="font-family: Calibri; font-size: 14px">
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <h3>GRAPHS</h3>
            <div width="100%" id="divChart" runat="server" style="vertical-align: middle; text-align: center; font-family: Calibri; font-size: small; border: 1px solid Black">
                <table width="100%">
                    <tr>
                        <td style="width: 75%">
                            <cc1:BarChart ID="BarChart1" BorderStyle="None" CssClass="bar" runat="server" ChartHeight="500" ChartWidth="700"
                                ChartType="Column" ChartTitleColor="#CCCCCC" Visible="true" ValueAxisLines="10"
                                Height="482px" Width="850px">
                            </cc1:BarChart>
                            <br />
                        </td>
                        <td style="width: 25%; vertical-align: top">
                            <table style="width: 100%" border="1">
                                <tr>
                                    <td colspan="2" style="text-align: center">Legend</td>
                                </tr>
                                <tr>
                                    <td>1 - Success</td>
                                    <td>2 - Failure</td>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <cc1:PieChart ID="piechat1" BorderStyle="None" runat="server" ChartTitleColor="#0E426C" ChartHeight="300" ChartWidth="450"></cc1:PieChart>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>


        </div>
        <div>
            <asp:Button ID="btnbvack" runat="server" Text="Back" OnClick="btnbvack_Click" Width="80px" />

        </div>


    </form>
</body>
</html>
