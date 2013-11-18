<%@ Page Title="- Order Detail -" Language="VB" MasterPageFile="~/MasterPage2.master"
    AutoEventWireup="false" CodeFile="orderDetails.aspx.vb" Inherits="orderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    
    <div id="myform">
        <h1 class="myform_heading">
            <span class="myform_span">Quotation </span>
        </h1>
        <ul class="myform_line">
        </ul>
        <div class="content">
            <fieldset>
                <center id="orderstatus">
                    <ul>
                        <li>Step 1 [Shipping details]</li>
                        <li class="active">Step 2 [Order Details] </li>
                        <li>Step 3 [Consignee Info] </li>
                        <li>Step 4 [Complete Order] </li>
                    </ul>
                </center>
            </fieldset>
            <fieldset>
                <legend>Order Details </legend>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="temp_Quote_ID" DataSourceID="odsOrderDetails"
                    Width="100%">
                    <ItemTemplate>
                        <table border="1" class="listview">
                            <tr class="heading">
                                <td class="imgcol">
                                    &nbsp;
                                </td>
                                <td>
                                    Spec Details
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    Price
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="imgcol" rowspan="6">
                                  
                                    
                                    <img alt="" src="http://www.awan.co.jp/cars_images/<%# Eval("image1") %>" border="0" />
                               
                               
                               
                                </td>
                                <td>
                                    Make
                                </td>
                                <td>
                                    <asp:Label ID="makeLabel" runat="server" Text='<%# Bind("make") %>' />
                                </td>
                                <td>
                                    Price
                                </td>
                                <td>
                                    <asp:Label ID="TOTAL_COSTLabel" runat="server" Text='<%# Bind("FOB_PRICE") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Make Model
                                </td>
                                <td>
                                    <asp:Label ID="model_descriptionLabel" runat="server" Text='<%# Bind("model_description") %>' />
                                </td>
                                <td>
                                    Frieght
                                </td>
                                <td>
                                    <asp:Label ID="Freight_AmtLabel" runat="server" Text='<%# Bind("Freight_Amt") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Color
                                </td>
                                <td>
                                    <asp:Label ID="colorLabel" runat="server" Text='<%# Bind("color") %>' />
                                </td>
                                <td>
                                    Insurance
                                </td>
                                <td>
                                    <asp:Label ID="Insurance_AmtLabel" runat="server" Text='<%# Bind("Insurance_Amt") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Year
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    Inspection
                                </td>
                                <td>
                                    <asp:Label ID="Inspection_AmtLabel" runat="server" Text='<%# Bind("Inspection_Amt") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Country
                                </td>
                                <td>
                                    <asp:Label ID="CountryNameLabel" runat="server" Text='<%# Bind("CountryName") %>' />
                                </td>
                                <td>
                                    Total:
                                </td>
                                <td>
                                    <asp:Label ID="TTL_AmountLabel" runat="server" Text='<%# Bind("TTL_Amount") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Port
                                </td>
                                <td>
                                    <asp:Label ID="portNameLabel" runat="server" Text='<%# Bind("portName") %>' />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <asp:ObjectDataSource ID="odsOrderDetails" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="select_quotation_temp" TypeName="membersTableAdapters.Select_Quotation_TempTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="temp_Quote_ID" QueryStringField="qid" Type="Int32"
                            DefaultValue="1" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <center class="js_a" style="margin: 4px;">
                    <asp:LinkButton ID="btnBack" runat="server" Text="Back" PostBackUrl="~/order.aspx"  />
                    &nbsp;
                    <asp:LinkButton ID="btnNext" runat="server" Text="Next" />
                </center>
            </fieldset>
        </div>
    </div>
    
    
</asp:Content>
