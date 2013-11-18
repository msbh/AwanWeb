<%@ Page Title="- Performa Invoice List -" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="performaList.aspx.vb" Inherits="performaList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="myform">
        <h1 class="myform_heading">
            <span class="myform_span">Performa Invoice List </span>
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
                <span>Performa Ref </span>
                <asp:TextBox ID="txtperformaNO" runat="server" Width="80px"></asp:TextBox>
                 <asp:Button ID="cmdSearch" runat="server" CssClass="js_a" Text="Search" />
            </ul>
            <ul>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Quote_ID"
                    DataSourceID="odsperformaList" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="perfInv_Ref" HeaderText="Performa_Ref" SortExpression="perfInv_Ref"
                            HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FILE_REF" HeaderText="Stock No" SortExpression="FILE_REF"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="make" HeaderText="Make" SortExpression="make" HeaderStyle-HorizontalAlign="Center"
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
                        <asp:HyperLinkField DataNavigateUrlFormatString="viewperforma.aspx?id={0}" 
                        Text="View"
                            DataTextFormatString="View" ItemStyle-CssClass="js_a" 
                             ItemStyle-HorizontalAlign="Center"
                            DataNavigateUrlFields="perfInvoice_ID" >
<ItemStyle HorizontalAlign="Center" CssClass="js_a"></ItemStyle>
                        </asp:HyperLinkField>
                    </Columns>
                </asp:GridView>
            </ul>
            <asp:ObjectDataSource ID="odsperformaList" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" 
                TypeName="membersTableAdapters.Performa_ListTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtStart_Date" Name="start_Date" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtEnd_Date" Name="end_Date" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtChassis_NO" Name="chassis_no" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="txtperformaNO" Name="performa_ref" PropertyName="Text"
                        Type="String" />
                    <asp:SessionParameter Name="customer_ID" SessionField="user_id" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>


	
	
	
</asp:Content>
