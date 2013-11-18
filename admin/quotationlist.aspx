<%@ Page Title="-QuotationList-" Language="VB" MasterPageFile="~/admin/MasterPage.master" 
AutoEventWireup="false" CodeFile="quotationlist.aspx.vb" Inherits="admin_quotationlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <script type="text/javascript">
        $(document).ready(function() {


        $('#<%=txtStart_Date.clientid %>').datepicker({
                dateFormat: 'd-M-yy',
                inline: true,
                showButtonPanel: true,
                changeMonth: true,
                changeYear: true,
                minDate: -3000,
                maxDate: 3000
            });

            $('#<%=txtEnd_Date.clientid %>').datepicker({
                dateFormat: 'd-M-yy',
                inline: true,
                showButtonPanel: true,
                changeMonth: true,
                changeYear: true,
                minDate: -3000,
                maxDate: 3000
            });
            

      
            
        })
  
  </script>
 
 
 



 <ul class="myform_heading2">
            <span style="color:#3366CC">Quotation</span> List
        </ul>
        <ul class="myform_line">
        </ul>
        
   <div id="myform"> 
 <div class="content">
    <fieldset>
 
   <ul>
         <span>Customer ID </span>
       <asp:DropDownList ID="ddlCustomerID" runat="server" 
             DataSourceID="odsmembersALL" DataTextField="membership" 
             DataValueField="customer_ID">
         </asp:DropDownList>
         
          <asp:ObjectDataSource ID="odsmembersALL" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="membersTableAdapters.Select_AllMembersTableAdapter">
                </asp:ObjectDataSource>
     </ul>
     <ul>
         <span>Start_Date </span>
         <asp:TextBox ID="txtStart_Date" runat="server" Width="96px"></asp:TextBox>
         <span>End_Date </span>
         <asp:TextBox ID="txtEnd_Date" runat="server" Width="96px"></asp:TextBox>
         <span>Chassis_NO </span>
         <asp:TextBox ID="txtChassis_NO" runat="server" MaxLength="30" Width="123px"></asp:TextBox>
         
         <span>Quote Ref </span>
         <asp:TextBox ID="txtQuoteNO" Width="45px" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
          
         <asp:Button ID="cmdSearch" runat="server" CssClass="btn_action" Text="Search" />
     </ul>
     <ul>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="Quote_ID" DataSourceID="ObjectDataSource1" CellPadding="4" 
             ForeColor="#333333" GridLines="None">
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
             <Columns>
                 <asp:BoundField DataField="Date" HeaderText="Date" 
                     SortExpression="Date" />
                 <asp:BoundField DataField="Quote_ID" HeaderText="Quote_ID"  
                     SortExpression="Quote_ID" />
                 <asp:BoundField DataField="Quote_Ref" HeaderText="Quote_Ref" 
                     SortExpression="Quote_Ref" >
                     <HeaderStyle Wrap="False" />
                 </asp:BoundField>
                 <asp:BoundField DataField="FILE_REF" HeaderText="FILE_REF" 
                     SortExpression="FILE_REF" >
                     <HeaderStyle Wrap="False" />
                     <ItemStyle HorizontalAlign="Center" Wrap="False" />
                 </asp:BoundField>
                 <asp:BoundField DataField="CHASSIS_NO" HeaderText="CHASSIS_NO" 
                     SortExpression="CHASSIS_NO" >
                     <HeaderStyle Wrap="False" />
                 </asp:BoundField>
                 <asp:BoundField DataField="model_description" HeaderText="model_description" 
                     SortExpression="model_description" />
                 <asp:BoundField DataField="TTL_Amount" HeaderText="TTL_Amount" 
                     SortExpression="TTL_Amount" >
                     <HeaderStyle Wrap="False" />
                 </asp:BoundField>
                 <asp:BoundField DataField="portName" HeaderText="portName" 
                     SortExpression="portName" />
                 <asp:BoundField DataField="CountryName" HeaderText="CountryName" 
                     SortExpression="CountryName" />
                 <asp:BoundField DataField="paymentmodeTEXT" HeaderText="PaymentMode" 
                     SortExpression="paymentmodeTEXT" />
                 <asp:HyperLinkField DataNavigateUrlFields="Quote_ID" 
                     DataNavigateUrlFormatString="quoteadmindetail.aspx?ID={0}" 
                     DataTextField="Quote_ID" DataTextFormatString="View" HeaderText="Details" 
                     Text="View Details" />
             </Columns>
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <EditRowStyle Wrap="False" BackColor="#999999" />
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         </asp:GridView>
     </ul>
     </fieldset>
     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
         OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
         TypeName="dsAdminTableAdapters.Quote_List_AdminTableAdapter">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtStart_Date" Name="start_Date" 
                 PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtEnd_Date" Name="end_Date" 
                 PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtChassis_NO" Name="chassis_no" 
                 PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtQuoteNO" Name="quote_ref" 
                 PropertyName="Text" Type="String" DefaultValue="" />
             <asp:ControlParameter ControlID="ddlCustomerID" DefaultValue="0" 
                 Name="customer_ID" PropertyName="SelectedValue" Type="Int32" />
         </SelectParameters>
     </asp:ObjectDataSource>
 
 
 
 
 </div>
</div>


</asp:Content>

