<%@ Page Title="-Display type-" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false" CodeFile="display_type.aspx.vb" Inherits="admin_display_type" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



         <ul class="myform_heading2">
            <span style="color:#3366CC"> Display </span>Type 
        </ul>
        
        <ul class="myform_line">
        </ul>   
    


 <div>
     <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" 
         DataKeyNames="ID" DataSourceID="display_type" ForeColor="#333333" CssClass="inputformtable" DefaultMode="Insert">
         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  />
         <RowStyle BackColor="#999999" ForeColor="#333333" />
         <InsertRowStyle BackColor="#F7F6F3" ForeColor="#333333" />
         
            <InsertItemTemplate>
             display_type:
             <asp:TextBox ID="display_typeTextBox" runat="server" 
                 Text='<%# Bind("display_type") %>' />
             <br />
             <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                 CommandName="Insert" Text="Insert" />
             &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel" Text="Cancel"  />
         </InsertItemTemplate>
      
         <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
         <EmptyDataTemplate>
             <table class="style1">
                 <tr>
                     <td>
                         -NO DATA-</td>
                 </tr>
                 <tr>
                     <td>
                         <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                             CommandName="New" Text="New" />
                     </td>
                 </tr>
             </table>
         </EmptyDataTemplate>
         <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <HeaderTemplate>
             DISPLAY TYPE
         </HeaderTemplate>
         <EditRowStyle BackColor="#999999" />
     </asp:FormView>
 
 </div>
<div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ID" DataSourceID="display_type" ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="display_type" HeaderText="DISPLAY_TYPE" 
                SortExpression="display_type" />
            <asp:BoundField DataField="ID" HeaderText="REF#" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
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
    <asp:ObjectDataSource ID="display_type" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert_DisplayType" 
        SelectMethod="GetData" TypeName="masterdataTableAdapters.display_typeTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="display_type" Type="String" />
            <asp:Parameter Name="Original_ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="display_type" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>

</div>

</asp:Content>

