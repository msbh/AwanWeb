<%@ Page Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false" CodeFile="membershipList.aspx.vb" Inherits="admin_membershipList" title="-Membership List-" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 


 <ul class="myform_heading2">
  <span style="color:#3366CC">Membership</span>List
  </ul>
        
        <ul class="myform_line">
        </ul> 
<div id="myform" > 
 <div class="content">
  <fieldset> 
  
   <ul style="margin-top: 10px; margin-left: 0pt;">
                <asp:Label ID="Label1" runat="server" Text="First Name" Width="100px"></asp:Label>
           
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            
        
            
                <asp:Label ID="Label2" runat="server" Text="Company Name"></asp:Label>
            
                <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
        
                <asp:Label ID="Label3" runat="server" Text="Approval Status"></asp:Label>
        
                <asp:DropDownList   ID="ddlApprovalStatus" runat="server" 
        DataSourceID="ObjectDataSource2" DataTextField="LegendName" 
        DataValueField="Legend_ID" Height="25px" Width="109px">
                </asp:DropDownList>&nbsp;&nbsp;&nbsp;
          
     
          
                <asp:Button ID="cmdSearch" runat="server" CssClass="btn_action" Text="Search" />
           
</ul>


<br />


<ul  style=" margin-left: 10px;">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Customer_ID" 
    DataSourceID="ObjectDataSource1" AllowSorting="True" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
      
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
      
        <Columns>
            <asp:BoundField DataField="Customer_ID" HeaderText="Customer_ID" 
                ReadOnly="True" SortExpression="Customer_ID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Company_name" HeaderText="Company_name" 
                SortExpression="Company_name" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="mobileno" HeaderText="Mobile" 
                SortExpression="mobileno" />
            <asp:BoundField DataField="CountryName" HeaderText="CountryName" 
                SortExpression="CountryName" />
            <asp:BoundField DataField="LegendName" HeaderText="Status" 
                SortExpression="LegendName" />
            <asp:HyperLinkField DataNavigateUrlFields="customer_ID" 
                DataNavigateUrlFormatString="membershipdetails.aspx?id={0}" 
                Text="View Details" />
        </Columns>

        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

    </asp:GridView>
    
    
    </ul>
  </fieldset> 
   
   </div>
   </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="membersTableAdapters.Select_MembersListTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFirstName" Name="firstname" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCompanyName" Name="companyname" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlApprovalStatus" Name="Approval_Status" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Select_status" 
        TypeName="masterdataTableAdapters.legendTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>

