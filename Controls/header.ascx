<%@ Control Language="VB" AutoEventWireup="false" CodeFile="header.ascx.vb" Inherits="Controls_header" %>

<script language="javascript" type="text/javascript">

 
    function PopupCenter(pageURL, title, w, h) {

        var left = (screen.width / 2) - (w / 2);
        var top = (screen.height / 2) - (h / 2);
        var targetWin = window.open(pageURL, title, 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
        targetWin.focus();
        //  targetWin.opener = window;
        return false;


    }

 

</script>



<div class="header_Top">
<div>
<div class="flag_Header">
    <ul>
        
        <li>
            <asp:ImageButton ID="imgENGLISH" CssClass="flagImage" ImageUrl="~/images/flag/gb.png"
                runat="server" />
        </li>
        <li><span>English</span></li>
        <li>
            <asp:ImageButton ID="imgRUSSIA" CssClass="flagImage" ImageUrl="~/images/flag/cz.png"
                runat="server" />
        </li>
        <li><span>русский</span></li>
        <li>
            <asp:ImageButton ID="imgFRANCE" CssClass="flagImage" ImageUrl="~/images/flag/fr.png"
                runat="server" />
        </li>
        <li><span>français</span></li>
        
        <li>
         
            <asp:ImageButton ID="imgARABIC" CssClass="flagImage" ImageUrl="~/images/flag/ae.png"
                runat="server" />
        </li>
                <li > <span style="font-size:13px; height:13px; text-align:left;" > العربية</span> </li>

        
    </ul>


</div>

</div>
<div id="header_left">

<ul>
    <li><a href="http://www.facebook.com/awanint" class="sprite facebook-icon social_lf">
    </a></li>
    <li><a href="SalesTeams.aspx" class="youtube_icon sprite"></a></li>
    <li><a href="javascript: void(0);" onclick="PopupCenter('skype.html','Skype',750,520);" 
    class="sprite skype-icon social_lf">
    </a></li>
    
    <li id="header_center"><a href="" class="sprite log-icon"></a></li>
    
      
<li style="float: right; margin-right: 15px;"><a href="javascript: void(0);" onclick="PopupCenter('EmailPage.htm','EmailPage',500,250);" 
        class="sprite mail-icon social_rf"></a>
        
        
        
        </li>
    <li style="float: right;"><a href="http://awan.ajes.com/" target="_blank" class="social_rf sprite Chat-icon">
    </a></li>
  <li style="float: right; margin-left: 1px; margin-right: 10px;"><a href="PayPal.aspx" class="sprite paypal-icon social_rf">
    </a></li>

    
    
</ul>


</div>

    <div id="menu">
        <ul class="menu">
            <%=appdata.GetLanguageString("menu")%>
            
            
         
     
        </ul>
    </div>



</div>