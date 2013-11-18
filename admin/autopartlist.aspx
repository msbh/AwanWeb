<%@ Page Title="-Auto List-" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false" CodeFile="autopartlist.aspx.vb" Inherits="admin_autopart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
            
         <ul class="myform_heading2">
            <span style="color:#3366CC">Auto</span> List
        </ul>
        
        <ul class="myform_line">
        </ul>   
    
    
      
    
    
     <div id="myform">
 <div class="content">
 <fieldset>
 <ul>
 <asp:Label ID="email" runat="server" Text="E-MAIL" Width="55px"></asp:Label>
     <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
  
      
 <asp:Label ID="first" runat="server" Text="First Name" Width="90px"></asp:Label>
     
     <asp:TextBox ID="txtfirstname" runat="server"></asp:TextBox>
      &nbsp;&nbsp;&nbsp;
      <asp:Button ID="cmdSearch" runat="server"
      ValidationGroup="form"
       CssClass="btn_action" Text="Search" />
</ul>
 <br />

<ul>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
         DataKeyNames="autoparts_ID" DataSourceID="ObjectDataSource1" Width="100%" 
         CellPadding="4" ForeColor="#333333" GridLines="None" >
         <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
         <Columns>
             <asp:BoundField DataField="autoparts_ID" HeaderText="autoparts_ID" 
                 ReadOnly="True" SortExpression="autoparts_ID" />
             <asp:BoundField DataField="firstname" HeaderText="firstname" 
                 SortExpression="firstname" />
             <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
             <asp:BoundField DataField="makemodel" HeaderText="makemodel" 
                 SortExpression="makemodel" />
             <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" />
             <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
             
             <asp:BoundField DataField="CountryName" HeaderText="CountryName" 
                 SortExpression="CountryName" />
                 
           <asp:HyperLinkField DataNavigateUrlFields="autoparts_ID" 
                 DataNavigateUrlFormatString="autopartdetails.aspx?ID={0}"
                  Text="View" />
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
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="DataSet1TableAdapters.AutoPart_selectlistTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtemail" Name="email" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="txtfirstname" Name="firstname" 
                    PropertyName="Text" Type="String" />
                <asp:QueryStringParameter Name="autoparts_ID" QueryStringField="autoparts_ID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

</asp:Content>

