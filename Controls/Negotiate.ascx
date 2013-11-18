<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Negotiate.ascx.vb" Inherits="Controls_Negotiate" %>


<asp:HiddenField ID="hcurrID" runat="server" Value='<%# Bind("Currency_ID") %>' />
<asp:HiddenField ID="HcountryID" runat="server" Value='<%# Bind("Country_ID") %>' />
<asp:HiddenField ID="HshipmentTypeID" runat="server" Value='<%# Bind("shipmenttype") %>' />
<table width="350" cellspacing="0" cellpadding="0" border="0" align="left">
    <tbody>
        <tr>
            <td align="left" colspan="2">
                <h4 class="center_left_heading">
                    <%=appdata.GetLanguageString("NegotiationDeal")%>:
                </h4>
            </td>
            <td>
                <div style="display: none;" id="snake">
                    <img src="img/ajaxSnake.gif"></div>
            </td>
        </tr>
        <tr id="currency_selector">
            <td>
                <span class="clear left bold ">
                    <%=appdata.GetLanguageString("Currency")%>: </span>&nbsp;
            </td>
            <td colspan="2">
                <span class="right blue bold">
                    <asp:DropDownList ID="ddlCurrency" runat="server" DataSourceID="odsCurrency" DataTextField="currency_name"
                        DataValueField="Curr_rate" onchange="getfobprice(this.value);">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsCurrency" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="masterdataTableAdapters.Select_CurrencyTableAdapter">
                    </asp:ObjectDataSource>
                </span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="clear left bold ">
                    <%=appdata.GetLanguageString("Shipment")%>: </span>
            </td>
            <td colspan="2">
                <span class="right">
                    <asp:DropDownList ID="ddlshipmenttype" runat="server" onchange="addshipment(this.value);">
                        <asp:ListItem Value="1">RoRo</asp:ListItem>
                        <asp:ListItem Value="2">Container</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="clear">
                    <%=appdata.GetLanguageString("Shipment")%>: </span>
            </td>
            <td colspan="2">
                <span class="right">
                    <asp:DropDownList ID="ddlcountry" runat="server" DataSourceID="odscountries" DataTextField="CountryName"
                        DataValueField="Country_ID">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odscountries" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
                    </asp:ObjectDataSource>
                </span>
            </td>
        </tr>
        <tr>
            <td>
                <h4>
                    <%=appdata.GetLanguageString("Pricelable")%></h4>
            </td>
            <td>
            </td>
            <td>
                <h4>
                    <%=appdata.GetLanguageString("Negotiate")%>
                </h4>
            </td>
        </tr>
        <tr>
            <td>
                <span class="clear left">
                    <%=appdata.GetLanguageString("FOBPrice")%>:</span>
                <asp:HiddenField ID="hfobpirce" runat="server" Value='<%# Eval("FOB_PRICE") %>' />
            </td>
            <td width="151">
                <span id="fobcurr"></span>&nbsp; <span id="fob" class="right">
                    <%#Eval("fob_price")%></span>
            </td>
            <td>
                <asp:TextBox ID="txtfobcustomer" onblur="calcuCustomer();" runat="server" Text='<%# Bind("client_FOB_Price") %>'></asp:TextBox>
            </td>
        </tr>
        <tr id="freightInfo">
            <td>
                <span id="car_detail_freight" class="clear left bold ">
                    <%=appdata.GetLanguageString("Freight")%></span>
            </td>
            <td>
                <span id="freightcurr"></span>&nbsp;<span id="freight"> 0</span>
                
                
                
                
                
            </td>
            <td class="right">
                <asp:TextBox ID="txtfrieghtcustomer" Text='<%# Bind("Client_FrieghtPrice") %>' onblur="calcuCustomer();"
                    runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span id="car_detail_vanning" class="clear left bold">Vanning:</span>
            </td>
            <td>
                <span id="vanningcurr" class="right"></span>&nbsp;
                <span id="vanning" class="right">0</span>
            </td>
            <td class="right">
                <asp:TextBox ID="txtvanningcustomer" Text='<%# Bind("Client_Vanning_Price") %>' onchange="calcucustomer();"
                    runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span id="car_detail_vanning" class="clear left bold ">
                    <%=appdata.GetLanguageString("Inspection")%>:</span>
            </td>
            <td>
                <span id="inspectioncurr"></span>&nbsp;
                <asp:Label ID="inspection" runat="server" Text="0"></asp:Label>
            </td>
            <td class="right">
                <asp:TextBox ID="txtinspectioncustomer" Text='<%# Bind("Client_Inspection_Price") %>'
                    runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span id="car_detail_vanning" class="clear left">
                    <div id="insurancelabel" style="display: none;">
                        <%=appdata.GetLanguageString("Insurance")%>:</div>
                </span>
            </td>
            <td>
                <div id="insurancelabelvalue" style="display: none;">
                    <span id="insurance" class="right blue bold">US$ 0</span></div>
            </td>
            <td class="right">
                <div id="insurancelabelfield" style="display: none;">
                    <input type="text" value="" name="insurancetxt" id="insurancetxt" readonly=""></div>
            </td>
        </tr>
        <tr>
            <td>
                <span class="clear left ">
                    <%=appdata.GetLanguageString("TotalCost")%>:</span>
            </td>
            <td>
                <span id="total_costcurr"></span>&nbsp; <span id="total_cost">
                    <%#Eval("fob_price")%></span>
            </td>
            <td class="right">
                <asp:TextBox ID="txttotal_costcustomer" Text='<%# Bind("Client_Total_Cost") %>' runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3">
                <h4 class="center_left_heading">
                    <%=appdata.GetLanguageString("MyInfo")%></h4>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div class="error_h2">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <span class="left bold ">
                    <%=appdata.GetLanguageString("Name")%>:</span>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="right blue bold">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcustomername"
                    Display="Dynamic" ErrorMessage="*"> *</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtcustomername" runat="server" Text='<%# Bind("Client_Name") %>'></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span class="left bold ">
                    <%=appdata.GetLanguageString("Email")%>:</span>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="right blue bold">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcustomerEmail"
                    Display="Dynamic" ErrorMessage="*"> *</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtcustomerEmail" runat="server" Text='<%# Bind("Client_Email") %>'></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span class=" left bold ">
                    <%=appdata.GetLanguageString("Phone")%>:</span>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="right blue bold">
                <asp:TextBox ID="txtcustomer_phone" runat="server" Text='<%# Bind("Client_Phone") %>'></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span class="left">
                    <%=appdata.GetLanguageString("Comments")%>:</span>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtComments" runat="server" Text='<%# Bind("Client_Comments") %>'></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="3">
                <div id="negotiate_btn">
                    <div class="js_a">
                        <asp:LinkButton ID="Update" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Negotiate Now" />
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="3">
            </td>
        </tr>
    </tbody>
</table>
