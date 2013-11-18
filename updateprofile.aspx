<%@ Page Title="Awan International K.K | Update Profile" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" 
CodeFile="updateprofile.aspx.vb" Inherits="updateprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="myform">
        <h1 class="myform_heading">
            <span class="myform_span">Membership </span>Request
        </h1>
        <ul class="myform_line">
        </ul>
        <div class="content">
        
        
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Customer_ID" 
                DataSourceID="odsUpdateProfile" DefaultMode="Edit" >
                <EditItemTemplate>
                    
                    <ul>
                        <li><span>First Name:</span>
                            <asp:TextBox ID="txtfirst_name" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                        </li>
                        <li><span>Last Name: </span>
                            <asp:TextBox ID="txtLast_Name" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                        </li>
                    </ul>
                   
                    <ul>
                        <p>
                            <li><span>Company Name: </span>
                                <asp:TextBox ID="txtcompanyname" runat="server" Text='<%# Bind("Company_name") %>'></asp:TextBox>
                            </li>
                        </p>
                    </ul>
                    <ul>
                        <p>
                            <li><span>Country: </span>
                                <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odsCountry" DataTextField="CountryName"
                                    DataValueField="Country_ID" SelectedValue='<%# Bind("country_ID") %>'>
                                </asp:DropDownList>
                            </li>
                            <li><span>City </span>
                                <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                            </li>
                        </p>
                    </ul>
                    <ul>
                        <p>
                            <li><span>Mobile </span>
                                <asp:TextBox ID="txtMobile" runat="server" Text='<%# Bind("mobileno") %>'></asp:TextBox>
                            </li>
                            <li><span>Phone </span>
                                <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("phoneno") %>'></asp:TextBox>
                            </li>
                        </p>
                    </ul>
                    <ul>
                        <p>
                            <li><span>Fax </span>
                                <asp:TextBox ID="txtFax" runat="server" Text='<%# Bind("faxno") %>'></asp:TextBox>
                            </li>
                            <li><span>Language </span>
                                <asp:DropDownList ID="ddlLanguage" runat="server" DataSourceID="odsLanguage" DataTextField="LanguageName"
                                    DataValueField="Language_ID" SelectedValue='<%# Bind("PreferredLanguage_ID") %>'>
                                </asp:DropDownList>
                            </li>
                        </p>
                    </ul>
                    <ul>
                        <p>
                            <li><span>Website </span>
                                <asp:TextBox ID="txtWebsite" runat="server" Text='<%# Bind("website") %>'></asp:TextBox>
                            </li>
                        </p>
                    </ul>
                    <ul>
                        <p>
                            <li><span>Address </span>
                                <asp:TextBox ID="txtaddress" TextMode="MultiLine" Height="57px" runat="server" Width="196px"
                                    Text='<%# Bind("address") %>'></asp:TextBox>
                            </li>
                        </p>
                    </ul>
                    <ul>
                        <p>
                        </p>
                    </ul>
                    <ul class="js_a" >
                       
                          
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update Profile " ForeColor="White" />
                           &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text=" Cancel" ForeColor="White" />
                        
                    </ul>
                    <ul>
                        <asp:ValidationSummary ID="valsummary" runat="server" CssClass="errormessages" DisplayMode="List">
                        </asp:ValidationSummary>
                    </ul>
                </EditItemTemplate>
               
            </asp:FormView>
        
        
        
        
        
        
            <asp:ObjectDataSource ID="odsUpdateProfile" runat="server" 
                OldValuesParameterFormatString="{0}" SelectMethod="GetData" 
                TypeName="dsServicesTableAdapters.select_member_byCustIDTableAdapter" 
                UpdateMethod="Update">
                <UpdateParameters>
                    <asp:SessionParameter Name="Customer_ID" SessionField="user_id" Type="Int32" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Company_name" Type="String" />
                    <asp:Parameter Name="CustomerType" Type="Int32" DefaultValue="0" />
                    <asp:Parameter Name="PreferredLanguage_ID" Type="Int32" DefaultValue="" />
                    <asp:Parameter Name="PreferredCurrency_ID" Type="Int32" DefaultValue="1" />
                    <asp:Parameter Name="country_ID" Type="Int32" DefaultValue="" />
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="mobileno" Type="String" />
                    <asp:Parameter Name="phoneno" Type="String" />
                    <asp:Parameter Name="faxno" Type="String" />
                    <asp:Parameter Name="website" Type="String" DefaultValue="" />
                    <asp:Parameter Name="roleID" Type="Int32" DefaultValue="1" />
                    <asp:SessionParameter Name="user_ID" SessionField="user_id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="customer_ID" SessionField="user_id" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            
               <asp:ObjectDataSource ID="odsLanguage" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_allLanguages" TypeName="masterdataTableAdapters.Select_AllLanguageTableAdapter">
    </asp:ObjectDataSource>
     <asp:ObjectDataSource ID="odsCountry" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
    </asp:ObjectDataSource>
            
        </div>
    </div>
</asp:Content>

