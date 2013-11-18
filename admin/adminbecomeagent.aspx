<%@ Page Title="-Become Our Agent-" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false" CodeFile="adminbecomeagent.aspx.vb" Inherits="admin_adminbecomeagent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  
 
      
       
  
    <ul class="myform_heading2">
    <span style="color: #3366CC">Become Our </span> Agent
        </ul>
    
    <ul class="myform_line"></ul>
  <div id="myform">
  
 <asp:FormView ID="FormView1" runat="server" DataKeyNames="becomeagent_ID" 
        DataSourceID="ObjectDataSource1" DefaultMode="Edit">
      
      
      
      
       <EditItemTemplate>
        
        
        
  <div class="content">
                <asp:HiddenField ID="H_ID" runat="server" Value='<%# Eval("AuditInfo_ID") %>' />
                    <fieldset> <legend> Car Sell - Request </legend>

                        <ul>
                            <li><span>First Name:</span>
                                <asp:TextBox ID="txtfirst_name" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                            </li>
                            <li><span>Last Name: </span>
                                <asp:TextBox ID="txtLast_Name" runat="server" Text='<%# Eval("LastName") %>'></asp:TextBox>
                            </li>
                        </ul>
                        <ul>
                            <li><span>Mobile </span>
                                <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:TextBox>
                            </li>
                            <li><span>Office Phone </span>
                                <asp:TextBox ID="txtPhone" runat="server" Text='<%# Eval("Tele_Office") %>'></asp:TextBox>
                            </li>
                        </ul>
                        <ul>
                            <li><span>Email:</span>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                            </li>
                            <li><span>Company Name: </span>
                                <asp:TextBox ID="txtcompanyname" runat="server" Text='<%# Eval("CompanyName") %>'></asp:TextBox>
                            </li>
                        </ul>
                        <ul>
                            <li><span>Country: </span>
                                <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odsCountry" DataTextField="CountryName"
                                    DataValueField="Country_ID" SelectedValue='<%# Eval("Country_ID") %>'>
                                </asp:DropDownList>
                            </li>
                            <li><span>City: </span>
                                <asp:TextBox ID="txtCity" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
                            </li>
                        </ul>
                        <ul>
                            <li><span>Additional Comments: </span>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("Additional_Remarks") %>'></asp:TextBox>
                            </li>
                        </ul>
                    </fieldset>
                    
                    <fieldset>
                        <legend>Reply </legend>
                        <ul><li>
                             Status&nbsp; 
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsLegend" 
                        DataTextField="LegendName" DataValueField="Legend_ID" 
                        SelectedValue='<%# Bind("Request_Status") %>'>
                    </asp:DropDownList>
                
                    <asp:ObjectDataSource ID="odsLegend" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="Select_status" 
                        TypeName="masterdataTableAdapters.legendTableAdapter">
                    </asp:ObjectDataSource>
                    </li>
                        </ul>
                        <ul>
                            <li style="width: 100%;"><span>Staff Comments</span>
                                <asp:TextBox ID="txtmessagereply" TextMode="MultiLine" Width="95%" Height="60px"
                                    runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                            </li>
                        </ul>
                    </fieldset>
                    <ul>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </ul>
                    <ul>
                        <asp:ValidationSummary ID="valsummary" runat="server" CssClass="errormessages" DisplayMode="List">
                        </asp:ValidationSummary>
                    </ul>
                    <fieldset>
                        <asp:ObjectDataSource ID="odsRecordUpdateInfo" runat="server" SelectMethod="GetData"
                            TypeName="dsAdminTableAdapters.Get_RecordUpdateInfoTableAdapter" 
                            OldValuesParameterFormatString="original_{0}">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="H_ID" Name="auditInfo_ID" PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <legend>Record Update Info </legend>
                        <ul style="color: Gray;">
                            <asp:DataList ID="DataList1" runat="server" DataSourceID="odsRecordUpdateInfo" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    Create_at:
                                    <asp:Label ID="lblcreate_at" runat="server" Text='<%# Eval("Created_At") %>' Width="150px" />
                                    Create_by:
                                    <asp:Label ID="lblcreate_by" runat="server" Text='<%# Eval("Created_By") %>' />
                                    Last_updated_at:
                                    <asp:Label ID="lbllast_updated_at" runat="server" Text='<%# Eval("last_updated_at") %>'
                                        Width="150px" />
                                    Last_updated_by:
                                    <asp:Label ID="last_updated_byLabel" runat="server" Text='<%# Eval("last_updated_by") %>' />
                                </ItemTemplate>
                            </asp:DataList>
                        </ul>
                    </fieldset>
                </div>
  
  
  

                
         
                
  </EditItemTemplate>
      
    </asp:FormView>
  
  
  
</div>

    <asp:ObjectDataSource ID="odsCountry" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Select_allCountries" 
        TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" 
    TypeName="dsServicesTableAdapters.becomeagentTableAdapter" DeleteMethod="Delete" 
        UpdateMethod="Update" OldValuesParameterFormatString="{0}" 
        InsertMethod="Insert">
        <DeleteParameters>
            <asp:Parameter Name="becomeagent_ID" Type="Int32" />
        </DeleteParameters>
       
       
        <UpdateParameters>
            <asp:QueryStringParameter Name="becomeagent_ID" 
                QueryStringField="becomeagent_id" Type="Int32" />
            <asp:Parameter Name="Request_Status" Type="Int32" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:SessionParameter Name="user_ID" SessionField="user_keyid" Type="Int32" />
        </UpdateParameters>
       
       
       
       
       
       
       
       
       
        <SelectParameters>
            <asp:QueryStringParameter Name="becomeagent_ID" 
                QueryStringField="becomeagent_ID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
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

