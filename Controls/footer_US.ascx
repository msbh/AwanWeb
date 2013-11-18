<%@ Control Language="VB" AutoEventWireup="false" CodeFile="footer_US.ascx.vb" Inherits="Controls_footer" %>
<div id="footer" class="footer_sprit_images">
    <div id="container">
        <ul class="left">
            <li class="text_header">Awan International K.K</li>
            <li class="left">939-0304 Toyamaken Imizu shi Kosugi shiraishi 138-1 Japan</li>
            <li class="left">Phone No: +81-766-59-8751 Fax: +81-766-59-8750 </li>
            <li class="left">Copyright © 2010-11 Awan International K.K. All Rights Reserved</li>
            <li class="left js_a">
            
            
            <a href="PayPal.aspx">
             <p id="paypal_Sprit_Images"></p>
             </a>
             
             </li>
        </ul>
        <ul class="center">
            <li class="text_header"><%=appdata.GetLanguageString("GlobalStockLocationText")%></li>
            <li class="center_lf"><a href="#"
            
            onclick="OpenSitelliteWindow('http://www.aucnetglobal.com/augcarsrch02.php?url=eRVYGN1FgNqQgq0Ks0esQG-9WPhlpfPEpkoFVQmP5ndbFg.dJ5nuu');"
            
            
             
            class="japan sprite">
                <span>Japan</span></a></li>
            <li class="center_rf"><a href="stocklist.aspx?lv=1&globaloc=3" class="uae sprite"><span>
                U.A.E</span></a></li>
            <li class="center_lf"><a href="stocklist.aspx?lv=1&globaloc=18" class="Somalia sprite">
                <span>Somalia</span></a></li>
            <li class="center_rf"><a href="stocklist.aspx?lv=1&globaloc=11" class="SouthKorea sprite">
                <span>South Korea</span></a></li>
            <li class="center_lf"><a href="stocklist.aspx?lv=1&globaloc=5" class="Pakistan sprite">
                <span>Pakistan</span></a></li>
            <li class="center_rf"><a href="stocklist.aspx?lv=1&globaloc=6" class="Kenya sprite">
                <span>Kenya</span></a></li>
            <li class="center_lf"><a href="stocklist.aspx?lv=1&globaloc=18" class="Uganda sprite">
                <span>Kyrgyzstan</span></a></li>
            <li class="center_rf"><a href="stocklist.aspx?lv=1&globaloc=15" class="Russia sprite">
                <span>Russia</span></a></li>
            <li class="center_lf"><a href="stocklist.aspx?lv=1&globaloc=13" class="Tanzania sprite">
                <span>Tanzania</span></a></li>
            <li class="center_rf"><a href="stocklist.aspx?lv=1&globaloc=19" class="kazakhistan sprite">
                <span>Kazakhstan</span></a></li>
            <li style="margin-top: 20px;">
                <center>
                    <asp:Image runat="server" ID="visitCounter" ImageUrl="~/VisitCounter.aspx" />
                </center>
            </li>
        </ul>
        <ul class="right">
            <li class="text_header">
            <%=appdata.GetLanguageString("Quickcontact")%>
            
            </li>
            <li class="right">
    
              <%=appdata.GetLanguageString("QuickContactStartText")%>
            
             </li>
            
            
            
            <ul class="input_images">
                <asp:TextBox ID="txtclientname" runat="server" CssClass="input_text" Text="name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" 
                ControlToValidate="txtclientname" InitialValue="name"
                    runat="server" ValidationGroup="quickcontact"  
                    ErrorMessage="Name required">*</asp:RequiredFieldValidator>
            </ul>
            <ul class="input_images">
                <asp:TextBox ID="txtclientemail" runat="server" Text="email" CssClass="input_text">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtclientemail"
                    InitialValue="email" Display="None" ValidationGroup="quickcontact" runat="server"
                    ErrorMessage="Email Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexEmailValid" 
                    runat="server" 
                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="txtclientemail" 
                    ErrorMessage="Invalid email address" 
                    ValidationGroup="quickcontact"
                    Display="None"></asp:RegularExpressionValidator>
            </ul>
            <ul class="input_images">
                <input runat="server" type="text" id="txtclientskype" value="skype ID" class="input_text">
            </ul>
            <div class="input_images2">
                <input runat="server" type="text" id="txtclientcomments" value="Comments" class="input_text">
            </div>
            <ul class="js_a" style="margin-left: 1px; margin-left: 3px; margin-top: 17px; padding-left: 0;">
                <li>
                    <asp:LinkButton ID="LinkButton1" runat="server" 
                    CausesValidation="true" 
                    ValidationGroup="quickcontact"> <%=appdata.GetLanguageString("Quickcontact.send")%></asp:LinkButton><br />
                    <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                    
                    <asp:ValidationSummary ID="ValidationSummary1" CssClass="errormessages_short" 
                    ValidationGroup="quickcontact" DisplayMode="List"  runat="server"   />
                    
                </li>
            </ul>
        </ul>
      <ul class="topnav" id="footer_topnav_sprit_images">
            <li style="width: 67px; margin-right: 17px; margin-left: 0px;"><a href="ContactUs.aspx"> Contact Us</a></li>
            <li style="width: 92px; margin-right: 7px; margin-left: 0px;"><a href="HowtoOrder.aspx"> How to Order</a></li>
            <li style="width: 141px;"><a style="width: 120px;" href="TermsandConditions.aspx">Terms  &amp; Condition</a></li>
            <li><a href="CooperateOverView.aspx">About Us</a></li>
            <li style="margin-right: 0px; width: 79px;"><a href="stocklist.aspx?lv=1">Stock </a></li>
            <li><a href="default.aspx" style="width: 485px; margin-left: -181px;">www.awan.co.jp| Все права защищены 2011</a></li>
        </ul>
    </div>
    
    
    
     <script type="text/javascript">

        function OpenSitelliteWindow(url) {
            var winhandledt;
            winhandledt = window.open(url, 'satellite', "top=100,left=100,resizable=yes,scrollbars=yes,location=no,menubar=no,toolbar=no,status=no");
            winhandledt.focus();
        }

    </script>
    
    
</div>
