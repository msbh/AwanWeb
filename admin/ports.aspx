<%@ Page Title="-Ports Master-" Language="VB" MasterPageFile="~/admin/MasterPage.master" 
AutoEventWireup="false" CodeFile="ports.aspx.vb" Inherits="admin_ports" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
            <span style="color: #3366CC">Ports </span>
        </ul>
        
        <ul class="myform_line">
        </ul>
   

 <div>
     &nbsp;
     <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" 
        DataKeyNames="port_ID" DataSourceID="odsPorts" 
         DefaultMode="Insert" Width="315px" CssClass="inputformtable">
         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <RowStyle BackColor="#CCCCCC" ForeColor="#333333" />
     
        
     
         <EditItemTemplate>
             ID:
             <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
             <br />
             port_ID:
             <asp:Label ID="port_IDLabel1" runat="server" Text='<%# Eval("port_ID") %>' />
             <br />
             portName:
             <asp:TextBox ID="portNameTextBox" runat="server" 
                 Text='<%# Bind("portName") %>' />
             <br />
             Country_ID:
             <asp:TextBox ID="Country_IDTextBox" runat="server" 
                 Text='<%# Bind("Country_ID") %>' />
             <br />
             <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                 CommandName="Update" Text="Update" />
             &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel" Text="Cancel" />
         </EditItemTemplate>
     
        
     
         <InsertItemTemplate>
             portName:
             <asp:TextBox ID="portNameTextBox" runat="server" 
                 Text='<%# Bind("portName") %>' />
             <br />
             Country:&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" 
                 DataSourceID="odsCountry" DataTextField="CountryName" 
                 DataValueField="Country_ID" SelectedValue='<%# Bind("Country_ID") %>'>
             </asp:DropDownList>
             <br />
             <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                 CommandName="Insert" Text="Insert" />
             &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel" Text="Cancel" />
         </InsertItemTemplate>
        
      
        
       
         <ItemTemplate>
             ID:
             <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
             <br />
             port_ID:
             <asp:Label ID="port_IDLabel" runat="server" Text='<%# Eval("port_ID") %>' />
             <br />
             portName:
             <asp:Label ID="portNameLabel" runat="server" Text='<%# Bind("portName") %>' />
             <br />
             Country_ID:
             <asp:Label ID="Country_IDLabel" runat="server" 
                 Text='<%# Bind("Country_ID") %>' />
             <br />
             <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                 CommandName="Edit" Text="Edit" />
             &nbsp;<asp:LinkButton ID="lnkdelete" runat="server" CausesValidation="False" 
                 CommandName="Delete" Text="Delete" />
             &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                 CommandName="New" Text="New" />
         </ItemTemplate>
        
      
        
       
         <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <HeaderTemplate>
           Ports 
         </HeaderTemplate>
         <EditRowStyle BackColor="#CCCCCC" />
     </asp:FormView>
 
 
 <br />
 
     <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
 
     </div>
     
<div>
    <asp:GridView ID="GridView1" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="port_ID" DataSourceID="odsPorts" ForeColor="#333333" 
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
            <asp:BoundField DataField="port_ID" HeaderText="port_ID" 
                SortExpression="port_ID" />
            <asp:BoundField DataField="portName" HeaderText="portName" 
                SortExpression="portName" />
             <asp:TemplateField HeaderText="Country" SortExpression="Country_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsCountry" 
                        DataTextField="CountryName" DataValueField="Country_ID" 
                        SelectedValue='<%# Bind("Country_ID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("globalLocation") %>'></asp:Label>
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
    <asp:ObjectDataSource ID="odsPorts" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" TypeName="masterdataTableAdapters.tblportTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_port_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="portName" Type="String" />
            <asp:Parameter Name="Country_ID" Type="Int32" />
            <asp:Parameter Name="Original_port_ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="portName" Type="String" />
            <asp:Parameter Name="Country_ID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="odsCountry" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Select_allCountries" 
        TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter"></asp:ObjectDataSource>

</div>
</ContentTemplate>

 </asp:UpdatePanel>
</asp:Content>

