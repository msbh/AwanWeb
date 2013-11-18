<%@ Page Title="-Vehicle Colors-" Language="VB" MasterPageFile="~/admin/MasterPage.master" 
AutoEventWireup="false" CodeFile="colors.aspx.vb" Inherits="admin_colors" %>



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
            <span style="color:#3366CC"> Vehicle </span>Colors
        </ul>
        
        <ul class="myform_line">
        </ul>   
    

 <div>
     <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" 
        DataKeyNames="id" DataSourceID="odscolor" 
         DefaultMode="Insert" Width="315px" CssClass="inputformtable">
         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <RowStyle BackColor="#CCCCCC" ForeColor="#333333" />
     
         <EditItemTemplate>
             id:
             <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
             <br />
             color:
             <asp:TextBox ID="colorTextBox" runat="server" Text='<%# Bind("color") %>' />
             <br />
             <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                 CommandName="Update" Text="Update" />
             &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel" Text="Cancel" />
         </EditItemTemplate>
     
         <InsertItemTemplate>
             id:
             <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
             <br />
             color:
             <asp:TextBox ID="colorTextBox" runat="server" Text='<%# Bind("color") %>' />
             <br />
             <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                 CommandName="Insert" Text="Insert" />
             &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel" Text="Cancel" />
         </InsertItemTemplate>
        
         <ItemTemplate>
             id:
             <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
             <br />
             color:
             <asp:Label ID="colorLabel" runat="server" Text='<%# Bind("color") %>' />
             <br />
             <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                 CommandName="Edit" Text="Edit" />
             &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                 CommandName="Delete" Text="Delete" />
             &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                 CommandName="New" Text="New" />
         </ItemTemplate>
        
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
             Vehicle Color
         </HeaderTemplate>
         <EditRowStyle BackColor="#CCCCCC" />
     </asp:FormView>
 
 
 <br />
 
     <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
 
     </div>
     
<div>
    <asp:GridView ID="GridView1" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="id" DataSourceID="odscolor" ForeColor="#333333" 
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
            <asp:BoundField DataField="id" HeaderText="id" 
                SortExpression="id" ReadOnly="True" />
            <asp:BoundField DataField="color" HeaderText="color" 
                SortExpression="color" />
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
    <asp:ObjectDataSource ID="odscolor" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" 
        SelectMethod="GetData" TypeName="masterdataTableAdapters.tblcolorTableAdapter" 
        UpdateMethod="UpdateQuery" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GridView1" Name="color" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="GridView1" Name="ID" 
                PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="FormView1" Name="color" 
                PropertyName="SelectedValue" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>

</div>
</ContentTemplate>

 </asp:UpdatePanel>
</asp:Content>

