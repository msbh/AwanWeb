<%@ Page Title="-Become Agent List-" Language="VB" MasterPageFile="~/admin/MasterPage.master" 
AutoEventWireup="false" 
CodeFile="becomeagentlist.aspx.vb" 
Inherits="admin_becomeagentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


       
         <ul class="myform_heading2">
            <span style="color:#3366CC">Become Agent</span> Request List
        </ul>
        
        <ul class="myform_line">
        </ul>   
    
 
 
<div id="myform" > 
 <div class="content" >
 <fieldset> 
 <ul>
   <span> Request Ref </span>  
     <asp:TextBox ID="txtrequestref" runat="server" Width="50px"></asp:TextBox>
                   
    <span>  Requester Name   </span>
     <asp:TextBox ID="txtfirstname" runat="server" Width="180px"></asp:TextBox>
     
      <span>  From   </span>
     <asp:TextBox ID="txtFrom" runat="server" Width="100px" Height="23px"></asp:TextBox>
     
      <span>  Till   </span>
     <asp:TextBox ID="txtTill" runat="server" Width="100px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
     <asp:Button ID="cmdSearch" runat="server" CssClass="btn_action" Text="Search" />
     
     </ul> 
    
 <br />

    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="becomeagent_ID" DataSourceID="ObjectDataSource1" Width="100%" 
         CellPadding="4" ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="becomeagent_ID" HeaderText="becomeagent_ID" 
                ReadOnly="True" SortExpression="becomeagent_ID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                SortExpression="Mobile" />
            <asp:BoundField DataField="Request_Time" HeaderText="Request_Time" 
                SortExpression="Request_Time" />
            <asp:BoundField DataField="LegendName" HeaderText="LegendName" 
                SortExpression="LegendName" />
            <asp:HyperLinkField DataNavigateUrlFields="becomeagent_id" 
                DataNavigateUrlFormatString="adminbecomeagent.aspx?becomeagent_id={0}" 
                Text="View Details" />
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
         TypeName="dsServicesTableAdapters.Select_becomeagentLISTTableAdapter">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtFrom" Name="SDATE" PropertyName="Text" 
                 Type="String" />
             <asp:ControlParameter ControlID="txtTill" Name="EDATE" PropertyName="Text" 
                 Type="String" />
             <asp:ControlParameter ControlID="txtrequestref" Name="Ref" 
                 PropertyName="Text" Type="String" />
             <asp:ControlParameter ControlID="txtfirstname" Name="firstName" 
                 PropertyName="Text" Type="String" />
         </SelectParameters>
     </asp:ObjectDataSource>
 </div>
    
     </div>

</asp:Content>

