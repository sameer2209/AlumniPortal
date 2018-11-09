<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SurveyPage.aspx.cs" Inherits="AlumniProject.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Label ID="Label1" runat="server" Text="Enter Company_ID" /> 
    
&nbsp;<asp:DropDownList ID="CompanyDropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="Id" DataValueField="Id" OnSelectedIndexChanged="CompanyDropDownList_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AlumniPortalConnectionString %>" SelectCommand="SELECT [Id] FROM [Company]"></asp:SqlDataSource>
   
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AlumniPortalConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Company]"></asp:SqlDataSource>
   
    <br />
    <asp:Label ID="Label3" runat="server" Text="Company Name"></asp:Label>
&nbsp;<asp:TextBox ID="CompanyNameTextBox" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="CTC (in lakhs per annum)"></asp:Label>
&nbsp;<asp:TextBox ID="CTCTextBox" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="label5" runat="server" Text="CGPA Cutoff"></asp:Label>
&nbsp;<asp:TextBox ID="CGPACutoffTextBox" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Offer Type"></asp:Label>
    
    
    :
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Type" DataValueField="Type" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AlumniPortalConnectionString %>" SelectCommand="SELECT [Type] FROM [OfferType] WHERE ([Company_Id] = @Company_Id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="CompanyDropDownList" Name="Company_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    
    <br />
    <br />
    <asp:Label ID="Label6" runat="server" Text="Were you a part of any student club? If not, then type &quot;No&quot; otherwise specify the name of the club."></asp:Label>
    
    
&nbsp;&nbsp;<asp:TextBox ID="StudentClubTextBox" runat="server"></asp:TextBox>
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StudentClubTextBox" ErrorMessage="Response can not be empty"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="Label7" runat="server" Text="Specify the number of interview rounds you faced"></asp:Label>
&nbsp;<asp:TextBox ID="RoundsTextBox" runat="server"></asp:TextBox>
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RoundsTextBox" ErrorMessage="Response can not be empty"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="Label8" runat="server" Text="Rate the difficulty of interview on a scale of 1 to 5"></asp:Label>
&nbsp;<asp:TextBox ID="DifficultyTextBox" runat="server"></asp:TextBox>
    
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DifficultyTextBox" ErrorMessage="Response can not be empty"></asp:RequiredFieldValidator>
    
    <br />
    <br />
    <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Submit" />
    
</asp:Content>
