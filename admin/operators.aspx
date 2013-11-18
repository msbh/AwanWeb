<%@ Page Title="" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false" CodeFile="operators.aspx.vb" Inherits="admin_operators" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div> 

<ul> 
 <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="OperatorID" CssClass="inputformtable" 
        DataSourceID="ObjectDataSource1" DefaultMode="Insert" 
        ForeColor="#333333">
       
     <InsertItemTemplate>
       
         <table class="style1">
             <tr>
                 <td>
                     <span>OperatorName: </span>
                 </td>
                 <td>
                     <asp:TextBox ID="OperatorNameTextBox" runat="server" 
                         Text='<%# Bind("OperatorName") %>' />
                 </td>
             </tr>
             <tr>
                 <td>
                     <span>OperatorPassword: </span>
                 </td>
                 <td>
                     <asp:TextBox ID="OperatorPasswordTextBox" runat="server" 
                         Text='<%# Bind("OperatorPassword") %>' TextMode="Password" />
                 </td>
             </tr>
             <tr>
                 <td>
                     <span>OperatorEmail: </span>
                 </td>
                 <td>
                     <asp:TextBox ID="OperatorEmailTextBox" runat="server" 
                         Text='<%# Bind("OperatorEmail") %>' />
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                         CommandName="Insert" Text="Insert" />
                 </td>
                 <td>
                     <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                         CommandName="Cancel" Text="Cancel" />
                 </td>
             </tr>
         </table>
     </InsertItemTemplate>
    <EmptyDataTemplate>
             <table class="style1">
                 <tr>
                     <td>
                         -NO DATA-</td><td>
                       </td>
                 </tr>
                <tr>
                 <td>
                     <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                         CommandName="Insert" Text="Insert" />
                 </td>
                 <td>
                     <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                         CommandName="Cancel" Text="Cancel" />
                 </td>
             </tr>
             </table>
         </EmptyDataTemplate>
         <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <HeaderTemplate>
             Add Operators
         </HeaderTemplate>
    </asp:FormView>


</ul>

<ul>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="OperatorID" DataSourceID="ObjectDataSource1" 
        ForeColor="#333333" GridLines="None">
       <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="OperatorPassword" 
                SortExpression="OperatorPassword">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("OperatorPassword") %>' TextMode="Password"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"  Text='*******'></asp:Label>
                    
                    
                    
                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OperatorName" HeaderText="OperatorName" 
                SortExpression="OperatorName" />
            <asp:BoundField DataField="OperatorEmail" HeaderText="OperatorEmail" 
                SortExpression="OperatorEmail" />
            <asp:BoundField DataField="OperatorID" HeaderText="OperatorID" 
                InsertVisible="False" ReadOnly="True" SortExpression="OperatorID" />
        </Columns>
       <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>

</ul>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert" SelectMethod="GetData" 
        TypeName="masterdataTableAdapters.LiveChat_OperatorsTableAdapter" 
            OldValuesParameterFormatString="original_{0}">
        <InsertParameters>
            <asp:Parameter Name="OperatorPassword" Type="String" />
            <asp:Parameter Name="OperatorName" Type="String" />
            <asp:Parameter Name="OperatorEmail" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>

</div>
   

</asp:Content>

