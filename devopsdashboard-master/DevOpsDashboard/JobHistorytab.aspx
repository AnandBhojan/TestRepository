<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobHistorytab.aspx.cs" Inherits="DevOpsDashboard.JobHistorytab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head1" runat="server">
    <title>Job History</title>
    <%--  <meta http-equiv="refresh" content="30">--%>
    <link href="StyleSheets/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/jquery-ui.css" type="text/css" rel="stylesheet" />
    <style>
        .bar {
            border-style: none !important;
        }

        .pageview {
            float: left;
            margin: 5px;
            padding: 5px;
            width: 99%;
           
        }

        .gridviews {
            float: left;
            margin: 5px;
            padding: 5px;
            width: 99%;
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <script src="https://github.com/twlikol/GridViewScroll/blob/master/gridviewScroll.min.js" type="text/javascript"></script>
    <script src="Jquery/jquery-ui.min.js"></script>

    <script type="text/javascript">

        $(function () {
            $("#tabs").tabs();
            $("#tabsgit").tabs();
            $("#dvAccordian").accordion({
                autoHeight: false
            });
        });
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div class="pageview">
            <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </cc1:ToolkitScriptManager>
            <div style="vertical-align: middle; text-align: center; font-family: Calibri; font-size: x-large; font-weight: 400; color: #000000;" aria-atomic="False">
                <strong>DEVOPS DASHBOARD
                </strong>
                <br />
                <br />
            </div>
            <div id="dvAccordian" style="font-family: Calibri;">
                <h3>JENKINS</h3>
                <div>
                    <div id="tabs" style="font-family: Calibri;">
                        <ul>
                            <li><a href="#tabs-1">ALL JOBS</a></li>
                            <li><a href="#tabs-2">BUILD HISTORY</a></li>
                            <li><a href="#tabs-3">GRAPHS</a></li>
                        </ul>
                        <div id="tabs-1">

                            <table style="font-family: Calibri; font-size: 15px; width: 100%">
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

                                        <asp:GridView ID="gridViewJenkins" runat="server" Width="99%" GridLines="None" AutoGenerateColumns="false" CssClass="gridviews">
                                            <AlternatingRowStyle BackColor="White" />
                                            <HeaderStyle BackColor="#589DB8" Height="30px" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                            <RowStyle BackColor="#FAFAFA" />

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

                        <div id="tabs-2">

                            <table width="100%" style="font-family: Calibri; font-size: 15px">
                                <tr>
                                    <td colspan="2">
                                        <div style="height: 400px; overflow: auto">
                                            <asp:GridView ID="grdJobHistory" runat="server" Width="99%" GridLines="None"  AutoGenerateColumns="false" CssClass="gridviews">
                                                <AlternatingRowStyle BackColor="White" />
                                                <HeaderStyle BackColor="#589DB8" Height="30px" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                                <RowStyle BackColor="#FAFAFA" />
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
                                        </div>
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

                        <div id="tabs-3">
                            <div width="100%" id="divChart" runat="server" style="height: 400px; overflow: auto; vertical-align: middle; text-align: center; font-family: Calibri; font-size: small; border: 1px solid Black">
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
                    </div>
                </div>
                <h3>GIT</h3>
                <div>
                    <div id="tabsgit" style="font-family: Calibri;">
                        <ul>
                            <li><a href="#tabs-1git">COMMIT DETAILS</a></li>
                            <li><a href="#tabs-2git">GRAPHS</a></li>
                        </ul>
                        <div id="tabs-1git">
                            <div class="gridviews">
                                <table style="font-family: Calibri; font-size: 15px; width: 100%">
                                    <tr>
                                        <td colspan="2" height="20px"></td>
                                    </tr>
                                    <tr style="font-family: Calibri; font-size: 14px">
                                        <td width="20%">Select Project</td>
                                        <td width="80%" allign="Right">
                                            <asp:DropDownList ID="ddlProjects" OnSelectedIndexChanged="ddlProjects_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                            <br />
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2">

                                            <asp:GridView ID="gridViewGITHistory"  runat="server" GridLines="None" CssClass="gridviews" Width="100%" HeaderStyle-HorizontalAlign="Left">
                                                <AlternatingRowStyle BackColor="White" />
                                                <HeaderStyle BackColor="#589DB8" Height="30px" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                                <RowStyle BackColor="#FAFAFA" />

                                            </asp:GridView>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>

                                </table>
                            </div>
                        </div>

                        <div id="tabs-3">
                            <div width="100%" id="div1" runat="server" style="height: 400px; overflow: auto; vertical-align: middle; text-align: center; font-family: Calibri; font-size: small; border: 1px solid Black">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 75%">
                                            <cc1:BarChart ID="BarChart2" BorderStyle="None" CssClass="bar" runat="server" ChartHeight="500" ChartWidth="700"
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
                                            <cc1:PieChart ID="PieChart1" BorderStyle="None" runat="server" ChartTitleColor="#0E426C" ChartHeight="300" ChartWidth="450"></cc1:PieChart>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <div>
                <asp:Button ID="btnbvack" runat="server" Text="Back" OnClick="btnbvack_Click" Width="80px" />

            </div>
        </div>

    </form>
</body>
</html>
