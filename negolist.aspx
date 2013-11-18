<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="negolist.aspx.vb" Inherits="negolist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="myform"> 
 <ul class="myform_heading">
        <span style="color: #F0F0F0">Negotiation </span>List
    </ul>
    <ul class="myform_line">
    </ul>
    <div class="content">
    
        <ul>
            <span>Start_Date </span>
            <asp:TextBox ID="txtStart_Date" runat="server"></asp:TextBox>
            <span>End_Date </span>
            <asp:TextBox ID="txtEnd_Date" runat="server"></asp:TextBox>
            <span>Ref </span>
            <asp:TextBox ID="txtref" runat="server"></asp:TextBox>
        </ul>
        <ul>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:BoundField DataField="Time_Stamp" DataFormatString="{0:dd-MMM-yyyy HH:mm}" HeaderText="Time_Stamp"
                        SortExpression="Time_Stamp" />
                    <asp:BoundField DataField="FILE_REF" HeaderText="Stock  Ref" SortExpression="FILE_REF" />
                    <asp:BoundField DataField="Client_Name" HeaderText="Client_Name" SortExpression="Client_Name" />
                    <asp:BoundField DataField="Client_Email" HeaderText="Client_Email" SortExpression="Client_Email" />
                    <asp:BoundField DataField="CHASSIS_NO" HeaderText="CHASSIS_NO" SortExpression="CHASSIS_NO" />
                    <asp:BoundField DataField="make" HeaderText="Make" SortExpression="make" />
                    <asp:BoundField DataField="color" HeaderText="Color" SortExpression="color" />
                    <asp:BoundField DataField="MODEL" HeaderText="Year" SortExpression="MODEL" />
                    <asp:BoundField DataField="FOB_PRICE" HeaderText="FOB_PRICE" SortExpression="FOB_PRICE" />
                    <asp:HyperLinkField DataNavigateUrlFields="negtiation_ID" DataNavigateUrlFormatString="negoDetailsClient.aspx?id={0}"
                        DataTextField="negtiation_ID" DataTextFormatString="View Details" Text="Details" />
                </Columns>
            </asp:GridView>
        </ul>
    </div>
    
    
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsServicesTableAdapters.select_negoListTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStart_Date" Name="start_Date" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtEnd_Date" Name="end_Date" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtref" Name="ref" PropertyName="Text" Type="String" />
            <asp:SessionParameter DefaultValue="" Name="customer_ID" SessionField="user_id" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

