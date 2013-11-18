<%@ Page Title="-Stock Enquiry-" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false" CodeFile="adminEnquiryDetails.aspx.vb" Inherits="admin_adminEnquiryDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
        
        
           
    

    
    
                  
         <ul class="myform_heading2">
            <span style="color:#3366CC"> Stock</span> Enquiry
        </ul>
        
        <ul class="myform_line">
        </ul>   
    
    <div id="myform">
      
        
        
        
        <div class="content">
            <asp:FormView ID="FormView1" runat="server" 
            DataSourceID="odsEnquiry"  Width="100%"  DefaultMode="Edit"  >
                <EditItemTemplate>
                    <fieldset>
                        <legend>Stock details </legend>
                        <ul>
                           
                            <li><span>Stock No </span>
                                <asp:TextBox ID="txtStockNo" Enabled="False" runat="server" 
                                    Text='<%# Eval("FILE_REF") %>'></asp:TextBox>
                           
                           
                           <asp:HiddenField ID="H_ID" runat="server" Value='<%# Eval("AuditInfo_ID") %>' />
                           
                            </li>
                            <li><span>Chassis No </span>
                                <asp:TextBox ID="txtChassisno" Enabled="False" runat="server" 
                                    Text='<%# Eval("CHASSIS_NO") %>'></asp:TextBox>
                            </li>
                        </ul>
                        <ul>
                            <li><span>Make </span>
                                <asp:DropDownList ID="ddlMake" runat="server" Enabled="False" DataSourceID="odsMake"
                                    DataTextField="make" DataValueField="makeID" 
                                    SelectedValue='<%# Eval("MAKE_ID") %>'>
                                </asp:DropDownList>
                            </li>
                            <li><span>Make Model </span>
                                <asp:DropDownList ID="ddlMakeModel" runat="server" Enabled="False" DataSourceID="odsMakeDetails"
                                    DataTextField="model_description" DataValueField="ID" 
                                    SelectedValue='<%# Eval("MAKE_MODEL_ID") %>'>
                                </asp:DropDownList>
                            </li>
                        </ul>
                        <ul>
                            <li><span>Model Year</span>
                                <asp:TextBox ID="txtModelYear" Enabled="False" runat="server" 
                                    Text='<%# Eval("MODEL") %>'></asp:TextBox>
                            </li>
                            <li><span>Drive </span>
                                <asp:TextBox ID="txtDrive" Enabled="False" runat="server" 
                                    Text='<%# Eval("DRIVE") %>'></asp:TextBox>
                            </li>
                        </ul>
                        <ul>
                            <li style="width: 100%;"><span>Your Message</span>
                                <asp:TextBox ID="txtmessage" TextMode="MultiLine" Enabled="False" Width="95%" 
                                    Height="60px" runat="server"
                                    Text='<%# Eval("Message") %>'></asp:TextBox>
                            </li>
                        </ul>
                    </fieldset>
                  
                     <fieldset>
                   <legend>Contact Info </legend>
                        <ul>
                            <li><span>Name </span>
                                <asp:TextBox ID="txtFirstName" Enabled="false"   runat="server" Text='<%# Eval("FirstName") %>' 
                                    ReadOnly="True" ></asp:TextBox>
                            </li>
                            <li><span>Email </span>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Email") %>' 
                                    Enabled="false"   ></asp:TextBox>
                            </li>
                            <li><span>Company </span>
                                <asp:TextBox ID="txtCompany" runat="server" Text='<%# Eval("CompanyName") %>' 
                                    Enabled="false"  ></asp:TextBox>
                            </li>
                            <li><span>Contact No </span>
                                <asp:TextBox ID="txtcontactno" runat="server" Enabled="false" 
                                    Text='<%# Eval("Contact_No") %>'></asp:TextBox>
                            </li>
                            <li><span>Country </span>
                                <asp:DropDownList ID="ddlCountry" runat="server" Enabled="False"   
                                    DataSourceID="odsCountry" DataTextField="CountryName"
                                    DataValueField="Country_ID" SelectedValue='<%# Eval("Country_ID") %>'>
                                </asp:DropDownList>
                            </li>
                            <li><span>City </span>
                                <asp:TextBox ID="txtcity" Enabled="false"  runat="server" 
                                    Text='<%# Eval("City") %>'></asp:TextBox>
                            </li>
                          
                        </ul>
                  
                 </fieldset>
                  
                  <fieldset> <legend> Reply </legend>
                    
                    <ul> 
                      <asp:CheckBox ID="chkActionTaken" Text="Action Taken on Enquiry " 
                       runat="server" 
                          Checked='<%# Bind("Action_Taken") %>' />
                     </ul>
                    <ul>
                            <li style="width: 100%;"><span>Awan International K.K replied Message</span>
                                <asp:TextBox ID="txtmessagereply" TextMode="MultiLine" 
                                    Width="95%" Height="60px" runat="server"
                                    Text='<%# Bind("Reply_Message") %>'></asp:TextBox>
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
                            TypeName="dsAdminTableAdapters.Get_RecordUpdateInfoTableAdapter">
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
                      
                 
                         
              
                      
                    
                </EditItemTemplate>
              
              
         
              
            </asp:FormView>
        
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
    <asp:ObjectDataSource ID="odsEnquiry" runat="server" SelectMethod="GetData"
        TypeName="dsStockTableAdapters.SELECT_ClientEnquiryTableAdapter" DeleteMethod="Delete_Enquiry" 
        UpdateMethod="Update_Enquiry">
        <DeleteParameters>
            <asp:Parameter Name="Original_Enquiry_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:QueryStringParameter Name="Enquiry_ID" QueryStringField="enquiry_id" 
                Type="Int32" />
            <asp:Parameter Name="Reply_Message" Type="String" />
            <asp:Parameter Name="action_taken" Type="Boolean" />
            <asp:SessionParameter DefaultValue="" Name="user_ID" SessionField="user_keyid" 
                Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Enquiry_ID" QueryStringField="enquiry_id" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
 
    <asp:HiddenField ID="HStock_ID" runat="server" />
 

</asp:Content>

