<%@ Page Title="Awan International K.K | Sell Your Car  " 
Language="VB" MasterPageFile="~/MasterPage2.master" 
AutoEventWireup="false" 
CodeFile="sellycar.aspx.vb" Inherits="sellycar"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Customer_ID" 
        DataSourceID="ObjectDataSource1" DefaultMode="Insert">
  
        <InsertItemTemplate>
       <div id="myform">
            <ul class="myform_heading">
            <%=appdata.GetLanguageString("sellcar.heading")%>
        </ul>
        <ul class="myform_line">
        </ul>
        
               <ul>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="errormessages" DisplayMode="List">
                        </asp:ValidationSummary>
                    </ul>
                
                
                <div class="content">
                    <ul>
                        <li><span>
                            <%=appdata.GetLanguageString("Make")%>:</span>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Car_Make") %>'></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("MakeModel")%>: </span>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Car_MakeDesc") %>'></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("ModelYear")%>:</span>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Model_Year") %>'></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("Color")%>
                        </span>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Car_Color") %>'></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("FirstName")%></span>
                            <asp:TextBox ID="txtfirst_name" runat="server" Text='<%# Bind("First_Name") %>'></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("LastName")%>
                        </span>
                            <asp:TextBox ID="txtLast_Name" runat="server" Text='<%# Bind("Last_Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required firstname"
                                ControlToValidate="txtfirst_name" Display="Dynamic">
                        *</asp:RequiredFieldValidator>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("Mobile")%></span>
                            <asp:TextBox ID="txtMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("OfficePhone")%></span>
                            <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Tele_Office") %>'></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("Email")%>:</span>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required firstname"
                                ControlToValidate="txtEmail" Display="Dynamic">
                        *</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtEmail" ErrorMessage="Invalid Email Address" Display="Dynamic">*</asp:RegularExpressionValidator>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("CompanyName")%>:</span>
                            <asp:TextBox ID="txtcompanyname" runat="server"></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("City")%>: </span>
                            <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("ExpectedPrice")%>:</span>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Expected_Price") %>'></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("AdditionalRequest")%>: </span>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Additional_Remarks") %>'></asp:TextBox>
                        </li>
                        <li><span>
                            <%=appdata.GetLanguageString("Country")%>: </span>
                            <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odsCountry" DataTextField="CountryName"
                                DataValueField="Country_ID" SelectedValue='<%# Bind("country_ID") %>'>
                            </asp:DropDownList>
                        </li>
                
                
                    </ul>
                    
                    <ul>
                        <p class="js_a" >
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
    TypeName="dsServicesTableAdapters.sellycarTableAdapter" DeleteMethod="Delete" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_sellycar_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="First_Name" Type="String" />
            <asp:Parameter Name="Last_Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Country_ID" Type="Int32" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Tele_Office" Type="String" />
            <asp:Parameter Name="Tele_Residence" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="Car_Make" Type="String" />
            <asp:Parameter Name="Car_MakeDesc" Type="String" />
            <asp:Parameter Name="Car_Color" Type="String" />
            <asp:Parameter Name="Model_Year" Type="String" />
            <asp:Parameter Name="Expected_Price" Type="String" />
            <asp:Parameter Name="Additional_Remarks" Type="String" />
            <asp:Parameter Name="AuditInfo_ID" Type="Int32" />
            <asp:Parameter Name="Request_Datetime" Type="DateTime" />
            <asp:Parameter Name="Action_Taken" Type="Boolean" />
            <asp:Parameter Name="Action_Taken_by" Type="Int32" />
            <asp:Parameter Name="Staff_Remarks" Type="String" />
            <asp:Parameter Name="Original_sellycar_ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="First_Name" Type="String" />
            <asp:Parameter Name="Last_Name" Type="String" />
            <asp:Parameter Name="Country_ID" Type="Int32" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Tele_Office" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="Car_Make" Type="String" />
            <asp:Parameter Name="Car_MakeDesc" Type="String" />
            <asp:Parameter Name="Car_Color" Type="String" />
            <asp:Parameter Name="Model_Year" Type="String" />
            <asp:Parameter Name="Expected_Price" Type="String" />
            <asp:Parameter Name="Additional_Remarks" Type="String" />
        </InsertParameters>
</asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsLanguage" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Select_allLanguages" 
        TypeName="masterdataTableAdapters.Select_AllLanguageTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>

