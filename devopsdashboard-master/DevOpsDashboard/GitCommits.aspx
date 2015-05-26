<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GitCommits.aspx.cs" Inherits="DevOpsDashboard.GitCommits" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet" />
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet" />
    <link href="data/styles.css" type="text/css" rel="stylesheet" />
    <title></title>
        <style type="text/css">
            .auto-style1 {
                width: 400px;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table>

                       <%-- <caption>--%>
                            <br />
                            
                                <tr>
                                    <td>Select GIT Repository:
                                        <asp:DropDownList ID="ddlProjects" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProjects_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                         <asp:Button ID="Button1" runat="server" Text="Refresh" />
                                    </td>
                                </tr>
                        <tr>
                             <br />
                        </tr>
                            
                       
<%--                            <br />
                            GIT Commit History:
                            </tr>--%>
                            <asp:GridView ID="gridViewGITHistory" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="489px" >
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                       <%-- </caption>--%>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
           
            </div>
    </form>
</body>
</html>
