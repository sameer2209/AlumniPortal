<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="AlumniProject.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <asp:Label ID="Label2" runat="server" Text="UserName"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="UserNameTextBox" runat="server" placeholder="Enter registration number"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserNameTextBox" ErrorMessage="Registration Number can not be empty"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UserNameTextBox" ErrorMessage="Invalid UserName" ValidationExpression="(^[0-9]{9}$)|(^[a-zA-Z]+[0-9]+$)"></asp:RegularExpressionValidator>

    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="PasswordTextBox" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="Password can not be empty"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
&nbsp;

<asp:Label ID="LoginErrorLabel" runat="server" Text="Registrtion Number/Password do not match"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Your records have been saved successfully"></asp:Label>
&nbsp;

</asp:Content>
