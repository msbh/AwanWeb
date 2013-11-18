<%@ Page Title="-Frieght Chargesr-" Language="VB" MasterPageFile="~/admin/MasterPage.master" 
AutoEventWireup="false" CodeFile="freightcharges.aspx.vb"
 Inherits="admin_freightcharges" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" language="javascript">
        function ConfirmOnDelete(item)
        {
          if (confirm("Are you sure to delete: " + item + "?")==true)
            return true;
          else
            return false;
        }
        </script>
   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>


      <ul class="myform_heading2">
            <span style="color:#3366CC"> Frieght Charges </span>
        </ul>
        
        <ul class="myform_line">
        </ul>   
 <div>
     <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
     CellPadding="4" 
        DataKeyNames="keyID" DataSourceID="odsTransstatus" 
         OnDataBound="FormView1_DataBound" 
        OnItemInserting="FormView1_ItemInserting" 
         DefaultMode="Insert" Width="315px" CssClass="inputformtable">
         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <RowStyle BackColor="#CCCCCC" ForeColor="#333333" />
     
     
         <InsertItemTemplate>
            
     
             <table class="style1">
                 <tr>
                     <td>
                         <asp:Label ID="Label1" runat="server" Text="Country"></asp:Label>
                     </td>
                     <td>
                         <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odscountry" 
                             DataTextField="CountryName" DataValueField="Country_ID" 
                             SelectedValue='<%# Bind("Country_ID") %>' AutoPostBack="True" 
                             onselectedindexchanged="ddlCountry_SelectedIndexChanged" >
                         </asp:DropDownList>
                     </td>
                     <td>
                         <asp:Label ID="Label2" runat="server" Text="Port"></asp:Label>
                     </td>
                     <td>
                         <asp:DropDownList ID="ddlPort" runat="server" DataSourceID="odsport" 
                             DataTextField="portname" DataValueField="port_id" 
                              >
                             
                            
                             
                         </asp:DropDownList>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Label ID="Label3" runat="server" Text="Freight"></asp:Label>
                     </td>
                     <td>
                         <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Freight") %>'></asp:TextBox>
                     </td>
                     <td>
                         <asp:Label ID="Label4" runat="server" Text="Inspection"></asp:Label>
                     </td>
                     <td>
                         <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Inspection") %>'></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Label ID="Label5" runat="server" Text="Currency"></asp:Label>
                     </td>
                     <td>
                         <asp:DropDownList ID="ddlCurrency" runat="server" DataSourceID="odscurrency" 
                             DataTextField="currency_name" DataValueField="currency_ID" 
                             SelectedValue='<%# Bind("Curr_ID") %>'>
                         </asp:DropDownList>
                     </td>
                     <td>
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
             </table>
            
     
             <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                 CommandName="Insert" Text="Insert" />
             &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel" Text="Cancel" />
      
          <asp:ObjectDataSource ID="odsport" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_Port_ByCountryID" TypeName="masterdataTableAdapters.Select_PortTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCountry" DefaultValue="1" Name="country_ID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odscountry" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
    </asp:ObjectDataSource>
      
      
         </InsertItemTemplate>
        
            
         <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <HeaderTemplate>
            Country
         </HeaderTemplate>
         <EditRowStyle BackColor="#CCCCCC" />
         
         
         
    
    
     </asp:FormView>
 
 
 <br />
 
     <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
 
     </div>
     
<div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="keyID" DataSourceID="odsTransstatus" ForeColor="#333333" 
        GridLines="None" PageSize="100">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
           <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lnkdelete" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="keyID" HeaderText="keyID" 
                SortExpression="keyID" ReadOnly="True" />
            <asp:TemplateField HeaderText="CountryName" SortExpression="CountryName">
               
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CountryName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="portName" SortExpression="portName">
                <EditItemTemplate>
                  <asp:DropDownList ID="ddlCountry2" runat="server" DataSourceID="odscountry" 
                        DataTextField="CountryName" DataValueField="Country_ID" 
                        SelectedValue='<%# Bind("Country_ID") %>'>
                    </asp:DropDownList>
                
                
                    <asp:DropDownList ID="ddlport2" runat="server" DataSourceID="odsport" 
                        DataTextField="portname" DataValueField="port_id" 
                        SelectedValue='<%# Bind("Port_ID") %>'>
                    </asp:DropDownList>
               
               
                 <asp:ObjectDataSource ID="odsport" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_Port_ByCountryID" TypeName="masterdataTableAdapters.Select_PortTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCountry2" DefaultValue="1" Name="country_ID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odscountry" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
    </asp:ObjectDataSource>
               
               
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("portName") %>'></asp:Label>
                </ItemTemplate>
          
           
            </asp:TemplateField>
            <asp:BoundField DataField="Freight" HeaderText="Freight" 
                SortExpression="Freight" />
            <asp:BoundField DataField="Inspection" HeaderText="Inspection" 
                SortExpression="Inspection" />
            <asp:TemplateField HeaderText="Currency_Name" SortExpression="Currency_Name">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="odscurrency" 
                        DataTextField="currency_name" DataValueField="currency_ID" 
                        SelectedValue='<%# Bind("Curr_ID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Currency_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    
    
       
    
    </asp:GridView>

</div>

<div>
   
    <asp:ObjectDataSource ID="odsTransstatus" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" SelectMethod="GetData" 
        TypeName="dsServicesTableAdapters.transChargesTableAdapter" 
        UpdateMethod="Update" OldValuesParameterFormatString="{0}">
        <DeleteParameters>
            <asp:Parameter Name="keyID" Type="Int32" />
             <asp:SessionParameter DefaultValue="0" Name="user_ID" SessionField="user_keyid" 
                Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="keyID" Type="Int32" />
            <asp:Parameter Name="Country_ID" Type="Int32" />
            <asp:Parameter Name="Port_ID" Type="Int32" />
            <asp:Parameter Name="Freight" Type="Decimal" />
            <asp:Parameter Name="Inspection" Type="Decimal" />
            <asp:Parameter Name="Curr_ID" Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="user_ID" SessionField="user_keyid" 
                Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Country_ID" Type="Int32" />
            <asp:Parameter Name="Port_ID" Type="Int32" />
            <asp:Parameter Name="Freight" Type="Decimal" />
            <asp:Parameter Name="Inspection" Type="Decimal" />
            <asp:Parameter Name="Curr_ID" Type="Int32" />
              <asp:SessionParameter DefaultValue="0" Name="user_ID" SessionField="user_keyid" 
                Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odscurrency" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="masterdataTableAdapters.currency_masterTableAdapter">
    </asp:ObjectDataSource>

</div>
</ContentTemplate>

 </asp:UpdatePanel>
</asp:Content>

