<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="autoparts_US.aspx.vb" Inherits="autoparts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">





    <div id="myform">
        <ul class="myform_heading">
            <span style="color: #F0F0F0">Auto  </span> Parts
        </ul>
        <ul class="myform_line">
        </ul>
        <div class="content">
        
            <p>
                <b>Are You Looking For Auto Parts from Japan ?</b> <i>Many fully functional auto-parts
                    are found on Japanese used cars, which are very much in demand as spare parts for
                    the overseas market as well as in the domestic market. All appropriate car parts
                    are carefully selected by professionals. You can order all type of Used Car parts,
                    Auto Body Parts, Rebuilt Auto Parts, Refurbished Auto Parts, Auto Electrical Parts,
                    Engine Parts of all types of makes. </i>
                    
                    
            </p>
        
       
            <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" 
                DefaultMode="Insert"  Width="100%" DataKeyNames="autoparts_ID" >
           

           
                <InsertItemTemplate>
                
                
                       <ul>
                        <asp:ValidationSummary ID="valsummary" runat="server" CssClass="errormessages" DisplayMode="List">
                        </asp:ValidationSummary>
                    </ul>
                
                
                
                
                
                
                
                <fieldset>
                <legend>Contact Information </legend>
                <ul>
                    <li><span>First Name </span>
                        <asp:TextBox ID="txtfirstname" runat="server" Text='<%# Bind("firstname") %>' 
                            MaxLength="40"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                         runat="server" 
                        ErrorMessage="Required firstname" 
                        ControlToValidate="txtfirstname">
                        *</asp:RequiredFieldValidator>
                        
                    </li>
                    <li><span>Email </span>
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
                    <li><span>Phone </span>
                        <asp:TextBox ID="txtphone" runat="server" Text='<%# Bind("phone") %>' 
                            MaxLength="20"></asp:TextBox>
                   
                     <asp:RegularExpressionValidator ID="Regulartxtphone" runat="server" 
                                            ControlToValidate="txtphone" Display="Dynamic" ErrorMessage="Invalid Data" ValidationGroup="form"
                                            ValidationExpression="^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$">
                                        </asp:RegularExpressionValidator>
                   
                    </li>
                    <li><span>Country </span>
                        <asp:DropDownList ID="ddlcountry" runat="server" DataSourceID="odsCountry" 
                            DataTextField="CountryName"
                            DataValueField="Country_ID" SelectedValue='<%# Bind("country_ID") %>'>
                        </asp:DropDownList>
                    </li>
                </ul>
            </fieldset>
            <fieldset>
                <legend>Vehicle Info </legend>
                <ul>
                    <li><span>Make </span>
                        <asp:TextBox ID="TextMake" runat="server" Text='<%# Bind("make") %>' 
                            MaxLength="30"></asp:TextBox>
                   
                      <asp:RegularExpressionValidator ID="RegularMake" runat="server" 
                                            ControlToValidate="TextMake" Display="Dynamic" ErrorMessage="Invalid Data" ValidationGroup="form"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,40}$">
                      </asp:RegularExpressionValidator>
                   
                    </li>
                    <li><span>Make Model </span>
                        <asp:TextBox ID="Textmakemodel" runat="server" Text='<%# Bind("makemodel") %>' 
                            MaxLength="8"></asp:TextBox>
                    
                       <asp:RegularExpressionValidator ID="Regularmakemodel" ValidationGroup="form"
                                 runat="server" ControlToValidate="Textmakemodel" 
                                  ValidationExpression="^\d{2,4}(\/\d{1,2})?$" Display="Dynamic"
                                 ErrorMessage="Invalid Data">
                </asp:RegularExpressionValidator>
                    </li>
                    <li><span>Chassis No </span>
                        <asp:TextBox ID="txtchassisno" runat="server" Text='<%# Bind("chassisno") %>' 
                            MaxLength="40"></asp:TextBox>
                    
                     <asp:RegularExpressionValidator ID="Regularchassisno" ValidationGroup="form"
                     runat="server" ControlToValidate="txtchassisno" 
                     ValidationExpression="^[a-zA-Z0-9-]+$" Display="Dynamic"
                     ErrorMessage="Invalid Data">
                     </asp:RegularExpressionValidator>
                    
                    </li>
                    <li><span>Year </span>
                        <asp:TextBox ID="Txtyear" runat="server" Text='<%# Bind("year") %>' 
                            MaxLength="8"></asp:TextBox>
                   
                          <asp:RegularExpressionValidator ID="RegularTxtyear" ValidationGroup="form"
                                 runat="server" ControlToValidate="Txtyear" 
                                  ValidationExpression="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\d{4}$" Display="Dynamic"
                                 ErrorMessage="Valid format [dd/mm/yyy]">
                </asp:RegularExpressionValidator>
                    </li>
                    <li><span>Engine Model </span>
                        <asp:TextBox ID="TxtEngine_Model" runat="server" 
                            Text='<%# Bind("makemodel") %>' MaxLength="40"></asp:TextBox>
                   
                    <asp:RegularExpressionValidator ID="RegularEngine_Model" ValidationGroup="form"
                     runat="server" ControlToValidate="TxtEngine_Model" 
                     ValidationExpression="^[a-zA-Z0-9-]+$" Display="Dynamic"
                     ErrorMessage="Invalid Data">
                     </asp:RegularExpressionValidator>
                   
                    </li>
                </ul>
            </fieldset>
            <fieldset>
                <legend>Parts Info</legend>
                <ul>
                    <li style="width:180px;" ><span>Part Condition </span>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("parttype") %>'>
                            <asp:ListItem Value="U">Used</asp:ListItem>
                            <asp:ListItem Value="N">New</asp:ListItem>
                        </asp:RadioButtonList>
                    </li>
                    <li><span style="width:300px;" >More Details (Desc,parts number,etc) </span>
                        <asp:TextBox ID="TextBox6" Width="650px" TextMode="MultiLine" runat="server" 
                            Text='<%# Bind("moredetails") %>'></asp:TextBox>
                    </li>
                </ul>
            </fieldset>
            <fieldset>
                <legend>Shipping Info</legend>
                <ul>
                    <li style="width:900px;"><span>Details (If any shipping preferences please tell us) </span>
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
