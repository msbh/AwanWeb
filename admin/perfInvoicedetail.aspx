<%@ Page Title="-Performa Invoice-" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false"
    CodeFile="perfInvoicedetail.aspx.vb" Inherits="admin_perfInvoicedetail" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
        <ul class="myform_heading2">
            <span style="color:#3366CC">Performa </span>Invoice
        </ul>
        
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="perfInvoice_ID" 
        DataSourceID="odsperforma" 
        OnDataBound="FormView1_DataBound" 
        OnItemUpdating="FormView1_ItemUpdating"
            DefaultMode="Edit">
            <EditItemTemplate>
                <asp:HiddenField ID="performaID" runat="server" Value='<%# Eval("perfInvoice_ID") %>' />
                <asp:HiddenField ID="consigneeID" runat="server" Value='<%# Bind("Consignee_ID") %>' />
                <asp:HiddenField ID="notifyID" runat="server" Value='<%# Bind("Notify_ID") %>' />
                <asp:HiddenField ID="Hstock_ID" runat="server" 
                    Value='<%# Eval("Stock_ID") %>' />
                <table>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td colspan="2">
                            <b>Consignee Details</b>
                        </td>
                        <td colspan="2">
                            <b>Notify Details </b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Performa Ref
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" Width="80px" runat="server" Text='<%# Bind("perfInvoice_ID") %>'
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            Country
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlcountry" runat="server" DataSourceID="odscountry" AppendDataBoundItems="True"
                                DataTextField="CountryName" DataValueField="Country_ID" SelectedValue='<%# Bind("country_id") %>'
                                AutoPostBack="True" 
                                onselectedindexchanged="ddlcountry_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;Name
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("FirstName_Con") %>'></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtname_not" runat="server" Text='<%# Bind("FirstName_Not") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;Date
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" Width="80px" runat="server" Text='<%# Bind("perfInvoice_Date") %>'></asp:TextBox>
                        </td>
                        <td>
                            Port
                        </td>
                        <td>
                                <asp:DropDownList ID="ddlport" runat="server" DataSourceID="odsPort" DataTextField="portname"
                            DataValueField="port_id" Width="150px" SelectedValue='<%# Bind("Port_ID") %>'>
                        </asp:DropDownList>
                        </td>
                        <td>
                            Email
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Email_Con") %>'></asp:TextBox>
                      
                       <asp:RequiredFieldValidator ID="RequiredBox10" runat="server" 
                                          ControlToValidate="TextBox10" Display="Dynamic" 
                                          ErrorMessage="E_Mail required" ValidationGroup="form">
                                      </asp:RequiredFieldValidator>
                                      
                                      <asp:RegularExpressionValidator ID="regexBox10" runat="server"
                                      ValidationGroup="form" 
                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="TextBox10" ErrorMessage="Invalid Email Address" 
                                    Display="Dynamic"></asp:RegularExpressionValidator> 
                      
                      
                      
                        </td>
                        <td>
                            Email
                        </td>
                        <td>
                            <asp:TextBox ID="txtemail_not" runat="server" Text='<%# Bind("Email_Not") %>'></asp:TextBox>
                       
                       
                        <asp:RequiredFieldValidator ID="Requiremail_not" runat="server" 
                                          ControlToValidate="txtemail_not" Display="Dynamic" 
                                          ErrorMessage="E_Mail required" ValidationGroup="form">
                                      </asp:RequiredFieldValidator>
                                      
                                      <asp:RegularExpressionValidator ID="Regularemail_not" runat="server"
                                      ValidationGroup="form" 
                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtemail_not" ErrorMessage="Invalid Email Address" 
                                    Display="Dynamic"></asp:RegularExpressionValidator> 
                       
                       
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Currency
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlcurrency" runat="server" DataSourceID="odscurrency" DataTextField="currency_short_name"
                                DataValueField="currency_ID" Width="80px" SelectedValue='<%# Bind("Curr_ID") %>'>
                            </asp:DropDownList>
                        </td>
                        <td>
                            Payment Mode
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlpaymentmode" runat="server" SelectedValue='<%# Bind("PaymentMode") %>'>
                                <asp:ListItem Value="1" Selected="True">Telegraphic Transfer (TT)</asp:ListItem>
                                <asp:ListItem Value="2">Bank transfer</asp:ListItem>
                                <asp:ListItem Value="3">Credit Card (PayPal)</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            Phone
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Phone_Con") %>'></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;Phone
                        </td>
                        <td>
                            <asp:TextBox ID="txtphone_not" runat="server" Text='<%# Bind("Phone_Not") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Rate
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" Width="80px" Text='<%# Bind("Curr_Rate") %>'></asp:TextBox>
                        </td>
                        <td>
                            Shipment Type
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlshipmenttype" runat="server" SelectedValue='<%# Bind("shipmenttype_ID") %>'>
                                <asp:ListItem Value="1">Container</asp:ListItem>
                                <asp:ListItem Value="2">RoRo</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;Country
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlcountry_con" runat="server" DataSourceID="odscountry" DataTextField="CountryName"
                                DataValueField="Country_ID" SelectedValue='<%# Bind("Country_ID_con") %>'>
                            </asp:DropDownList>
                        </td>
                        <td>
                            Country
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlcountry_not" runat="server" DataSourceID="odscountry" DataTextField="CountryName"
                                DataValueField="Country_ID" SelectedValue='<%# Bind("Country_ID_not") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Customer Name
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlcustomer_ID" runat="server" SelectedValue='<%# Bind("Customer_ID") %>'
                                DataSourceID="odsmembersALL" DataTextField="membership" DataValueField="customer_ID"
                                Enabled="False">
                            </asp:DropDownList>
                        </td>
                        <td>
                            Calculation Type
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("CalculationType") %>'>
                                <asp:ListItem>FOB</asp:ListItem>
                                <asp:ListItem>CIF</asp:ListItem>
                                <asp:ListItem>C&amp;F</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtaddress_con" runat="server" Text='<%# Bind("Address_Con") %>'></asp:TextBox>
                        </td>
                        <td>
                            Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtaddress_not" runat="server" Text='<%# Bind("Address_Not") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Port of Discharge</td>
                        <td>
                            <asp:DropDownList ID="ddlportofdischarge" runat="server" DataSourceID="odsAllPort" 
                                DataTextField="portname" DataValueField="port_id" 
                                SelectedValue='<%# Bind("discharge_portID") %>'>
                            </asp:DropDownList>
                        </td>
                        <td>
                            City
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("City_Con") %>'></asp:TextBox>
                        </td>
                        <td>
                            City
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("City_Not") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp; SalePerson</td>
                        <td>
                            <asp:DropDownList ID="ddlsaleperson" runat="server" 
                                DataSourceID="odsSalePerson" DataTextField="Saleperson_Name" 
                                DataValueField="saleperson_ID" 
                                SelectedValue='<%# Bind("SalesPerson_ID") %>'>
                            </asp:DropDownList>
                        </td>
                        <td>
                            Status</td>
                        <td>
                            <asp:DropDownList ID="ddlstatus" runat="server" DataSourceID="odsLegend" 
                                DataTextField="LegendName" DataValueField="Legend_ID" 
                                SelectedValue='<%# Bind("Status_ID") %>'>
                            </asp:DropDownList>
                        </td>
                        <td>
                            Fax
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("Fax_Con") %>'></asp:TextBox>
                        </td>
                        <td>
                            Fax
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("Fax_Not") %>' Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Comments
                        </td>
                        <td colspan="5">
                            <asp:TextBox ID="TextBox20" runat="server" Width="500px" Text='<%# Bind("Comments") %>'
                                Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <b>Photo</b>
                        </td>
                        <td colspan="3">
                            <b>Stock Desc</b>
                        </td>
                        <td colspan="2">
                            <b>Amount</b>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="5">

                                <img src="http://www.awan.co.jp/cars_images/<%# Eval("image1") %>" Width="103px" alt="Stock Image" /> 
                        </td>
                        <td>
                            Stock No
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Eval("FILE_REF") %>' Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;
                        </td>
                        <td>
                            FOB Price
                        </td>
                        <td>
                            <asp:TextBox ID="txtfobprice" runat="server" onblur="calcu();" Text='<%# Bind("AMOUNT") %>'></asp:TextBox>
                        
                                       <asp:RegularExpressionValidator ID="Regularfobprice" ValidationGroup="form"
                       runat="server" ControlToValidate="txtfobprice" 
                       ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                       Display="Dynamic"
                       ErrorMessage="Valid format [999,999,999.999]">
                </asp:RegularExpressionValidator>
                        
                        
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Make
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsmake" DataTextField="make"
                                DataValueField="makeID" SelectedValue='<%# Eval("MAKE_ID") %>' Enabled="False">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Freight
                        </td>
                        <td>
                            <asp:TextBox ID="txtfreight" runat="server" onblur="calcu();"  Text='<%# Bind("Freight_Amt") %>'></asp:TextBox>
                        
                        
               <asp:RegularExpressionValidator ID="Regularfreight" ValidationGroup="form"
                       runat="server" ControlToValidate="txtfreight" 
                       ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                       Display="Dynamic"
                       ErrorMessage="Valid format [999,999,999.999]">
                </asp:RegularExpressionValidator>
                        
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Make Model
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsmakemode" DataTextField="model_description"
                                DataValueField="ID" SelectedValue='<%# Eval("MAKE_MODEL_ID") %>' Enabled="False">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Vanning
                        </td>
                        <td>
                            <asp:TextBox ID="txtvanning" runat="server" onblur="calcu();"  Text='<%# Bind("vanning_amt") %>'></asp:TextBox>
                        
                 <asp:RegularExpressionValidator ID="Regularvanning" ValidationGroup="form"
                       runat="server" ControlToValidate="txtvanning" 
                       ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                       Display="Dynamic"
                       ErrorMessage="Valid format [999,999,999.999]">
                </asp:RegularExpressionValidator>
                        
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Chassis No
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Eval("CHASSIS_NO") %>' Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Inspection") %>' Text="Inspection"
                                TextAlign="Left" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtinspection_amt" runat="server"  onblur="calcu();"
                                Text='<%# Bind("Inspection_Amt") %>'></asp:TextBox>
                       
                        <asp:RegularExpressionValidator ID="Regularinspection_amt" ValidationGroup="form"
                       runat="server" ControlToValidate="txtinspection_amt" 
                       ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                       Display="Dynamic"
                       ErrorMessage="Valid format [999,999,999.999]">
                </asp:RegularExpressionValidator>
                       
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Year
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Eval("MODEL") %>' Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Insurance
                        </td>
                        <td>
                            <asp:TextBox ID="txtinsurance_amt" runat="server" onblur="calcu();"
                                Text='<%# Bind("Insurance_Amt") %>'></asp:TextBox>
                       
                              <asp:RegularExpressionValidator ID="Regularinsurance_am" ValidationGroup="form"
                       runat="server" ControlToValidate="txtinsurance_amt" 
                       ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                       Display="Dynamic"
                       ErrorMessage="Valid format [999,999,999.999]">
                </asp:RegularExpressionValidator>
                       
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            Discount
                        </td>
                        <td>
                            <asp:TextBox ID="txtdiscount" runat="server" onblur="calcu();"
                                Text='<%# Bind("Discount_Amt") %>'></asp:TextBox>
                                
                                  <asp:RegularExpressionValidator ID="Regulartxtdiscount" ValidationGroup="form"
                       runat="server" ControlToValidate="txtdiscount" 
                       ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                       Display="Dynamic"
                       ErrorMessage="Valid format [999,999,999.999]">
                </asp:RegularExpressionValidator>    
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="right">
                            <asp:Label ID="Label1" runat="server" Text="TOTAL"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txttotalamt" runat="server" Text='<%# Bind("TTL_Amount") %>'></asp:TextBox>
                       
                                               
                                  <asp:RegularExpressionValidator ID="Regulartotalamt" ValidationGroup="form"
                       runat="server" ControlToValidate="txttotalamt" 
                       ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                       Display="Dynamic"
                       ErrorMessage="Valid format [999,999,999.999]">
                </asp:RegularExpressionValidator>    
                       
                       
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>
                            Bue_Date</td>
                        <td>
                            <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("Due_Date") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Comments
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtadmincomments" runat="server" 
                                Text='<%# Bind("staff_comments") %>' Width="500px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update" />
                        </td>
                        <td>
                            <asp:LinkButton ID="lnkfinalize" runat="server" CausesValidation="True" CommandName="InsertPerforma"
                                Text="Finalize &amp; Send " OnClick="lnkfinalize_Click" />
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CommandName="InsertInvoice"
                                Text="Make Invoice" onclick="LinkButton2_Click" />
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Print</asp:LinkButton>
                        </td>
                        <td>
                            &nbsp;
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Cancel" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Label ID="lblmessage" runat="server" CssClass="errormessages" 
                                Visible="False" ></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="odsPort" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="Select_Port_ByCountryID" TypeName="masterdataTableAdapters.Select_PortTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCountry" DefaultValue="1" Name="country_ID" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odscountry" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="odsmembersALL" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="membersTableAdapters.Select_AllMembersTableAdapter">
                </asp:ObjectDataSource>
            </EditItemTemplate>
        </asp:FormView>
        
        
        <asp:Label ID="lblgeneratemessage" runat="server" Text=""></asp:Label>    
        <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
        
        
        <asp:ObjectDataSource ID="odsperforma" runat="server" 
        DeleteMethod="Delete" 
        SelectMethod="GetData"
        TypeName="membersTableAdapters.perfinvoiceTableAdapter" 
        UpdateMethod="Update" InsertMethod="Insert">
        <DeleteParameters>
            <asp:Parameter Name="perfInvoice_ID" Type="Int32" />
        </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="perfInvoice_ID" Type="Int32" />
                <asp:Parameter Name="perfInvoice_Date" Type="DateTime" />
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
                <asp:Parameter Name="TTL_Amount" DefaultValue="0"  Type="String" />
                <asp:Parameter Name="Comments" Type="String" />
                <asp:Parameter Name="Inspection" Type="Boolean" />
                <asp:Parameter Name="inspection_amt" DefaultValue="0" Type="Decimal" />
                <asp:Parameter Name="Amount" DefaultValue="0" Type="Decimal" />
                <asp:Parameter Name="freight_amt" DefaultValue="0" Type="Decimal" />
                <asp:Parameter Name="vanning_amt" DefaultValue="0" Type="Decimal" />
                <asp:Parameter Name="insurance_amt" DefaultValue="0" Type="Decimal" />
                <asp:Parameter Name="shipmenttype_id" Type="Int32" />
                <asp:Parameter Name="staff_comments" Type="String" />
                <asp:Parameter Name="salesPerson_ID" Type="Int32" />
                <asp:Parameter Name="due_date" Type="String" />
                <asp:Parameter Name="discount_amt" DefaultValue="0" Type="Decimal" />
                <asp:Parameter Name="discharge_portID" Type="Int32" />
                <asp:Parameter Name="status_ID" Type="Int32" />
                <asp:SessionParameter Name="user_ID" SessionField="user_keyid" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="perfinvoice_ID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="quote_ID" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        
        
        
        <asp:ObjectDataSource ID="odscurrency" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.currency_masterTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsmake" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.get_makes_nocountTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsmakemode" runat="server"
            SelectMethod="GetData" 
            TypeName="masterdataTableAdapters.Select_makemodelsTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odspaymentmode" runat="server"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsSalePerson" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="masterdataTableAdapters.salepersonTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsAllPort" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="masterdataTableAdapters.allportTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsLegend" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="Select_status" 
            TypeName="masterdataTableAdapters.legendTableAdapter">
        </asp:ObjectDataSource>
    
    
    
    <div style="display:none;" >
         <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" >
            <LocalReport ReportPath="reports\PerformaInvPrint.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                        Name="members_perfinvoice" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="membersTableAdapters.perfinvoiceTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="perfinvoice_ID" 
                    QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    
    
    
    <script type="text/javascript">


        function calcu() {
           
          
            var fobprice = document.getElementById('ctl00_ContentPlaceHolder1_FormView1_txtfobprice').value.replace(/,/g, "");

            var freight = document.getElementById('ctl00_ContentPlaceHolder1_FormView1_txtfreight').value.replace(/,/g, "");

            var vanning = document.getElementById('ctl00_ContentPlaceHolder1_FormView1_txtvanning').value.replace(/,/g, "");

            var inspection_amt = document.getElementById('ctl00_ContentPlaceHolder1_FormView1_txtinspection_amt').value.replace(/,/g, "");

            var insurance_amt = document.getElementById('ctl00_ContentPlaceHolder1_FormView1_txtinsurance_amt').value.replace(/,/g, "");

            var discount_amt = document.getElementById('ctl00_ContentPlaceHolder1_FormView1_txtdiscount').value.replace(/,/g, "");


           document.getElementById('ctl00_ContentPlaceHolder1_FormView1_txttotalamt').value = Number(fobprice) + Number(freight) + Number(vanning) + Number(inspection_amt) + Number(insurance_amt) - Number(discount_amt);
     
            return false
            
        }
    
    
    </script>
    
</asp:Content>
