<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Highlight the Search Keywords in Gridview </title>
<style type="text/css">
.GridviewDiv {font-size: 100%; font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helevetica, sans-serif; color: #303933;}
Table.Gridview{border:solid 1px #df5015;}
.Gridview th{color:#FFFFFF;border-right-color:#abb079;border-bottom-color:#abb079;padding:0.5em 0.5em 0.5em 0.5em;text-align:center}  
.Gridview td{border-bottom-color:#f0f2da;border-right-color:#f0f2da;padding:0.5em 0.5em 0.5em 0.5em;}
.Gridview tr{color: Black; background-color: White; text-align:left}
:link,:visited { color: #DF4F13; text-decoration:none }
.highlight {text-decoration: none;color:black;background:yellow;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="GridviewDiv">
<p>
Enter UserName :
<asp:TextBox ID="txtSearch" runat="server" />&nbsp;&nbsp;
<asp:ImageButton ID="btnSearch" ImageUrl="~/SearchButton.png" runat="server"
Style="top: 5px; position: relative" onclick="btnSearch_Click" />&nbsp;&nbsp;
<asp:ImageButton ID="btnClear" ImageUrl="~/Clearbutton.png" runat="server" Style="top: 5px;
position: relative" onclick="btnClear_Click" /><br />
<br />
</p>
<asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" AllowPaging="True"
AllowSorting="true" DataSourceID="dsDetails" Width="540px" PageSize="10" CssClass="Gridview" >
<HeaderStyle BackColor="#df5015" />
<Columns>
<asp:TemplateField HeaderText="UserName">
<ItemTemplate>
<asp:Label ID="lblFirstname" Text='<%# HighlightText(Eval("UserName").ToString()) %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="LastName">
<ItemTemplate>
<asp:Label ID="lblLastname" Text='<%# Eval("LastName") %>' runat="server"/>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Location">
<ItemTemplate>
<asp:Label ID="lblLocation" Text='<%#Eval("Location") %>' runat="server"></asp:Label>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</div>
<asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:dbconnection %>" SelectCommand="select * from UserInformation" FilterExpression="UserName LIKE '%{0}%'">
<FilterParameters>
<asp:ControlParameter Name="UserName" ControlID="txtSearch" PropertyName="Text" />
</FilterParameters>
</asp:SqlDataSource>
</form> 
</body>
</html>