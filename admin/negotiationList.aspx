<%@ Page Title="-Negotiation List-" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false"
    CodeFile="negotiationList.aspx.vb" Inherits="admin_negotiationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
        <span style="color:#3366CC">Negotiation </span>List
    </ul>
    <ul class="myform_line">
    </ul>
    
  <div id="myform">
 <div class="content">
       <fieldset> 
      <ul class="admin_form_css1">
            <span>Customer ID </span>
             <asp:DropDownList ID="ddlCustomerID" runat="server" 
             DataSourceID="odsmembersALL" DataTextField="membership" 
             DataValueField="customer_ID">
         </asp:DropDownList>
         
          <asp:ObjectDataSource ID="odsmembersALL" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="membersTableAdapters.Select_AllMembersTableAdapter">
                </asp:ObjectDataSource>
        </ul>
      <ul class="admin_form_css2">
            <span>Start_Date </span>
            <asp:TextBox ID="txtStart_Date" runat="server"></asp:TextBox>
            <span>End_Date </span>
            <asp:TextBox ID="txtEnd_Date" runat="server"></asp:TextBox>
             
            <span>Ref </span>
            <asp:TextBox ID="txtref" runat="server"></asp:TextBox>
            
            &nbsp;&nbsp;&nbsp;
             <asp:Button ID="cmdSearch" runat="server" CssClass="btn_action" Text="Search" />
        </ul>
        
  
     <br />
      <ul>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" 
                GridLines="None">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="Time_Stamp" DataFormatString="{0:dd-MMM-yyyy HH:mm}" HeaderText="Time_Stamp"
                        SortExpression="Time_Stamp" >
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FILE_REF" HeaderText="Stock  Ref" 
                        SortExpression="FILE_REF" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Client_Name" HeaderText="Client_Name" SortExpression="Client_Name" />
                    <asp:BoundField DataField="Client_Email" HeaderText="Client_Email" SortExpression="Client_Email" />
                    <asp:BoundField DataField="CHASSIS_NO" HeaderText="CHASSIS_NO" 
                        SortExpression="CHASSIS_NO" >
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="make" HeaderText="Make" SortExpression="make" />
                    <asp:BoundField DataField="color" HeaderText="Color" SortExpression="color" />
                    <asp:BoundField DataField="MODEL" HeaderText="Year" SortExpression="MODEL" />
                    <asp:BoundField DataField="FOB_PRICE" HeaderText="FOB_PRICE" SortExpression="FOB_PRICE" />
                    <asp:HyperLinkField DataNavigateUrlFields="negtiation_ID" DataNavigateUrlFormatString="negodetails.aspx?id={0}"
                        DataTextField="negtiation_ID" DataTextFormatString="View Details" Text="Details" />
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
    </div>
  </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsServicesTableAdapters.select_negoListTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStart_Date" Name="start_Date" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtEnd_Date" Name="end_Date" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtref" Name="ref" PropertyName="Text" 
                Type="String" DefaultValue="" />
            <asp:ControlParameter ControlID="ddlCustomerID" Name="customer_ID" PropertyName="SelectedValue"
                Type="Int32" DefaultValue="0" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
