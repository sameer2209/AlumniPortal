<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="AlumniProject.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <asp:Label ID="welcomeLabel" runat="server"></asp:Label>
    
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Apply search filters:"></asp:Label>
&nbsp;&nbsp;&nbsp;<br />
    <asp:CheckBox ID="YearCheckBox" runat="server" AutoPostBack="True" OnCheckedChanged="YearCheckBox_CheckedChanged" Text="Year of Graduation" />
&nbsp;<asp:CheckBox ID="BranchCheckBox" runat="server" AutoPostBack="True" OnCheckedChanged="BranchCheckBox_CheckedChanged" Text="Branch" />
&nbsp;<asp:CheckBox ID="CompanyCheckBox" runat="server" AutoPostBack="True" OnCheckedChanged="CompanyCheckBox_CheckedChanged" Text="Company" />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Specify year of graduation"></asp:Label>
&nbsp;&nbsp;
    <asp:DropDownList ID="YearDropDownList" runat="server">
        <asp:ListItem>2001</asp:ListItem>
        <asp:ListItem>2002</asp:ListItem>
        <asp:ListItem>2003</asp:ListItem>
        <asp:ListItem>2004</asp:ListItem>
        <asp:ListItem>2005</asp:ListItem>
        <asp:ListItem>2006</asp:ListItem>
        <asp:ListItem>2007</asp:ListItem>
        <asp:ListItem>2008</asp:ListItem>
        <asp:ListItem>2009</asp:ListItem>
        <asp:ListItem>2010</asp:ListItem>
        <asp:ListItem>2011</asp:ListItem>
        <asp:ListItem>2012</asp:ListItem>
        <asp:ListItem>2013</asp:ListItem>
        <asp:ListItem>2014</asp:ListItem>
        <asp:ListItem>2015</asp:ListItem>
        <asp:ListItem>2016</asp:ListItem>
        <asp:ListItem>2017</asp:ListItem>
        <asp:ListItem>2018</asp:ListItem>
        <asp:ListItem>2019</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Specify Branch Id by refering below table"></asp:Label>
&nbsp;
    <asp:DropDownList ID="BranchDropDownList" runat="server">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
        <asp:ListItem>13</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AlumniPortalConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Branch]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Specify company id by referring below table "></asp:Label>
&nbsp;<asp:DropDownList ID="CompanyDropDownList" runat="server" DataSourceID="SqlDataSource3" DataTextField="Id" DataValueField="Id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AlumniPortalConnectionString %>" SelectCommand="SELECT [Id] FROM [Company]"></asp:SqlDataSource>
    <br />
&nbsp;<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AlumniPortalConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Company]"></asp:SqlDataSource>
&nbsp;<br />
    <br />
    <asp:Button ID="ApplyFilterButton" runat="server" Text="Apply Filter" OnClick="ApplyFilterButton_Click" />
&nbsp; &nbsp;<br />
    <br />
    <asp:GridView ID="GridView2" runat="server">
    </asp:GridView>
    <br />
    <asp:Button ID="LogoutButton" runat="server" OnClick="LogoutButton_Click" Text="Logout" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />

</asp:Content>
