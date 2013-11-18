<%@ Page Title="" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false" CodeFile="stockemailist.aspx.vb" Inherits="stockemailist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
 
 
 
 
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="odsSendEmailToStock" ForeColor="#333333" 
                GridLines="None">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="CHASSIS_NO" HeaderText="CHASSIS_NO" 
                        SortExpression="CHASSIS_NO" />
                    <asp:BoundField DataField="MODEL" HeaderText="MODEL" SortExpression="MODEL" />
                    <asp:BoundField DataField="COLOR" HeaderText="COLOR" SortExpression="COLOR" />
                    <asp:BoundField DataField="MAKE" HeaderText="MAKE" SortExpression="MAKE" />
                    <asp:BoundField DataField="MODEL_DESCRIPTION" HeaderText="MODEL_DESC" 
                        SortExpression="MODEL_DESCRIPTION" />
                    <asp:BoundField DataField="MAKE_CATEGORY" HeaderText="MAKE_CAT" 
                        SortExpression="MAKE_CATEGORY" />
                    <asp:BoundField DataField="DRIVE" HeaderText="DRIVE" SortExpression="DRIVE" />
                    <asp:BoundField DataField="FOB_PRICE" HeaderText="FOB_PRICE" 
                        SortExpression="FOB_PRICE" />
                    <asp:BoundField DataField="globalLocation" HeaderText="LOC" 
                        SortExpression="globalLocation" />
                    <asp:BoundField DataField="FILE_REF" HeaderText="FILE_REF" 
                        SortExpression="FILE_REF" />
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="AVAILABILITY" HeaderText="AVAILABILITY" 
                        SortExpression="AVAILABILITY" />
                    <asp:BoundField DataField="WEB_PRICE" HeaderText="WEB_PRICE" 
                        SortExpression="WEB_PRICE" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            
        <br />
        
         <asp:ObjectDataSource ID="odsSendEmailToStock" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="dsStockTableAdapters.SELECT_StockToEmail_ActiveTableAdapter">
             <SelectParameters>
                 <asp:QueryStringParameter Name="session_ID" QueryStringField="sID" 
                     Type="String" />
             </SelectParameters>
            </asp:ObjectDataSource>
                    
               
</asp:Content>

