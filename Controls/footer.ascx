<%@ Control Language="VB" AutoEventWireup="false" CodeFile="footer.ascx.vb" Inherits="Controls_footer" %>
<!-- Page styles -->
<link type='text/css' href='css2/demo.css' rel='stylesheet' media='screen' />
<!-- Confirm CSS files -->
<link type='text/css' href='css2/confirm.css' rel='stylesheet' media='screen' />
<!-- JS files are loaded at the bottom of the page -->
<div id="footer" class="footer_sprit_images">
    <div id="container" style="width: 977px;">
        <ul class="left">
            <li class="text_header"><span>
                <%=appdata.GetLanguageString("footerleft.heading")%></span> </li>
            <li class="left" style="padding-bottom: 23px;">
                <%=appdata.GetLanguageString("footerleft.Address")%></li>
            <li class="left" style="padding-bottom: 23px;">
                <%=appdata.GetLanguageString("footerleft.phone")%></li>
            <li class="left" style="padding-bottom: 23px;">
                <%=appdata.GetLanguageString("footerleft.copyright")%></li>
            <li class="left js_a"><a href="PayPal.aspx">
                <p id="paypal_Sprit_Images">
                </p>
            </a></li>
        </ul>
        <ul class="center" style="width: 331px; margin-left: -14px; margin-right: 4px;">
            <li class="text_header">
                <%=appdata.GetLanguageString("GlobalStockLocationText")%></li>
            <li class="center_lf"><a href="stocklist.aspx?lv=1&globaloc=2&drive=L" class="japan sprite">
                <span>Japan (LHD)</span></a></li>
            <li class="center_rf"><a href="stocklist.aspx?lv=1&globaloc=2&drive=R" class="japan sprite">
                <span>Japan (RHD)</span></a></li>
            <li class="center_lf"><a href="stocklist.aspx?lv=1&globaloc=3&it=1" class="uae sprite">
                <span>UAE (JP Import)</span></a></li>
            <li class="center_rf"><a href="stocklist.aspx?lv=1&globaloc=3&it=2" class="uae sprite">
                <span>UAE (Other Import)</span></a></li>
            <li class="center_lf"><a href="stocklist.aspx?lv=1&globaloc=11" class="SouthKorea sprite">
                <span>South Korea</span></a></li>
            <li class="center_rf" style="margin-left: -5px;"><a class="Somalia sprite" href="stocklist.aspx?lv=1&globaloc=7"
                style="padding-left: 46px; margin-left: -2px;"><span>USA</span></a></li>
            <center style="border-width: 0; margin-left: 28px; margin-top: 37px;">
                <asp:Image runat="server" ID="visitCounter" ImageUrl="~/VisitCounter.aspx" />
            </center>
        </ul>
        <ul class="right" style="margin-left: 76px; width: 281px; margin-right: -17px;">
            <li class="text_header">
                <%=appdata.GetLanguageString("Quickcontact")%>
            </li>
            <li class="right">
                <%=appdata.GetLanguageString("QuickContactStartText")%>
            </li>
            <li>
            <div>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr><td>
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td class="input_images" valign="top">
                            <asp:TextBox ID="txtclientname" runat="server" CssClass="input_text" Text="name" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" ControlToValidate="txtclientname"
                                InitialValue="name" runat="server" ValidationGroup="quickcontact" ErrorMessage="Name required">*</asp:RequiredFieldValidator>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="input_images" valign="top">
                            <asp:TextBox ID="txtclientemail" runat="server" Text="email" CssClass="input_text">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtclientemail"
                                InitialValue="email" Display="None" ValidationGroup="quickcontact" runat="server"
                                ErrorMessage="Email Required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtclientemail" ErrorMessage="Invalid email address" ValidationGroup="quickcontact"
                                Display="None"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="input_images" valign="top">
                            <input runat="server" type="text" id="txtCountry" value="Country" class="input_text">
                        </td>
                    </tr>
                    <tr>
                        <td class="input_images" valign="top">
                            <input runat="server" type="text" id="txtclientskype" value="skype ID" class="input_text">
                        </td>
                    </tr>
                    <tr><td style="height:2px;"></td></tr>
                    <tr>
                        <td  class="js_a">
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" ValidationGroup="quickcontact"> <%=appdata.GetLanguageString("Quickcontact.send")%></asp:LinkButton><br />
                            <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                            <asp:ValidationSummary ID="ValidationSummary1" CssClass="errormessages_short" ValidationGroup="quickcontact"
                                DisplayMode="List" runat="server" />
                        </td>
                    </tr>
                </table></td><td>&nbsp;</td><td>
                <table border="0" cellspacing="0" cellpadding="0" width="100%"><tr><td class="input_images2">
                            <asp:TextBox runat="server" ID="txtclientcomments" value="Comments" class="input_text"
                                Style="padding-top:-20px; padding-left:5px;  width: 108px;" TextMode="SingleLine" />
                        </td></tr></table>
                       </td> </tr></table>
                </div>
            </li>
            <%--<ul class="input_images" style="width: 139px;">
                <asp:TextBox ID="txtclientname" runat="server" CssClass="input_text" Text="name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" ControlToValidate="txtclientname"
                    InitialValue="name" runat="server" ValidationGroup="quickcontact" ErrorMessage="Name required">*</asp:RequiredFieldValidator>
            </ul>
            <ul class="input_images" style="width: 139px;">
                <asp:TextBox ID="txtclientemail" runat="server" Text="email" CssClass="input_text">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtclientemail"
                    InitialValue="email" Display="None" ValidationGroup="quickcontact" runat="server"
                    ErrorMessage="Email Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="txtclientemail" ErrorMessage="Invalid email address" ValidationGroup="quickcontact"
                    Display="None"></asp:RegularExpressionValidator>
            </ul>
            
            <ul class="input_images" style="width: 139px;">
                <input runat="server" type="text" id="txtCountry" value="Country" class="input_text">
            </ul>
            <ul class="input_images" style="width: 139px;">
                <input runat="server" type="text" id="txtclientskype" value="skype ID" class="input_text">
            </ul>
            <div class="input_images2" style="margin-right: 11px; margin-left: 15px; width: 129px;height:146px;">
                <input runat="server" type="text" id="txtclientcomments" value="Comments" class="input_text" style="padding-top:16px;">
                <asp:TextBox  runat="server"  id="txtclientcomments" value="Comments" class="input_text" style="padding-top:20px;height:115px; width:108px;" TextMode="SingleLine" />
            </div>
            <ul class="js_a" style="margin-left: 1px; margin-left: 3px; margin-top: 17px; padding-left: 0;">
                <li>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" ValidationGroup="quickcontact"> <%=appdata.GetLanguageString("Quickcontact.send")%></asp:LinkButton><br />
                    <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" CssClass="errormessages_short" ValidationGroup="quickcontact"
                        DisplayMode="List" runat="server" />
                </li>
            </ul>--%>
        </ul>
        <ul id="footer_topnav_sprit_images" class="topnav" style="margin-left: 20px; width: 944px;">
            <li style="width: 67px; margin-right: 17px; margin-left: -28px;"><a href="ContactUs.aspx">
                Contact Us</a></li>
            <li style="width: 92px; margin-right: 7px; margin-left: -11px;"><a href="CooperateOverView.aspx">
                About Us</a></li>
            <li style="width: 86px; margin-right: 0px; margin-left: -14px;"><a href="HowtoOrder.aspx"
                style="margin-left: -11px; width: 72px; padding-left: 0px;">How to Order</a></li>
            <li style="margin-right: 0px; width: 78px; margin-left: -13px;"><a style="width: 72px;
                padding-left: 0px;" href="stocklist.aspx">Stock</a></li>
            <li style="margin-right: 0px; width: 89px; margin-left: -20px;"><a href="TermsandConditions.aspx"
                style="width: 0px;">
                <p style="margin-left: -55px; width: 116px;">
                    Terms & Condition</p>
            </a></li>
            <li style="width: 244px; margin-right: 314px; margin-left: 18px;"><a style="width: 303px;
                margin-left: 0px;" href="default.aspx">www.awan.co.jp | All Rights Reserved 2011</a></li>
        </ul>
        <!-- modal content -->
        <div id='confirm'>
            <div class='header'>
                <span>Select Japan or Other Imports</span></div>
            <div class='message'>
            </div>
            <center>
                <div class="js_a">
                    <a href="stocklist.aspx?lv=1&globaloc=3&it=1">Japan Imports </a><a href="stocklist.aspx?lv=1&globaloc=3&it=2">
                        Other Imports </a>
                </div>
            </center>
        </div>
        <!-- preload the images -->
        <div style='display: none'>
            <img src='img/confirm/header.gif' alt='' />
            <img src='img/confirm/button.gif' alt='' />
        </div>
    </div>
</div>
