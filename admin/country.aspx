<%@ Page Title="-Country Master-" Language="VB" MasterPageFile="~/admin/MasterPage.master" 
AutoEventWireup="false" CodeFile="country.aspx.vb" Inherits="admin_country" %>


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
            <span style="color:#3366CC"> Country </span>
        </ul>
        
        <ul class="myform_line">
        </ul>   
 <div>
     <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" 
        DataKeyNames="ID" DataSourceID="odsCountry" 
         DefaultMode="Insert" Width="315px" CssClass="inputformtable">
         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <RowStyle BackColor="#CCCCCC" ForeColor="#333333" />
     
        
     
         <InsertItemTemplate>
             Country Name:
             <asp:TextBox ID="globalLocationTextBox" runat="server" 
                 Text='<%# Bind("globalLocation") %>' />
             <br />
             Flag Image:&nbsp;
             <asp:TextBox ID="locationImageTextBox" runat="server" 
                 Text='<%# Bind("locationImage") %>' />
             <br />
             <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                 CommandName="Insert" Text="Insert" />
             &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
    <asp:GridView ID="GridView1" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ID" DataSourceID="odsCountry" ForeColor="#333333" 
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
        
        
            <asp:BoundField DataField="globalLocation" HeaderText="Country Name" 
                SortExpression="globalLocation" />
            <asp:BoundField DataField="locationImage" HeaderText="Flag Image" 
                SortExpression="locationImage" />
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
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
    <asp:ObjectDataSource ID="odsCountry" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="{0}" 
        SelectMethod="GetData" TypeName="masterdataTableAdapters.SELECT_COUNTRYTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="globallocation" Type="String" />
            <asp:Parameter Name="locationimage" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="globallocation" Type="String" />
            <asp:Parameter Name="locationimage" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>

</div>
</ContentTemplate>

 </asp:UpdatePanel>
 
</asp:Content>

