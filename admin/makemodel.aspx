<%@ Page Title="-Vehicle Make Model-" Language="VB" MasterPageFile="~/admin/MasterPage.master" 
AutoEventWireup="false" CodeFile="makemodel.aspx.vb" 
Inherits="admin_makemodel" %>


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
    
       <ul class="myform_heading2">
            <span style="color:#3366CC"> Make Model </span>Name 
        </ul>
        
        <ul class="myform_line">
        </ul>   

    
    

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
 

    <ContentTemplate>
 
    
    
    
  

    <div>
         <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" 
             DefaultMode="Insert" Width="315px" DataKeyNames="ID" 
             DataSourceID="odsvehicle_make" CssClass="inputformtable">
             <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
             <RowStyle BackColor="#CCCCCC" ForeColor="#333333" />
         
             
             <InsertItemTemplate>
                 <table class="style1">
                     <tr>
                         <td>
                             Make</td>
                         <td>
                             <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="vMake" 
                                 DataTextField="make" DataValueField="makeID" 
                                 SelectedValue='<%# Bind("make_ID") %>'>
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             Make Model</td>
                         <td>
                             <asp:TextBox ID="model_descriptionTextBox" runat="server" 
                                 Text='<%# Bind("model_description") %>' />
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                 CommandName="Insert" Text="Insert" />
                             &nbsp;&nbsp;
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
                 Vehicle Make
             </HeaderTemplate>
             <EditRowStyle BackColor="#CCCCCC" />
         </asp:FormView>
     <br />
     
        <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
     </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="ID" DataSourceID="odsvehicle_make" ForeColor="#333333" 
            GridLines="None" PageSize="100" AllowPaging="True">
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
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:TemplateField HeaderText="Vehicle Make" SortExpression="make_ID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlmake" runat="server" DataSourceID="vMake" 
                            DataTextField="make" DataValueField="makeID" 
                            SelectedValue='<%# Bind("make_ID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("make") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="model_description" HeaderText="Model Description" 
                    SortExpression="model_description" />
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
        <asp:ObjectDataSource ID="odsvehicle_make" runat="server" DeleteMethod="DeleteQuery" 
            InsertMethod="insert_makedetails" 
            SelectMethod="GetData" TypeName="masterdataTableAdapters.Select_makemodelsTableAdapter" 
            UpdateMethod="UpdateQuery" OldValuesParameterFormatString="{0}">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridView1" Name="ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GridView1" Name="make_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GridView1" Name="model_description" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GridView1" Name="ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="FormView1" Name="make_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="FormView1" Name="model_description" 
                    PropertyName="SelectedValue" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="vMake" runat="server" SelectMethod="GetData" 
            TypeName="masterdataTableAdapters.get_makes_nocountTableAdapter" 
            OldValuesParameterFormatString="original_{0}">
        </asp:ObjectDataSource>

    </div>

</ContentTemplate>

   </asp:UpdatePanel>
   

</asp:Content>

