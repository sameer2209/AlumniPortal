<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ExitPage.aspx.cs" Inherits="AlumniProject.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label2" runat="server" Text="Your responses have been recorded. You can logout now."></asp:Label>
    <br />
    <br />
    <asp:Button ID="LogoutButton" runat="server" OnClick="LogoutButton_Click" Text="Logout" />

</asp:Content>
