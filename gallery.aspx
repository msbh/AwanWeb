<%@ Page Title="Awan International K.K | Gallery " 
Language="VB" 
MasterPageFile="MasterPage3.master" AutoEventWireup="false" 
CodeFile="gallery.aspx.vb" Inherits="gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

  


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <link href="css/jquery.ad-gallery.css" rel="stylesheet" type="text/css" />
  

    <script src="js/jquery.ad-gallery.js" type="text/javascript"></script>
  
  <script type="text/javascript">
      $(function() {
          $('img.image1').data('ad-desc', 'Whoa! This description is set through elm.data("ad-desc") instead of using the longdesc attribute.<br>And it contains <strong>H</strong>ow <strong>T</strong>o <strong>M</strong>eet <strong>L</strong>adies... <em>What?</em> That aint what HTML stands for? Man...');
          $('img.image1').data('ad-title', 'Title through $.data');
          $('img.image4').data('ad-desc', 'This image is wider than the wrapper, so it has been scaled down');
          $('img.image5').data('ad-desc', 'This image is higher than the wrapper, so it has been scaled down');
          var galleries = $('.ad-gallery').adGallery();
          $('#switch-effect').change(
      function() {
          galleries[0].settings.effect = $(this).val();
          return false;
      }
    );
          $('#toggle-slideshow').click(
      function() {
          galleries[0].slideshow.toggle();
          return false;
      }
    );
          $('#toggle-description').click(
      function() {
          if (!galleries[0].settings.description_wrapper) {
              galleries[0].settings.description_wrapper = $('#descriptions');
          } else {
              galleries[0].settings.description_wrapper = false;
          }
          return false;
      }
    );
      });
  </script>

  <style type="text/css">
  
 


  .example {
    border: 1px solid #CCC;
    background: #f2f2f2;
    padding: 10px;
  }
 
  pre {
    font-family: "Lucida Console", "Courier New", Verdana;
    border: 1px solid #CCC;
    background: #f2f2f2;
    padding: 10px;
  }
  code {
    font-family: "Lucida Console", "Courier New", Verdana;
    margin: 0;
    padding: 0;
  }

  #gallery {
   /* padding: 30px;
 background: #e1eef5;*/
  }
  #descriptions {
    position: relative;
    height: 50px;
    background: #EEE;
    margin-top: 10px;
    width: 640px;
    padding: 10px;
    overflow: hidden;
  }
    #descriptions .ad-image-description {
      position: absolute;
    }
      #descriptions .ad-image-description .ad-description-title {
        display: block;
      }
  </style>
  
  
  
  <div id="myform2" > 
        <ul class="myform_heading">
            <span style="color: #F0F0F0">Awan International K.K</span> in pictures</ul>
        <ul class="myform_line">
        </ul>
        <div id="content">
            <div id="container">
                <div id="gallery" class="ad-gallery">
                    <div class="ad-image-wrapper">
                    </div>
                    <div class="ad-controls">
                    </div>
                    <div class="ad-nav">
                        <div class="ad-thumbs">
                            <ul class="ad-thumb-list">
                               
                               
                                 <li><a href="photogallery/18.png">
                                    <img src="photogallery/thumbs/t18.png" title="" 
                                    alt="Japan - Office" class="image6" />
                                </a></li>
                                
                                     <li><a href="photogallery/16.png">
                                    <img src="photogallery/thumbs/t16.png" title="" 
                                    alt="Professional Office Staff" class="image6" />
                                </a></li> 
                               
                                <li><a href="photogallery/1.jpg">
                                    <img src="photogallery/thumbs/t1.jpg" class="image0" title="Desert Safari " alt="Enjoyfull Awan Staff Desert Safari">
                                </a></li>
                                <li><a href="photogallery/2.jpg">
                                    <img src="photogallery/thumbs/t2.jpg" title="Dinner in Ibrahimi Palace - Dubai" alt="Awan staff dinner out gathering"
                                        class="image0">
                                </a></li>
                                <li><a href="photogallery/3.jpg">
                                    <img src="photogallery/thumbs/t3.jpg" title="CEO" 
                                        alt="CEO Shahido Sakurai"
                                        class="image2">
                                </a></li>
                       
                                <li><a href="photogallery/5.jpg">
                                    <img src="photogallery/thumbs/t5.jpg" title="Sales Manager - Rizwan" alt="Dubai Branch Sales Manager"
                                        class="image6">
                                </a></li>

                               
                               
                                <li><a href="photogallery/9.png">
                                    <img src="photogallery/thumbs/t9.png" title="CEO" alt="Shahido Sakurai - Cheif Executive Officer of Awan International K.K"
                                        class="image6" />
                                </a></li>
                               
                    
                                
                                     <li><a href="photogallery/10.png">
                                    <img src="photogallery/thumbs/t10.png" title="Auction bid office" alt="" class="image6" />
                                </a></li>
                                
                                     <li><a href="photogallery/11.png">
                                    <img src="photogallery/thumbs/t11.png" title="Ready tires stock" alt="" class="image6" />
                                </a></li>
                                
                              <li><a href="photogallery/12.png">
                                    <img src="photogallery/thumbs/t12.png" title="Japan Office" alt="" class="image6" />
                                </a></li>
                                
                                     <li><a href="photogallery/13.png">
                                    <img src="photogallery/thumbs/t13.png" title="Awan Security Watch" alt="Security of the yard" class="image6" />
                                </a></li>
                                
                                     <li><a href="photogallery/14.png">
                                    <img src="photogallery/thumbs/t14.png" title="" alt="" class="image6" />
                                </a></li>
                                
                                     <li><a href="photogallery/15.png">
                                    <img src="photogallery/thumbs/t15.png" 
                                    title="Japan Yard" alt="" class="image6" />
                                </a></li>
                                
                                 
                                
                                 <li><a href="photogallery/17.png">
                                    <img src="photogallery/thumbs/t17.png" title="Japan Yard" 
                                    alt="" class="image6" />
                                </a></li>
                                
                               
                                
                                
                                
                                
                                
                                
                            </ul>
                        </div>
                    </div>
                </div>
              
                <p>
                    
                    <select id="switch-effect">
                        <option value="slide-hori">Slide horizontal</option>
                        <option value="slide-vert">Slide vertical</option>
                        <option value="resize">Shrink/grow</option>
                        <option value="fade">Fade</option>
                       
                    </select>
                </p>
            </div>
        </div>
  </div> 
</asp:Content>

