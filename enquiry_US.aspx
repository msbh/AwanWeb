<%@ Page Title="Awan International K.K | Enquiry" Language="VB" MasterPageFile="~/MasterPage2.master"
    AutoEventWireup="false" CodeFile="enquiry_US.aspx.vb" Inherits="enquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="myform">
        
        
        <ul class="myform_heading">
            <span style="color: #F0F0F0">Stock </span>Enquiry
        </ul>
        <ul class="myform_line">
        </ul>
        
        
        <div class="content">
          
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Enquiry_ID" DataSourceID="odsEnquiry"
                DefaultMode="Insert">
                <InsertItemTemplate>
    
             
        <ul>
                <asp:ValidationSummary  ID="valsummary" runat="server" CssClass="errormessages"  DisplayMode="List">
                </asp:ValidationSummary>
               </ul>
           
               

               
                    <fieldset>
                        <legend>Stock details </legend>
                        <asp:FormView ID="FormView2" runat="server" DataSourceID="odsStockSelected">
                            <ItemTemplate>
                                <ul>
                                    <li><span>Stock No </span>
                                    
                                        <asp:HiddenField ID="HstockID" runat="server" Value='<%# Eval("FILE_REF") %>' />        
                                    
                                        <asp:TextBox ID="txtStockNo" ReadOnly="true" runat="server" Text='<%# Bind("FILE_REF") %>'></asp:TextBox>
                                    </li>
                                    <li><span>Chassis No </span>
                                        <asp:TextBox ID="txtChassisno" Enabled="False" runat="server" Text='<%# Bind("CHASSIS_NO") %>'></asp:TextBox>
                                    </li>
                                </ul>
                                <ul>
                                    <li><span>Make </span>
                                        <asp:DropDownList ID="ddlMake" runat="server" Enabled="False" DataSourceID="odsMake"
                                            DataTextField="make" DataValueField="makeID" SelectedValue='<%# Bind("MAKE_ID") %>'>
                                        </asp:DropDownList>
                                    </li>
                                    <li><span>Make Model </span>
                                        <asp:DropDownList ID="ddlMakeModel" runat="server" Enabled="False" DataSourceID="odsMakeDetails"
                                            DataTextField="model_description" DataValueField="ID" SelectedValue='<%# Bind("MAKE_MODEL_ID") %>'>
                                        </asp:DropDownList>
                                    </li>
                                </ul>
                                <ul>
                                    <li><span>Model Year</span>
                                        <asp:TextBox ID="txtModelYear" Enabled="False" runat="server" Text='<%# Bind("MODEL") %>'></asp:TextBox>
                                    </li>
                                    <li><span>Drive </span>
                                        <asp:TextBox ID="txtDrive" Enabled="False" runat="server" Text='<%# Bind("DRIVE") %>'></asp:TextBox>
                                    </li>
                                </ul>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:ObjectDataSource ID="odsStockSelected" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsStockTableAdapters.enquiryTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="stock_ID" QueryStringField="ID" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <ul>
                            <li style="width: 100%;"><span>Your Message</span>
                                <asp:TextBox ID="txtmessage" TextMode="MultiLine" Width="95%" Height="60px" runat="server"
                                    Text='<%# Bind("message") %>' MaxLength="150"></asp:TextBox>
                                    
             
                                    
                                    
                            </li>
                        </ul>
                    </fieldset>
                    <fieldset>
                        <legend>Contact Info </legend>
                        <ul>
                            <li><span>Name </span>
                                <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                               runat="server" ValidationGroup="form"
                              ControlToValidate="txtFirstName" Display="Dynamic"
                               ErrorMessage="FirstName required">
                               </asp:RequiredFieldValidator> 
                        
                               
                               
                               
                            
                            </li>
                            <li><span>Email </span>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                               runat="server" ValidationGroup="form"
                              ControlToValidate="txtEmail" Display="Dynamic"
                               ErrorMessage="E_Mail required">
                               </asp:RequiredFieldValidator> 
                               
                               
                                              
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator7"
       runat="server" ControlToValidate="txtemail" 
      ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" 
      Display="Dynamic"
       ErrorMessage="e-Mail required">
      </asp:RegularExpressionValidator>  
                               
                            </li>
                            <li><span>Company </span>
                                <asp:TextBox ID="txtCompany" runat="server" Text='<%# Bind("CompanyName") %>' MaxLength="30"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                                 runat="server" ControlToValidate="txtCompany" ValidationGroup="form"
                                  ValidationExpression="^[a-zA-Z'.\s]{1,40}$" Display="Dynamic"
                                 ErrorMessage="Invalid Data">
                                 </asp:RegularExpressionValidator>
                            </li>
                            <li><span>Contact No </span>
                                <asp:TextBox ID="txtcontactno" runat="server" Text='<%# Bind("Contact_No") %>' MaxLength="18"></asp:TextBox>
                            
                            
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                 runat="server" ControlToValidate="txtcontactno" ValidationGroup="form"
                                  ValidationExpression="^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$" Display="Dynamic"
                                 ErrorMessage="Invalid Data">
                                 </asp:RegularExpressionValidator>
                            
                            </li>
                            <li><span>Country </span>
                                <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odsCountry" DataTextField="CountryName"
                                    DataValueField="Country_ID" SelectedValue='<%# Bind("Country_ID") %>'>
                                </asp:DropDownList>
                            </li>
                            <li><span>City </span>
                                <asp:TextBox ID="txtcity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                 runat="server" ControlToValidate="txtcity" ValidationGroup="form"
                                  ValidationExpression="^[a-zA-Z'.\s]{1,40}$" Display="Dynamic"
                                 ErrorMessage="Invalid Data">
                                 </asp:RegularExpressionValidator>
                            </li>
                            <li><span>Address </span>
                                <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                                
                                 
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                 runat="server" ControlToValidate="txtaddress" ValidationGroup="form"
                                  ValidationExpression="^[a-zA-Z'.\s]{1,40}$" Display="Dynamic"
                                 ErrorMessage="Invalid Data">
                                 </asp:RegularExpressionValidator>
                                
                              
                            </li>
                        </ul>
                    </fieldset>
                    <ul class="js_a" >
                       
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                 ValidationGroup="form"
                                CommandName="Insert"
                                    Text="Submit Request " ForeColor="White" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text=" Cancel" ForeColor="White" />
                           
                    </ul>
                  
                </InsertItemTemplate>
            </asp:FormView>
            <ul>
            </ul>
        </div>
    </div>
    
    
    
    
    
    <asp:ObjectDataSource ID="odsMake" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="masterdataTableAdapters.tblmakeTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsCountry" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsMakeDetails" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="getMakeModelNames" TypeName="masterdataTableAdapters.tblmake_detailsTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsEnquiry" runat="server" InsertMethod="Insert" SelectMethod="GetData"
        TypeName="dsStockTableAdapters.enquiryTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="stock_ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="HStock_ID" Name="Stock_ID" PropertyName="Value"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="Customer_ID" SessionField="customer_id"
                Type="Int32" />
            <asp:Parameter Name="Message" Type="String" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="country_ID" Type="Int32" />
            <asp:Parameter Name="Contact_No" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="HStock_ID" runat="server" />
</asp:Content>
