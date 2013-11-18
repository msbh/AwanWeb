<%@ Page Title="-Sell Your Car List-" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false" CodeFile="SellYCarList.aspx.vb" Inherits="admin_SellYCarList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 


<ul class="myform_heading2">
          <span style="color:#3366CC">Sell Your </span> Car List
        </ul>
        <ul class="myform_line">
        </ul> 

   <div id="myform">
 <div class="content">
 <fieldset>
 <ul>
   <span> Request Ref </span>  
     <asp:TextBox ID="txtrequestref" runat="server" Width="50px"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                 runat="server" ControlToValidate="txtrequestref" 
                                  ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" Display="Dynamic"
                                 ErrorMessage="does not validate.">
                                 </asp:RegularExpressionValidator>
     
    <span>  Requester Name   </span>
     <asp:TextBox ID="txtfirstname" runat="server" Width="180px"></asp:TextBox>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                                 runat="server" ControlToValidate="txtfirstname" 
                                  ValidationExpression="^[a-zA-Z'.\s]{1,40}$" Display="Dynamic"
                                 ErrorMessage="does not validate.">
                                 </asp:RegularExpressionValidator>
     
      <span>  From   </span>
     <asp:TextBox ID="txtFrom" runat="server" Width="100px"></asp:TextBox>
     
      <span>  Till   </span>
     <asp:TextBox ID="txtTill" runat="server" Width="100px"></asp:TextBox>
       &nbsp;&nbsp;&nbsp;
      <asp:Button ID="cmdSearch" runat="server" CssClass="btn_action" Text="Search" />
     
     </ul> 
    
 <br />
 
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="sellycar_ID" DataSourceID="ObjectDataSource1" Width="100%" 
         CellPadding="4" ForeColor="#333333" GridLines="None" >
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="sellycar_ID" HeaderText="sellycar_ID" 
                ReadOnly="True" SortExpression="sellycar_ID" />
            <asp:BoundField DataField="First_Name" HeaderText="First_Name" 
                SortExpression="First_Name" />
            <asp:BoundField DataField="Car_Make" HeaderText="Car_Make" 
                SortExpression="Car_Make" />
            <asp:BoundField DataField="Car_Color" HeaderText="Car_Color" 
                SortExpression="Car_Color" />
            <asp:BoundField DataField="Model_Year" HeaderText="Model_Year" 
                SortExpression="Model_Year" />
            <asp:BoundField DataField="Request_DateTime" HeaderText="Request_DateTime" 
                ReadOnly="True" SortExpression="Request_DateTime" />
            <asp:BoundField DataField="Expected_Price" HeaderText="Expected_Price" 
                SortExpression="Expected_Price" />
            <asp:HyperLinkField DataNavigateUrlFields="sellycar_ID" 
                DataNavigateUrlFormatString="adminsellycar.aspx?sellycar_ID={0}" 
                Text="View details" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    
    </fieldset>
 
 
 
 
     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
         OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
         TypeName="dsServicesTableAdapters.Select_SellYCarListTableAdapter">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtFrom" Name="SDATE" PropertyName="Text" 
                 Type="String" />
             <asp:ControlParameter ControlID="txtTill" Name="EDATE" PropertyName="Text" 
                 Type="String" />
             <asp:ControlParameter ControlID="txtrequestref" Name="SellYourCarRef" 
                 PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtfirstname" Name="firstName" 
                 PropertyName="Text" Type="String" />
         </SelectParameters>
     </asp:ObjectDataSource>
 </div>
 </div>   
    
</asp:Content>

