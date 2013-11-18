<%@ Control Language="VB" AutoEventWireup="false" CodeFile="header_RU.ascx.vb" Inherits="Controls_header" %>

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
       <li><a href="default.aspx"><span>домой</span></a></li>
       <li><a href="#"><span>О компании</span></a>
           <div>
               <ul>
                   <li><a href="CooperateOverView.aspx"><span>корпоративный</span></a></li>
                   <li><a href="AwanInter.aspx"><span>Аван Международный K.K</span></a></li>
                   <li><a href="bankdetails.aspx"><span>Банковские реквизиты</span></a></li>
                   <li><a href="TermsandConditions.aspx"><span>Наши условия и условия</span></a></li>
                   <li><a href="SalesTeams.aspx"><span>Продажи группы</span></a></li>
                   <li><a href="gallery.aspx"><span>Фотогалерея </span></a></li>
               </ul>
           </div>
       </li>
       <li><a href="stocklist.aspx?lv=1"><span>Акции</span></a> </li>
       <li><a href="#"><span>информация</span></a>
           <div>
               <ul class="small3_img">
                   <li class="small_img1"><a href="ShippingInfo.aspx"><span class="small_img2">Информация
                       о доставке</span></a></li>
                   <li class="small_img1"><a href="Glossary.aspx"><span class="small_img2">Глоссарий терминов</span></a></li>
                   <li class="small_img1"><a href="http://www.auto-japanese.com/Pr_1year/index.php?company=4">
                       <span class="small_img2">Проверьте шасси</span></a></li>
               </ul>
           </div>
       </li>
       <li><a href="#"><span>клиент</span></a>
           <div>
               <ul class="small_img">
                   <li class="small_img1"><a href="LoginPage.aspx"><span class="small_img2">страницу входа</span></a></li>
                   <li class="small_img1"><a href="membership.aspx"><span class="small_img2">член запрос</span></a></li>
               </ul>
           </div>
       </li>
       <li><a href="#"><span>платежи</span></a>
           <div>
               <ul class="small_img">
                   <li class="small_img1"><a href="PayPal.aspx"><span class="small_img2">Paypal интерфейс</span></a></li>
                   <li class="small_img1"><a href="bankdetails.aspx"><span class="small_img2">Банк</span></a></li>
               </ul>
           </div>
       </li>
       <li style="width: 115px"><a href="LoginPage.aspx"><span style="width: 115px">вход в члены</span></a></li>
       <li><a href="Auction.aspx"><span>аукцион</span></a></li>
       <li style="width: 100px"><a href="HowtoOrder.aspx"><span style="width: 100px">Как заказать</span></a></li>
       <li><a href="FAQ.aspx"><span>ЧАВО</span></a></li>
       <li style="margin-left: 4px; width: 110px"><a href="ContactUs.aspx"><span style="margin-left: 4px;
           width: 110px">связаться</span></a> </li>
   </ul>
    
    
    
   
</div>




</div>