<%@ Page Title="- Sales Invoice List -" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="salesinvoiceList.aspx.vb" Inherits="salesinvoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="myform">
        <h1 class="myform_heading">
            <span class="myform_span">Sales Invoice List </span>
        </h1>
        <ul class="myform_line">
        </ul>
        <div class="content">
            <ul>
                <span>Start_Date </span>
                <asp:TextBox ID="txtStart_Date" Width="100px"  runat="server"></asp:TextBox>
                <span>End_Date </span>
                <asp:TextBox ID="txtEnd_Date" Width="100px"  runat="server"></asp:TextBox>
                <span>Chassis_NO </span>
                <asp:TextBox ID="txtChassis_NO" Width="120px"  runat="server"></asp:TextBox>
                <span>Invoice Ref </span>
                <asp:TextBox ID="txtsalesinvoiceNO" runat="server" Width="80px"></asp:TextBox>
                 <asp:Button ID="cmdSearch" runat="server" CssClass="js_a" Text="Search" />
            </ul>
            <ul>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Sales_ID"
                    DataSourceID="odssalesList" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="sales_Ref" HeaderText="Sales_Ref" SortExpression="sales_Ref"
                            HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FILE_REF" HeaderText="Stock No" SortExpression="FILE_REF"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="make" HeaderText="make" SortExpression="Make" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="model_description" HeaderText="Make Model" SortExpression="model_description"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TTL_Amount" HeaderText="Price" SortExpression="TTL_Amount"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date"
                            SortExpression="Date" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFormatString="viewsaleinvoice.aspx?id={0}" Text="View"
                            DataTextFormatString="View" 
                            ItemStyle-CssClass="js_a"
                             ItemStyle-HorizontalAlign="Center"
                            DataNavigateUrlFields="sales_ID" />
                    </Columns>
                </asp:GridView>
            </ul>
            <asp:ObjectDataSource ID="odssalesList" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" 
                TypeName="membersTableAdapters.SalesInvoice_ListTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtStart_Date" Name="start_Date" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtEnd_Date" Name="end_Date" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtChassis_NO" Name="chassis_no" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtsalesinvoiceNO" Name="sales_ref" PropertyName="Text"
                        Type="String" />
                    <asp:SessionParameter Name="customer_ID" SessionField="user_id" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>


	
	
	
</asp:Content>
