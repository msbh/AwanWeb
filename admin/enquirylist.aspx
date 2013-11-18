<%@ Page Title="-Client Enquiry List-" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false"
    CodeFile="enquirylist.aspx.vb" Inherits="admin_enquirylist" %>
 
 
 

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
            <span style="color:#3366CC"> Client Enquiry </span>List 
        </ul>
        
        <ul class="myform_line">
        </ul>   

 
 
 
      
<div id="myform" > 
 <div class="content">

 
    <fieldset> 
 <ul>
       <span> Enquiry Ref </span>  
     <asp:TextBox ID="txtenqiryref" runat="server" Width="90px"></asp:TextBox>
 
    <span>  Stock No   </span>
     <asp:TextBox ID="txtstockno" runat="server" Width="100px"></asp:TextBox>
    
      <span>  From   </span>
     <asp:TextBox ID="txtStart_Date" runat="server"></asp:TextBox>
     
      <span>  Till   </span>
     <asp:TextBox ID="txtEnd_Date" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
     
 <asp:Button ID="cmdSearch" runat="server" CssClass="btn_action" Text="Search" />
 </ul>
     <br />
      
<ul>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Enquiry_ID" Width="100%" DataSourceID="ObjectDataSource1" 
        CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" 
        AllowSorting="True" PageSize="30">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="Enquiry_ID" HeaderText="Enquiry_ID" ReadOnly="True" 
                SortExpression="Enquiry_ID" />
            <asp:BoundField DataField="Enquiry_DateTime" HeaderText="Enquiry_DateTime" 
                SortExpression="Enquiry_DateTime" ReadOnly="True" />
            <asp:BoundField DataField="FILE_REF" HeaderText="Stock No" 
                SortExpression="FILE_REF" >
                <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="CHASSIS_NO" HeaderText="Chassis No" 
                SortExpression="CHASSIS_NO" />
            <asp:BoundField DataField="Message" HeaderText="Message" 
                SortExpression="Message" />
            <asp:HyperLinkField DataNavigateUrlFields="Enquiry_ID" 
                DataNavigateUrlFormatString="adminenquirydetails.aspx?enquiry_id={0}" 
                Text="View Details" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    </ul>
      </fieldset> 
     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
         OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
         TypeName="dsAdminTableAdapters.Select_EnquiryListTableAdapter">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtStart_Date" Name="SDATE" PropertyName="Text" 
                 Type="String" />
             <asp:ControlParameter ControlID="txtEnd_Date" Name="EDATE" PropertyName="Text" 
                 Type="String" />
             <asp:ControlParameter ControlID="txtenqiryref" Name="EnquiryRef" 
                 PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtstockno" DefaultValue=" " Name="FILE_REF" 
                 PropertyName="Text" Type="String" />
         </SelectParameters>
     </asp:ObjectDataSource>
 </div>
    
     </div>

</asp:Content>

