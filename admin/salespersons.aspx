<%@ Page Title="-Vehicle Make-" Language="VB" MasterPageFile="~/admin/MasterPage.master" 
AutoEventWireup="false" CodeFile="salespersons.aspx.vb" Inherits="admin_salespersons" %>


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
            <span style="color:#3366CC">  Sales Persons</span> Master
        </ul>
        
        <ul class="myform_line">
        </ul>   

 <div>
     <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" 
        DataKeyNames="makeID" DataSourceID="ObjectDataSource1" 
         DefaultMode="Insert" Width="315px" CssClass="inputformtable">
         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <RowStyle BackColor="#CCCCCC" ForeColor="#333333" />
     
         <InsertItemTemplate>
             <table class="style1">
                 <tr>
                     <td>
                         <asp:Label ID="Label1" runat="server" Text="Sales Persons:"></asp:Label>
                     </td>
                     <td>
                         <asp:TextBox ID="makeTextBox" runat="server" 
                             Text='<%# Bind("Saleperson_Name") %>' />
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                             CommandName="Insert" Text="Insert" />
                         &nbsp;&nbsp;&nbsp;
                         <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                             CommandName="Cancel" Text="Cancel" />
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
             </table>
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
            Sales Person 
         </HeaderTemplate>
         <EditRowStyle BackColor="#CCCCCC" />
     </asp:FormView>
 
 
 <br />
 
     <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
 
     </div>
     
<div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" 
        GridLines="None" PageSize="100" DataSourceID="ObjectDataSource1" 
        AllowPaging="True">
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
            <asp:BoundField DataField="Saleperson_Name" HeaderText="Saleperson_Name" 
                SortExpression="Saleperson_Name" />
            <asp:BoundField DataField="Saleperson_ID" HeaderText="Saleperson_ID" 
                SortExpression="Saleperson_ID" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>

</div>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        InsertMethod="Insert" 
        SelectMethod="GetData" 
        TypeName="DataSet1TableAdapters.Select_SalePersonsTableAdapter" 
        UpdateMethod="Update" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="saleperson_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="saleperson_ID" Type="Int32" />
            <asp:Parameter Name="Saleperson_Name" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Saleperson_Name" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
<div>

</div>
</ContentTemplate>

 </asp:UpdatePanel>
</asp:Content>

