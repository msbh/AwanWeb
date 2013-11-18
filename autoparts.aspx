<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="autoparts.aspx.vb" Inherits="autoparts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">





    <div id="myform">
        <ul class="myform_heading">
              <%=appdata.GetLanguageString("Autoparts.heading")%>      
                    
        </ul>
        <ul class="myform_line">
        </ul>
        <div class="content">
        
            <p>
              
              <%=appdata.GetLanguageString("Autoparts.text")%>      
                    
            </p>
        
       
            <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" 
                DefaultMode="Insert"  Width="100%" DataKeyNames="autoparts_ID" >
           

           
                <InsertItemTemplate>
                
                
                       <ul>
                        <asp:ValidationSummary ID="valsummary" runat="server" CssClass="errormessages" DisplayMode="List">
                        </asp:ValidationSummary>
                    </ul>
                
                
                
                
                
                
                
                <fieldset>
                <legend><%=appdata.GetLanguageString("AutopartInformation")%> </legend>
                <ul>
                    <li><span><%=appdata.GetLanguageString("FirstName")%></span>
                        <asp:TextBox ID="txtfirstname" runat="server" Text='<%# Bind("firstname") %>' 
                            MaxLength="40"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                         runat="server" 
                        ErrorMessage="Required firstname" 
                        ControlToValidate="txtfirstname">
                        *</asp:RequiredFieldValidator>
                        
                    </li>
                    <li><span><%=appdata.GetLanguageString("Email")%> </span>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' 
                            MaxLength="40"></asp:TextBox>
                    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                        runat="server" 
                        ErrorMessage="Required Email" 
                        ControlToValidate="txtemail">*
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" 
                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtEmail" ErrorMessage="Invalid Email Address" 
                                    Display="Dynamic">*</asp:RegularExpressionValidator> 
                    </li>
                    <li><span><%=appdata.GetLanguageString("Phone")%>  </span>
                        <asp:TextBox ID="txtphone" runat="server" Text='<%# Bind("phone") %>' 
                            MaxLength="20"></asp:TextBox>
                   
                     <asp:RegularExpressionValidator ID="Regulartxtphone" runat="server" 
                                            ControlToValidate="txtphone" Display="Dynamic" ErrorMessage="Invalid Data" ValidationGroup="form"
                                            ValidationExpression="^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$">
                                        </asp:RegularExpressionValidator>
                   
                    </li>
                    <li><span><%=appdata.GetLanguageString("Country")%></span>
                        <asp:DropDownList ID="ddlcountry" runat="server" DataSourceID="odsCountry" 
                            DataTextField="CountryName"
                            DataValueField="Country_ID" SelectedValue='<%# Bind("country_ID") %>'>
                        </asp:DropDownList>
                    </li>
                </ul>
            </fieldset>
            <fieldset>
                <legend><%=appdata.GetLanguageString("AutopartVehicleInfo")%>VehicleInfo </legend>
                <ul>
                    <li><span><%=appdata.GetLanguageString("Make")%></span>
                        <asp:TextBox ID="TextMake" runat="server" Text='<%# Bind("make") %>' 
                            MaxLength="30"></asp:TextBox>
                   
                    
                   
                    </li>
                    <li><span>Model</span>
                        <asp:TextBox ID="Textmakemodel" runat="server" Text='<%# Bind("makemodel") %>' 
                            MaxLength="8"></asp:TextBox>
                    
                      
                    </li>
                    <li><span><%=appdata.GetLanguageString("ChassisNo")%></span>
                        <asp:TextBox ID="txtchassisno" runat="server" Text='<%# Bind("chassisno") %>' 
                            MaxLength="40"></asp:TextBox>
                    
                 
                    
                    </li>
                    <li><span><%=appdata.GetLanguageString("Year")%> </span>
                        <asp:TextBox ID="Txtyear" runat="server" Text='<%# Bind("year") %>' 
                            MaxLength="8"></asp:TextBox>
                   
                        
                    </li>
                    <li><span><%=appdata.GetLanguageString("EngineModel")%> </span>
                        <asp:TextBox ID="TxtEngine_Model" runat="server" 
                            Text='<%# Bind("enginmodel") %>' MaxLength="40"></asp:TextBox>
                   
                    
                   
                    </li>
                </ul>
            </fieldset>
            <fieldset>
                <legend><%=appdata.GetLanguageString("PartsInfo")%> </legend>
                <ul>
                    <li style="width:180px;" ><span><%=appdata.GetLanguageString("PartCondition")%></span>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("parttype") %>'>
                            <asp:ListItem Value="U">Used</asp:ListItem>
                            <asp:ListItem Value="N">New</asp:ListItem>
                        </asp:RadioButtonList>
                    </li>
                    <li><span style="width:300px;"><%=appdata.GetLanguageString("AutoPartsMoreDetails")%> </span>
                        <asp:TextBox ID="txtMoreDetails" Width="650px" TextMode="MultiLine" runat="server" 
                            Text='<%# Bind("moredetails") %>'></asp:TextBox>
                    </li>
                </ul>
            </fieldset>
            <fieldset>
                <legend><%=appdata.GetLanguageString("AutoShippingInfo")%> </legend>
                <ul>
                    <li style="width:900px;"><span><%=appdata.GetLanguageString("AutoPartsMoreDetails2")%> </span>
                        <asp:TextBox ID="TextBox7"  Width="650px" runat="server" Text='<%# Bind("shippingdetail") %>'></asp:TextBox>
                    </li>
                </ul>
                <br />
                
            </fieldset>
                
                
                
                   <br />
                   <br />
                <center class="js_a" >
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Submit your Request" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Clear" />
                </center>   
               
                </InsertItemTemplate>
            
            </asp:FormView>
       
       
       
                 <asp:ObjectDataSource ID="odsCountry" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
    </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="DataSet1TableAdapters.AutoPart_SelectTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="autoparts_ID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="firstname" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="chassisno" Type="String" />
                    <asp:Parameter Name="shippingdetail" Type="String" />
                    <asp:Parameter Name="make" Type="String" />
                    <asp:Parameter Name="makemodel" Type="String" />
                    <asp:Parameter Name="enginmodel" Type="String" />
                    <asp:Parameter Name="moredetails" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="parttype" Type="String" />
                    <asp:Parameter Name="country_id" Type="Int32" />
                    <asp:Parameter Name="year" Type="String" />
                    <asp:Parameter Name="autoparts_ID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="autoparts_ID" QueryStringField="id" 
                        Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="firstname" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="chassisno" Type="String" />
                    <asp:Parameter Name="shippingdetail" Type="String" />
                    <asp:Parameter Name="make" Type="String" />
                    <asp:Parameter Name="makemodel" Type="String" />
                    <asp:Parameter Name="enginmodel" Type="String" />
                    <asp:Parameter Name="moredetails" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="parttype" Type="String" />
                    <asp:Parameter Name="country_id" Type="Int32" />
                    <asp:Parameter Name="year" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource> 
            
        </div>
    </div>
</asp:Content>
