<%@ Page Title="Awan International K.K | New Membership " Language="VB" MasterPageFile="~/MasterPage2.master"
    AutoEventWireup="false" CodeFile="membership_US.aspx.vb" Inherits="membership" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
            <div id="myform">
                <ul class="myform_heading">
                    <span style="color: #F0F0F0">Membership </span>Request
                </ul>
                <ul class="myform_line">
                </ul>
                <div class="content">
                
                  
                    <span ID="lblmessage" runat="server" visible="false" 
                    style=" padding:8px; font-size:12px; "  
                    class="infomessages">Your membership completed successfully! 
                    To login as member <a href="LoginPage.aspx"> click here </a>  </span> 
 

          <asp:FormView ID="FormView1" runat="server" DataKeyNames="Customer_ID" DataSourceID="ObjectDataSource1"
        DefaultMode="Insert">
          
           <InsertItemTemplate>        
                 
                  
                    
                        <ul>
                        
                            
                 <p>
                            <li  class="reqrow"><span>First Name:</span>
                                <asp:TextBox ID="txtfirst_name" runat="server" Text='<%# Bind("FirstName") %>' 
                                    MaxLength="40"></asp:TextBox>
                            
                            
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                               runat="server" ValidationGroup="form"
                              ControlToValidate="txtfirst_name" Display="Dynamic"
                               ErrorMessage="First Name required">
                               </asp:RequiredFieldValidator> 

                                  <asp:RegularExpressionValidator ID="Regularfirst_name" runat="server" 
                                            ControlToValidate="txtfirst_name" Display="Dynamic" ErrorMessage="Invalid Data" ValidationGroup="form"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,40}$">
                                        </asp:RegularExpressionValidator>

                               
                               </li>
                           
                            <p>
                                <li><span>Last Name: </span>
                                    <asp:TextBox ID="txtLast_Name" runat="server" MaxLength="40" 
                                        Text='<%# Bind("LastName") %>'></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="form" 
                                        ControlToValidate="txtLast_Name" Display="Dynamic" ErrorMessage="Invalid Data"
                                        ValidationExpression="^[a-zA-Z'.\s]{1,40}$">
                                    </asp:RegularExpressionValidator>
                                </li>
                              
                              
                               
                            </p>
                        </p>   
                 
                 </ul>
                 
                   

                        
                         <ul>
                        <p>
                              <li ><span>Company Name: </span>
                                    <asp:TextBox ID="txtcompanyname" runat="server" 
                                      Text='<%# Bind("Company_name") %>' MaxLength="90"></asp:TextBox>
                                    
                             
                               
                        
                           
                                </li>
                             
                              <p>
                              </p>
                              <p>
                                  <li class="reqrow"><span>Email: </span>
                                      <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                    
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                          ControlToValidate="txtEmail" Display="Dynamic" 
                                          ErrorMessage="E_Mail required" ValidationGroup="form">
                                      </asp:RequiredFieldValidator>
                                      
                                      <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" 
                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtEmail" ErrorMessage="Invalid Email Address" 
                                    Display="Dynamic"></asp:RegularExpressionValidator> 
                                      
                                  </li>
                               
                              </p>
                             
                            </p>
</ul>

                         <ul>
                       
                        
                     
                         <p>
                                <li  class="reqrow"><span>Password: </span>
                                    <asp:TextBox ID="txtTypePassword" TextMode="Password" runat="server" 
                                        Text='<%# Bind("Password") %>' MaxLength="15"></asp:TextBox>
                                
                         
                                
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                     runat="server" ValidationGroup="form"
                                     ControlToValidate="txtTypePassword" Display="Dynamic"
                                     ErrorMessage="Password required">
                                     
                                     </asp:RequiredFieldValidator>
                                </li>
                              
                                <p>
                                    <li class="reqrow"><span>Re-Type Password: </span>
                                        <asp:TextBox ID="txtReTypePassword" runat="server" MaxLength="15" 
                                            Text='<%# Bind("Password") %>' TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtReTypePassword" Display="Dynamic" 
                                            ErrorMessage="Re-type Password required" ValidationGroup="form">
                                        </asp:RequiredFieldValidator>
                                    </li>
                                  
                                </p>
                                </p> 
                          
                     
                          
                    
                         </ul>
                         
                         
                      
                      
                        <ul>
                            <p>
                               <li><span>Country: </span>
                                    <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odsCountry" DataTextField="CountryName"
                                        DataValueField="Country_ID" SelectedValue='<%# Bind("country_ID") %>'>
                                    </asp:DropDownList>
                                </li>
                             
                                <p>
                                    <li><span>City </span>
                                        <asp:TextBox ID="txtCity" runat="server" MaxLength="90" 
                                            Text='<%# Bind("city") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                            ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Invalid Data" ValidationGroup="form"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,40}$">
                                        </asp:RegularExpressionValidator>
                                    </li>
                                 
                                </p>
                                
                               </p>
                            
                        </ul>
                        <ul>
                            
                            <p>
                               <li><span>Mobile </span>
                                    <asp:TextBox ID="txtMobile" runat="server" Text='<%# Bind("mobileno") %>' 
                                        MaxLength="20"></asp:TextBox>
                                     
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                 runat="server" ControlToValidate="txtMobile" ValidationGroup="form"
                                 ValidationExpression="^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$"
                                 ErrorMessage="Invalid Data">
         
                                 </asp:RegularExpressionValidator>
                                        
                                </li>
                             
                                <p>
                                    <li><span>Phone </span>
                                        <asp:TextBox ID="txtPhone" runat="server" MaxLength="20" 
                                            Text='<%# Bind("phoneno") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                            ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Invalid Data" ValidationGroup="form"
                                            ValidationExpression="^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$">
                                        </asp:RegularExpressionValidator>
                                    </li>
                            
                           
                        </ul>
                        
                        
                        
                        
                        <ul>
                            <p>
                              <li>
                                <span>Fax </span>
                                    <asp:TextBox ID="txtFax" runat="server" Text='<%# Bind("faxno") %>' 
                                      MaxLength="20"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6"
                                 runat="server" ControlToValidate="txtFax" ValidationGroup="form"
                                  ValidationExpression="^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$" Display="Dynamic"
                                 ErrorMessage="Invalid Data">
                                 </asp:RegularExpressionValidator>
        
                                </li>
                                
                                 <p>
                                </p>
                                <p>
                                    <li><span>Language </span>
                                        <asp:DropDownList ID="ddlLanguage" runat="server" DataSourceID="odsLanguage" 
                                            DataTextField="LanguageName" DataValueField="Language_ID" 
                                            SelectedValue='<%# Bind("PreferredLanguage_ID") %>'>
                                        </asp:DropDownList>
                                    </li>
                                 
                                </p>
                                
                                 </p>
                        </ul>
                     <ul>
                        <p>
                             <li><span>Address </span>
                                    <asp:TextBox ID="txtaddress" TextMode="MultiLine" Height="57px" runat="server" ValidationGroup="form" 
                                        Text='<%# Bind("address") %>' MaxLength="150"></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator8"
                                 runat="server" ControlToValidate="txtaddress"
                                  ValidationExpression="^[a-zA-Z0-9 ]+$" Display="Dynamic"
                                 ErrorMessage="Invalid Data">
                                 </asp:RegularExpressionValidator>
                            
  
                                        
                                </li>
                           
                             <p>
                                 <li style="margin-top: -40px;"><span>Website </span>
                                     <asp:TextBox ID="txtWebsite" runat="server" MaxLength="30" 
                                         Text='<%# Bind("website") %>'></asp:TextBox>
                                   
                                   
                                 </li>
                               
                             </p>
                            </p>
                            
                        </ul>

                        <ul>
                            <p class="js_a">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                 ValidationGroup="form"
                                CommandName="Insert"
                                    Text="Submit Request " ForeColor="White" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text=" Cancel" ForeColor="White" />
                            </p>
                        </ul>
                      
                    </InsertItemTemplate>
                      </asp:FormView>
                </div>
          
          
            </div>
            
            
      
  
   
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
        SelectMethod="GetData" TypeName="membersTableAdapters.select_memberTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="reTypePassword" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Company_name" Type="String" />
            <asp:Parameter DefaultValue="0" Name="CustomerType" Type="Int32" />
            <asp:Parameter Name="PreferredLanguage_ID" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="PreferredCurrency_ID" Type="Int32" />
            <asp:Parameter Name="country_ID" Type="Int32" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="mobileno" Type="String" />
            <asp:Parameter Name="phoneno" Type="String" />
            <asp:Parameter Name="faxno" Type="String" />
            <asp:Parameter Name="website" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsLanguage" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_allLanguages" TypeName="masterdataTableAdapters.Select_AllLanguageTableAdapter">
    </asp:ObjectDataSource>
     <asp:ObjectDataSource ID="odsCountry" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
    </asp:ObjectDataSource>
    
   
</asp:Content>
