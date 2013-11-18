<%@ Page Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false"
    CodeFile="membershipDetails.aspx.vb" Inherits="admin_membershipDetails" Title="-Membership Details-" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
   <ul class="myform_heading2">
            <span style="color:#3366CC">MemberShip</span>List 
        </ul>
        
        <ul class="myform_line">
        </ul>   

    
    
    <fieldset> 
    
    
  <asp:FormView ID="FormView1" runat="server" DataKeyNames="Customer_ID" DataSourceID="ObjectDataSource1"
        DefaultMode="Edit">
        <EditItemTemplate>
            <div id="myform">
                <ul>
                   Member Detail
                </ul>
                <p>
                    Email:
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' 
                        Enabled="False"></asp:TextBox>
                </p>
                <p>
                    First Name:
                    <asp:TextBox ID="txtfirst_name" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    Last Name:
                    <asp:TextBox ID="txtLast_Name" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                </p>
    <%--            <p>
                    Password:
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Text='*****'></asp:TextBox>
                    Re-Type Password:
                    <asp:TextBox ID="txtReTypePassword" TextMode="Password" runat="server" 
                        Text='******'></asp:TextBox>
                </p>--%>
                <p>
                    Company Name:
                    <asp:TextBox ID="txtcompanyname" runat="server" Text='<%# Bind("Company_name") %>'></asp:TextBox>
                </p>
                <p>
                    Country:
                    <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odsCountry" DataTextField="CountryName"
                        DataValueField="Country_ID" SelectedValue='<%# Bind("country_ID") %>'>
                    </asp:DropDownList>
                    City
                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                </p>
                <p>
                    Mobile
                    <asp:TextBox ID="txtMobile" runat="server" Text='<%# Bind("mobileno") %>'></asp:TextBox>
                    Phone
                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("phoneno") %>'></asp:TextBox>
                </p>
                <p>
                    Fax
                    <asp:TextBox ID="txtFax" runat="server" Text='<%# Bind("faxno") %>'></asp:TextBox>
                    Language
                    <asp:DropDownList ID="ddlLanguage" runat="server" DataSourceID="odsLanguage" DataTextField="LanguageName"
                        DataValueField="Language_ID" SelectedValue='<%# Bind("PreferredLanguage_ID") %>'>
                    </asp:DropDownList>
                </p>
                <p>
                    Website
                    <asp:TextBox ID="txtWebsite" runat="server" Text='<%# Bind("website") %>'></asp:TextBox>
                </p>
                <p>
                    Address
                    <asp:TextBox ID="txtaddress" TextMode="MultiLine" Height="57px" runat="server" Width="196px"
                        Text='<%# Bind("address") %>'></asp:TextBox>
                </p>
                <ul>
                    <p>
                    </p>
                </ul>
                
                <p>
                
                    Status&nbsp; 
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsLegend" 
                        DataTextField="LegendName" DataValueField="Legend_ID" 
                        SelectedValue='<%# Bind("Approval_Status") %>'>
                    </asp:DropDownList>
                
                    <asp:ObjectDataSource ID="odsLegend" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="Select_status" 
                        TypeName="masterdataTableAdapters.legendTableAdapter">
                    </asp:ObjectDataSource>
                
                </p>
                
                
                
                <ul>
                    <p>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </p>
                </ul>
         
            </div>
        </EditItemTemplate>
    </asp:FormView>
   
   </fieldset>
   
   
   
    <asp:ObjectDataSource ID="odsCountry" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Select_allCountries" 
        TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Select_Member_CustID" 
    TypeName="membersTableAdapters.select_memberTableAdapter" 
        DeleteMethod="Delete" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Customer_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Customer_ID" Type="Int32" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Company_name" Type="String" DefaultValue="" />
            <asp:Parameter Name="CustomerType" Type="Int32" DefaultValue="0" />
            <asp:Parameter Name="PreferredLanguage_ID" Type="Int32" DefaultValue="" />
            <asp:Parameter Name="PreferredCurrency_ID" Type="Int32" DefaultValue="0" />
            <asp:Parameter Name="country_ID" Type="Int32" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="mobileno" Type="String" />
            <asp:Parameter Name="phoneno" Type="String" />
            <asp:Parameter Name="faxno" Type="String" />
            <asp:Parameter Name="website" Type="String" />
            <asp:Parameter Name="Approval_Status" Type="Int32" DefaultValue="" />
            <asp:Parameter Name="roleID" Type="Int32" DefaultValue="0" />
            <asp:SessionParameter Name="user_ID" SessionField="user_keyid" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="customer_ID" QueryStringField="ID" 
                Type="Int32" />
        </SelectParameters>
</asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsLanguage" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Select_allLanguages" 
        TypeName="masterdataTableAdapters.Select_AllLanguageTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>
