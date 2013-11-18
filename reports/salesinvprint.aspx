<%@ Page Language="VB" AutoEventWireup="false" 
CodeFile="salesinvprint.aspx.vb" Inherits="reports_salesinvprint" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" Height="500px" Width="100%">
            <LocalReport ReportPath="reports\salesInvPrint.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                        Name="members_SaleInvoice" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            DeleteMethod="Delete" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="membersTableAdapters.SaleInvoiceTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="sales_ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="sales_ID" Type="Int32" />
                <asp:Parameter Name="salesInvoice_Date" Type="DateTime" />
                <asp:Parameter Name="Customer_ID" Type="Int32" />
                <asp:Parameter Name="Country_ID" Type="Int32" />
                <asp:Parameter Name="Port_ID" Type="Int32" />
                <asp:Parameter Name="CalculationType" Type="String" />
                <asp:Parameter Name="PaymentMode" Type="Int32" />
                <asp:Parameter Name="Curr_Rate" Type="Decimal" />
                <asp:Parameter Name="Curr_ID" Type="Int32" />
                <asp:Parameter Name="Consignee_ID" Type="Int32" />
                <asp:Parameter Name="Notify_ID" Type="Int32" />
                <asp:Parameter Name="Email_Con" Type="String" />
                <asp:Parameter Name="FirstName_Con" Type="String" />
                <asp:Parameter Name="Country_ID_Con" Type="Int32" />
                <asp:Parameter Name="City_Con" Type="String" />
                <asp:Parameter Name="phone_Con" Type="String" />
                <asp:Parameter Name="fax_Con" Type="String" />
                <asp:Parameter Name="address_Con" Type="String" />
                <asp:Parameter Name="Email_Not" Type="String" />
                <asp:Parameter Name="FirstName_Not" Type="String" />
                <asp:Parameter Name="Country_ID_Not" Type="Int32" />
                <asp:Parameter Name="City_Not" Type="String" />
                <asp:Parameter Name="phone_Not" Type="String" />
                <asp:Parameter Name="fax_Not" Type="String" />
                <asp:Parameter Name="address_Not" Type="String" />
                <asp:Parameter Name="TTL_Amount" Type="Decimal" />
                <asp:Parameter Name="Comments" Type="String" />
                <asp:Parameter Name="Inspection" Type="Boolean" />
                <asp:Parameter Name="inspection_amt" Type="Decimal" />
                <asp:Parameter Name="fob_price" Type="Decimal" />
                <asp:Parameter Name="freight_amt" Type="Decimal" />
                <asp:Parameter Name="vanning_amt" Type="Decimal" />
                <asp:Parameter Name="insurance_amt" Type="Decimal" />
                <asp:Parameter Name="shipmenttype_id" Type="Int32" />
                <asp:Parameter Name="staff_comments" Type="String" />
                <asp:Parameter Name="user_ID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="sales_ID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="perfInvoice_ID" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
