<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JenkinsCI.aspx.cs" Inherits="DevOpsDashboard.JenkinsCI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet" />
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet" />
    <link href="data/styles.css" type="text/css" rel="stylesheet" />
    <title></title>
        
        <style type="text/css">

            .GridViewStyle {border:1px solid #ddd; border-collapse:collapse; font-family:Calibri, sans-serif; table-layout:auto; font-size:16px; }
/*Header*/
.HeaderStyle {border:1px, solid, #ddd; background-color:#05467A; }
 
.HeaderStyle th {padding:5px 0px 5px 0px; color:#ffffff; text-align:center; }
/*Row*/
tr.RowStyle{text-align:center; background-color:#ffffff; }
 
tr.AlternatingRowStyle {text-align:center; background-color:#EDC2CF;}
 
tr.RowStyle:hover {cursor:pointer; background-color:#f69542;}
 
tr.AlternatingRowStyle:hover {cursor:pointer; background-color:#f69542;}
/*Footer*/
.FooterStyle {background-color:#938ede; height:25px;}
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
                                    <td style="font-family:Calibri;font-size:26px;font-weight:500;">Select Your Project:
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
                            <asp:GridView ID="gridViewJenkins" runat="server" GridLines="None" Width="850px"  CssClass="GridViewStyle">
                                <HeaderStyle CssClass="HeaderStyle" />                               
                                <HeaderStyle CssClass="HeaderStyle" />
                                 <FooterStyle CssClass="FooterStyle" />
                                 <RowStyle CssClass="RowStyle" />
                                 <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                            </asp:GridView>
                        
                       <%-- </caption>--%>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
           
            </div>
    </form>
</body>
</html>
