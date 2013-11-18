<%@ Page Title="-Auto Details-" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false" CodeFile="autopartdetails.aspx.vb" Inherits="admin_autopartdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
         
         
         
         <ul class="myform_heading">
            <span style="color:#3366CC">Auto Parts</span> / Accessories
        </ul>
        
        <ul class="myform_line">
        </ul>   
    
     <div id="myform">
 
 <div class="content">

 
 
     <asp:FormView ID="FormView1" runat="server" DataKeyNames="autoparts_ID" 
         DataSourceID="ObjectDataSource2" DefaultMode="Edit">
         <EditItemTemplate>
         
         
         
         
             
            <fieldset>
                <legend>Contact Information </legend>
                   <ul>
                    <li><span>First Name </span>
                        <asp:TextBox ID="txtfirstname" runat="server" Text='<%# Bind("firstname") %>'></asp:TextBox>
                    
                    </li>
                    <li><span>Email </span>
                       
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
               
                        
           
                        
                       
                        </li>
                </ul>
                <ul>
                
                    <li><span>Phone </span>
                        <asp:TextBox ID="txtphone" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                    </li>
                    <li><span>Country </span>
                  
                    <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odsCountry" 
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
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("make") %>'></asp:TextBox>
                    </li>
                    <li><span>Model </span>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("makemodel") %>'></asp:TextBox>
                    </li>
                    <li><span>Chassis No </span>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("chassisno") %>'></asp:TextBox>
                    </li>
                    <li><span>Year </span>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("year") %>'></asp:TextBox>
                    </li>
                    <li><span>Engine Model </span>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("enginmodel") %>'></asp:TextBox>
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
            <fieldset>
                        <legend>Reply </legend>
                        <ul>
                              <asp:CheckBox ID="chkActionTaken" Text="Action Taken on Request " runat="server"
                                Checked='<%# Bind("Action_Taken") %>' />
                        </ul>
                        <ul>
                            <li style="width: 100%;"><span>Staff Comments</span>
                                <asp:TextBox ID="txtmessagereply" TextMode="MultiLine" Width="95%" Height="60px"
                                    runat="server" Text='<%# Bind("Staff_Remarks") %>'></asp:TextBox>
                            </li>
                        </ul>
                    </fieldset>
            
            
            
             <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                 CommandName="Update" Text="Update" />
             &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel" Text="Cancel" />
         </EditItemTemplate>
        
     </asp:FormView>
     
     
     
     
     
     
     
     
     
     
     
     
     
     <asp:ObjectDataSource ID="odsCountry" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_allCountries" 
         TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
    </asp:ObjectDataSource>
         <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
         DeleteMethod="Delete" InsertMethod="update" 
         OldValuesParameterFormatString="{0}" SelectMethod="GetData" 
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
             <asp:QueryStringParameter Name="autoparts_ID" QueryStringField="ID" 
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

