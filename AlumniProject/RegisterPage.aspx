<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableTheming="true" Theme="Red" CodeBehind="RegisterPage.aspx.cs" Inherits="AlumniProject.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Name" SkinID="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>

    <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ErrorMessage="Name can not be empty" ControlToValidate="NameTextBox"></asp:RequiredFieldValidator>

&nbsp;<asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ErrorMessage="only alphabets are allowed" ControlToValidate="NameTextBox" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>

    <br />
    <br />
    <asp:Label ID="Label7" runat="server" Text="Registration Number" SkinID="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="RegistrationNoTextBox" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RegistrationNoTextBox" ErrorMessage="Registration Number can not be empty"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="RegistrationNoTextBox" ErrorMessage="Invalid Registration Number" ValidationExpression="^[0-9]{9}$"></asp:RegularExpressionValidator>
   
      <br />
    <br />
    <asp:Label ID="Label8" runat="server" Text="Branch" SkinID="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="BranchDropDownList" runat="server">
        <asp:ListItem>Aeronautical &amp; Automobile Engineering</asp:ListItem>
        <asp:ListItem>Biomedical Engineering</asp:ListItem>
        <asp:ListItem>Biotechnology</asp:ListItem>
        <asp:ListItem>Chemical Engineering</asp:ListItem>
        <asp:ListItem>Civil Engineering</asp:ListItem>
        <asp:ListItem>Computer Science &amp; Engineering</asp:ListItem>
        <asp:ListItem>Electronics &amp; Communications Engineering</asp:ListItem>
        <asp:ListItem>Electrial &amp; Electronics Engineering</asp:ListItem>
        <asp:ListItem>Information &amp; Communication Technology</asp:ListItem>
        <asp:ListItem>Instrumentation &amp; Control Engineering</asp:ListItem>
        <asp:ListItem>Mechanical &amp; Manufacturing Engineering</asp:ListItem>
        <asp:ListItem>Mechatronics Engineering</asp:ListItem>
        <asp:ListItem>Printing &amp; Media Engineering </asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label9" runat="server" Text="Year of Graduation" SkinID="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="YearOfGradDropDownList" runat="server">
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
    <asp:Label ID="Label3" runat="server" Text="Email id" SkinID="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>

&nbsp;<asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ErrorMessage="Email can not be empty" ControlToValidate="EmailTextBox"></asp:RequiredFieldValidator>

&nbsp;<asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" ErrorMessage="invalid email id" ControlToValidate="EmailTextBox" ValidationExpression="^[a-zA-Z0-9_]+[0-9]*@.+[.].+$"></asp:RegularExpressionValidator>

<br />
    <br />
<asp:Label ID="Label6" runat="server" Text="Contact No" SkinID="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="ContactTextBox" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ContactTextBox" ErrorMessage="Contact number can not be empty"></asp:RequiredFieldValidator>
<br />
    <br />
<asp:Label ID="Label4" runat="server" Text="Password" SkinID="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="PwdTextBox" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PwdTextBox" ErrorMessage="Password can not be empty"></asp:RequiredFieldValidator>
<br />
    <br />
<asp:Label ID="Label5" runat="server" Text="Confirm Password" SkinID="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="CnfPwdTextBox" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="CnfPwdRequiredFieldValidator" runat="server" ControlToValidate="CnfPwdTextBox" ErrorMessage="Confirm password can not be empty"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PwdTextBox" ControlToValidate="CnfPwdTextBox" ErrorMessage="Passwords do not match"></asp:CompareValidator>
<br />
<br />
<asp:Button ID="RegisterBtn" runat="server" OnClick="RegisterBtn_Click" Text="Register" style="height: 26px" />
</asp:Content>
