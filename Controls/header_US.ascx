<%@ Control Language="VB" AutoEventWireup="false" CodeFile="header_US.ascx.vb" Inherits="Controls_header" %>

<script language="javascript" type="text/javascript">

        function PopupCenter(pageURL, title, w, h) {
            var left = (screen.width / 2) - (w / 2);
            var top = (screen.height / 2) - (h / 2);
            var targetWin = window.open(pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
        }

        function openChat() {

            var win = window.open('http://awancojp000.eweb702.discountasp.net/livechat/Chat.aspx', 'chat', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=510');
            win.focus();
            win.opener = window;
            return false;



        }



</script>



<div class="header_Top">
<div id="header_left">

<ul>
 
  <li><a href="http://www.facebook.com/awanint" class="sprite facebook-icon social_lf"></a></li>

 <li><a href="SalesTeams.aspx" class="youtube_icon sprite"></a></li>

  <li> <a href="javascript: void(0)" onclick="window.open('skype.html', 
  'windowname1','width=550, height=510'); return false;" target="_blank" 
  class="sprite skype-icon social_lf"></a></li>
   
   <li id="header_center"><a href="" class="sprite log-icon"></a></li>
  
  
   
             <li style=" float:right;"><a href="mailto:info@awan.co.jp&cc=malik021@yahoo.com?subject=Customer Enquiry&body=Please visit our site www.awan.co.jp"
            class="sprite mail-icon social_rf"></a></li>
      
        <li style=" float:right;"><a href="javascript://" onclick="openChat();" class="social_rf sprite Chat-icon">
        </a></li>
        <li style=" float:right;"><a href="PayPal.aspx" class="sprite paypal-icon social_rf"></a></li>
   
   
   
</ul>


</div>
   
<div id="menu">
   <ul class="menu">
    
         <li><a href="default.aspx"><span>Home</span></a></li>
        <li><a href="#"><span>About Us</span></a>
            <div>
                <ul>
                    <li><a href="CooperateOverView.aspx"><span>Corporate</span></a></li>
                    <li><a href="AwanInter.aspx"><span>Why Awan International K.K</span></a></li>
                    <li><a href="bankdetails.aspx"><span>Bank Details</span></a></li>
                    <li><a href="TermsandConditions.aspx"><span>Our Terms & Conditions</span></a></li>
                    <li><a href="SalesTeams.aspx"><span>Sales Teams</span></a></li>
                    <li><a href="gallery.aspx"><span>Photo Gallery </span></a></li>
                </ul>
            </div>
        </li>
        
        
        
      <li><a href="stocklist.aspx?lv=1"><span>Stocks</span></a> </li>
      <li><a href="#"><span>Other Info</span></a>
            <div>
                <ul class="small3_img">
                    <li class="small_img1"><a href="ShippingInfo.aspx"><span class="small_img2">Shipping
                        Info</span></a></li>
                    <li class="small_img1"><a href="Glossary.aspx"><span class="small_img2">Glossary of
                        Terms</span></a></li>
                    <li class="small_img1"><a href="http://www.auto-japanese.com/Pr_1year/index.php?company=4"><span class="small_img2">
                        Chassis Check</span></a></li>
                </ul>
            </div>
        </li>
       <li><a href="#"><span>Customer</span></a>
            <div>
                <ul class="small_img">
                    <li class="small_img1"><a href="LoginPage.aspx"><span class="small_img2">Members Login</span></a></li>
                    <li class="small_img1"><a href="membership.aspx"><span class="small_img2">New Membership
                        Request</span></a></li>
                </ul>
            </div>
        </li>
       <li><a href="#"><span>Payments</span></a>
            <div>
                <ul class="small_img">
                    <li class="small_img1"><a href="PayPal.aspx"><span class="small_img2">Paypal Interface</span></a></li>
                    <li class="small_img1"><a href="bankdetails.aspx"><span class="small_img2">Bank Details</span></a></li>
                </ul>
            </div>
        </li>
         <li style="width:115px"><a href="LoginPage.aspx"><span style="width:115px">Members Login</span></a></li>
        <li><a href="Auction.aspx"><span>Auction</span></a></li>
        <li style="width:100px"><a href="HowtoOrder.aspx"><span style="width:100px">How to Order</span></a></li>
         
        <li><a href="FAQ.aspx"><span>FAQ</span></a></li>
        <li style=" margin-left: 4px; width:110px" ><a href="ContactUs.aspx">
        <span style=" margin-left: 4px; width:110px">  Contact Us</span></a> 
        </li>
    
 
     
     
    
        
                 
         
    </ul>
    
    
    
   
</div>




</div>