<%@ Page Title="- Order Shipping Details -" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="order.aspx.vb" Inherits="order" %>

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
                        <li class="active">Step 1 [Shipping details]</li>
                        <li>Step 2 [Order Details] </li>
                        <li>Step 3 [Consignee Info] </li>
                        <li>Step 4 [Complete Order] </li>
                    </ul>
                </center>
            </fieldset>
            <fieldset>
                <legend>Destination Port </legend>
                <ul>
                    <li><span>Country </span>
                        <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="odsCountry" DataTextField="CountryName"
                            DataValueField="Country_ID" AutoPostBack="True" Width="200px">
                            <%--       selectedValue='<%# DataBinder.Eval(Container.DataItem, "Country_ID") %>'--%>
                        </asp:DropDownList>
                    </li>
                </ul>
                <ul>
                    <li><span>Port </span>
                        <asp:DropDownList ID="ddlport" runat="server" DataSourceID="odsPort" DataTextField="portname"
                            DataValueField="port_id" Width="200px">
                        </asp:DropDownList>
                    </li>
                </ul>
            </fieldset>
            <fieldset>
                <legend>Ocean Frieght </legend>
                <ul>
                    <li style="width: 500px;">
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked="false" />
                        <span style="width: 300px;">Inspection Certificate (JPY 25,000) </span></li>
                         <li style="width: 500px;">
                        <span>Shipment </span>  <asp:DropDownList ID="ddlshipment" runat="server" 
                             Width="200px">
                                 <asp:ListItem Value="1">RoRo</asp:ListItem>
                                 <asp:ListItem Value="2">Container</asp:ListItem>
                         
                        </asp:DropDownList></li>
                </ul>
                <ul>
                    <li style="width: 500px;"><span></span>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <%--         SelectedValue='<%# Bind("CalculationType") %>'--%>
                            <asp:ListItem Value="FOB">FOB  [Total Cost at the Japan Port] </asp:ListItem>
                            <asp:ListItem Value="C&amp;F">C &amp; F [Total Cost until landed to the Destination Port]</asp:ListItem>
                            <asp:ListItem Value="CIF"> CIF [Total Cost &amp; Insurance until landed to the Destination Port]</asp:ListItem>
                        </asp:RadioButtonList>
                    </li>
                </ul>
            </fieldset>
            <center class="js_a" style="margin: 4px;">
            
                    
                    <a href="order1.aspx"> Back </a>
                    
                &nbsp;
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Calculate"  />
            </center>
           
            <asp:ObjectDataSource ID="odsOrder" runat="server" SelectMethod="GetData"
                TypeName="membersTableAdapters.Select_QuoteTemp_FinalTableAdapter" 
                OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:Parameter DefaultValue="id" Name="temp_Quote_ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsCountry" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsPort" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="Select_Port_ByCountryID" TypeName="masterdataTableAdapters.Select_PortTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCountry" DefaultValue="1" Name="country_ID" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
