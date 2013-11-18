<%@ Page Title="Awan International K.K | Become Agent " 
Language="VB" MasterPageFile="~/MasterPage2.master" 
AutoEventWireup="false" 
CodeFile="becomeagent.aspx.vb" Inherits="becomeagent"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <asp:FormView ID="FormView1" runat="server" DataKeyNames="becomeagent_ID" 
        DataSourceID="ObjectDataSource1" DefaultMode="Insert">
  
        <InsertItemTemplate>
       <div id="myform">
            <ul class="myform_heading">
          <%=appdata.GetLanguageString("becomeagent.heading")%>
        </ul>
        <ul class="myform_line">
        </ul>
                
                <div class="content">
                
                       <ul>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="errormessages" DisplayMode="List">
                        </asp:ValidationSummary>
                    </ul>
                    
                    <ul>
                        <li><span><%=appdata.GetLanguageString("FirstName")%>:</span>
                            <asp:TextBox ID="txtfirst_name" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                       
                        </li>
                        <li style="width:2px;margin-left: 0;padding-left: 0;">
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" 
                        ErrorMessage="Required firstname" 
                        ControlToValidate="txtfirst_name">
                        *</asp:RequiredFieldValidator>
                        
                        </li>
                        <li><span><%=appdata.GetLanguageString("LastName")%>: </span>
                            <asp:TextBox ID="txtLast_Name" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                        </li>
                  
                        <li><span><%=appdata.GetLanguageString("Mobile")%> </span>
                            <asp:TextBox ID="txtMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                        </li>
                        <li><span><%=appdata.GetLanguageString("OfficePhone")%> </span>
                            <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Tele_Office") %>'></asp:TextBox>
                        </li>
                 
                        <li><span><%=appdata.GetLanguageString("Email")%>:</span>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                       </li>
                       
                          <li style="width:2px;margin-left: 0;padding-left: 0;">      
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server" 
                        ErrorMessage="Required Email" 
                        ControlToValidate="txtEmail">
                        *</asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" 
                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtEmail" ErrorMessage="Invalid Email Address" 
                                    Display="Dynamic">*</asp:RegularExpressionValidator> 
                              </li>   
                        
                       
                        <li><span><%=appdata.GetLanguageString("CompanyName")%>: </span>
                            <asp:TextBox ID="txtcompanyname" runat="server" 
                                Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                        </li>
                  
                      
                        <li><span><%=appdata.GetLanguageString("City")%>: </span>
                            <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                        </li>
                    
                        
                        <li><span><%=appdata.GetLanguageString("AdditionalComments")%>: </span>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Additional_Remarks") %>'></asp:TextBox>
                        </li>
                        
                        
                          <li><span><%=appdata.GetLanguageString("Country")%>: </span>
                            <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odsCountry" DataTextField="CountryName"
                                DataValueField="Country_ID" SelectedValue='<%# Bind("country_ID") %>'>
                            </asp:DropDownList>
                        </li>
                        <li style="  margin-top: 41px;">
                        
                        
                        </li>
                    </ul>
                    <ul>
                        <p class="js_a">
                            <a>
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Submit Request " ForeColor="White" />
                            </a>&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text=" Cancel" ForeColor="White" />
                        </p>
                    </ul>
                
                 </div>
             
            </div>
                
                
        </InsertItemTemplate>
      
    </asp:FormView>


    <asp:ObjectDataSource ID="odsCountry" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Select_allCountries" 
        TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
    InsertMethod="Insert" SelectMethod="GetData" 
    TypeName="dsServicesTableAdapters.becomeagentTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Tele_Office" Type="String" />
            <asp:Parameter Name="Country_ID" Type="Int32" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Additional_Remarks" Type="String" />
        </InsertParameters>
</asp:ObjectDataSource>
   
       
    <asp:ObjectDataSource ID="odsLanguage" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Select_allLanguages" 
        TypeName="masterdataTableAdapters.Select_AllLanguageTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>

