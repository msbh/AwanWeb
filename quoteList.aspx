<%@ Page Title="- Quotation List -" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="quoteList.aspx.vb" Inherits="quotations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="myform">
        <h1 class="myform_heading">
            <span class="myform_span">Quotation List </span>
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
                <span>Quote Ref </span>
                <asp:TextBox ID="txtQuoteNO" Width="80px"  runat="server"></asp:TextBox>
                <asp:Button ID="cmdSearch" runat="server" CssClass="js_a" Text="Search" />
            
            </ul>
            <ul>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    DataSourceID="odsQuoteList" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="Quote_Ref" HeaderText="Quote_Ref" SortExpression="Quote_Ref"
                            HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    
                        <asp:BoundField DataField="make" HeaderText="Make" SortExpression="make" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="model_description" HeaderText="Make Model" SortExpression="model_description"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TTL_Amount" HeaderText="Price" SortExpression="TTL_Amount"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date"
                            SortExpression="Date" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:BoundField DataField="CHASSIS_NO" HeaderText="CHASSIS_NO" 
                            SortExpression="CHASSIS_NO" />
                       <asp:HyperLinkField DataNavigateUrlFormatString="viewquote.aspx?id={0}" 
                            Text="View"
                            DataTextFormatString="View"
                            ItemStyle-HorizontalAlign="Center" 
                            ItemStyle-CssClass="js_a"
                            DataNavigateUrlFields="Quote_ID" >
<ItemStyle HorizontalAlign="Center" CssClass="js_a"></ItemStyle>
                        </asp:HyperLinkField>
                    </Columns>
                </asp:GridView>
            </ul>
            <asp:ObjectDataSource ID="odsQuoteList" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="membersTableAdapters.Quote_ListTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtStart_Date" Name="start_Date" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtEnd_Date" Name="end_Date" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtChassis_NO" Name="chassis_no" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtQuoteNO" Name="quote_ref" PropertyName="Text"
                        Type="String" />
                    <asp:SessionParameter Name="customer_ID" SessionField="user_id" Type="Int32" 
                        DefaultValue="0" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>


	
	
	
</asp:Content>
