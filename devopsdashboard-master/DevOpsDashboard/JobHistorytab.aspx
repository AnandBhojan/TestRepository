<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobHistorytab.aspx.cs" Inherits="DevOpsDashboard.JobHistorytab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head1" runat="server">
    <title>Job History</title>
    <meta http-equiv="refresh" content="30">
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet" />


    <link href="StyleSheets/jquery-ui.css" type="text/css" rel="stylesheet" />
    <script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript"></script>
    <style>
        .bar {
            border-style: none !important;
        }

        .pageview {
            float: left;
            margin: 5px;
            padding: 5px;
            width: 99%;
            border: 1px solid black;
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
    <link href="StyleSheets/jquery-ui.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">

        $(function () {
            $("#tabs").tabs();
        });
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div class="pageview">
            <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </cc1:ToolkitScriptManager>
            <div style="vertical-align: middle; text-align: center; font-family: Calibri; font-size: x-large; font-weight: 400; color: #000000;" aria-atomic="False">
                <strong>JENKINS DASHBOARD
                </strong>
                <br />
                <br />
            </div>
            <div id="tabs" style="font-family: Calibri;">
                <ul>
                    <li><a href="#tabs-1">ALL JOBS</a></li>
                    <li><a href="#tabs-2">BUILD HISTORY</a></li>
                    <li><a href="#tabs-3">GRAPHS</a></li>
                </ul>
                <div id="tabs-1">
                    <div class="gridviews">
                    <table   style="font-family: Calibri; font-size: 15px;width:100%">
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

                                <asp:GridView ID="gridViewJenkins" runat="server" Width="100%" GridLines="None" AutoGenerateColumns="false" CssClass="gridviews">
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
                </div>

                <div id="tabs-2">

                    <table width="100%" style="font-family: Calibri; font-size: 15px">
                        <%-- <tr style="font-family: Calibri; font-size: 14px">
                        <td width="20%">Select Job</td>
                        <td width="80%" allign="Right">
                            <asp:DropDownList ID="ddljobs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddljobs_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>--%>
                        <tr>
                            <td colspan="2">
                                <div style="height: 500px; overflow: auto">
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
                    <div width="100%" id="divChart" runat="server" style="height: 500px; overflow: auto; vertical-align: middle; text-align: center; font-family: Calibri; font-size: small; border: 1px solid Black">
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
            <div>
                <asp:Button ID="btnbvack" runat="server" Text="Back" OnClick="btnbvack_Click" Width="80px" />

            </div>
        </div>

    </form>
</body>
</html>
