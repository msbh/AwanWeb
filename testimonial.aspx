<%@ Page Title="- Order Shipping Details -" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="testimonial.aspx.vb" Inherits="order" %>

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
    
    
    
    <div class="image-sphere-style responsive">
    
        <!-- START SHADOW WRAPPER -->
        <div class="shadowBg group">
            
            <!-- START WRAPPER -->
            <div class="wrapper group">
                
                <div id="content" class="layout-sidebar-right group">
                
                   <%--SLOGAN --%> 
                    <div id="slogan" class="inner">
                        <h1 class="only">Read about our costumers. They say <span>great things</span>.</h1>
                    </div>         
                   <%--END SLOGAN --%> 
                
                   <%--START PRIMARY --%>
                    <div id="primary" class="hentry group wrapper-content" role="main">
                    
                        <div class="testimonials-list group">
                            <div class="thumb-testimonial group">
                                <div class="sphere"><img src="images/testimonials/mergot-133x133.jpg" alt="mergot" title="mergot" /></div>
                                <p class="name-testimonial group">
                                    <span class="title special-font">Joy Mèrgot</span>
                                    <span class="website"><a href="http://google.com">Satisfyed Snc</a></span>
                                </p>
                            </div>
                            <div class="the-post group">
                                <p>
                                    Quisque vel ipsum nec magna aliquet molestie in quis ipsum. 
                                    Sed nisl est, hendrerit in laoreet facilisis, placerat eget tortor. 
                                    Nunc ipsum eros, sagittis quis dignissim sed, imperdiet vitae sem. 
                                    Praesent et ultricies tellus. Etiam ornare dolor sagittis quis dignissim sed, 
                                    imperdiet vitae sem. Praesent et ultricies tellus.
                                </p>
                            </div>
                        </div>
                        
                        <div class="testimonials-list group">
                            <div class="thumb-testimonial group">
                                <div class="sphere"><img src="images/testimonials/meis-133x133.jpg" alt="meis" title="meis" /></div>
                                <p class="name-testimonial group">
                                    <span class="title special-font">Elisa Meis</span>
                                    <span class="website"><a href="http://LoveCraft">Blue Moon Ltd</a></span>
                                </p>
                            </div>
                            <div class="the-post group">
                                <p>
                                    Duis bibendum massa in felis auctor at pellentesque nulla consequat. 
                                    Duis ornare elementum nisl quis semper. <strong>In consequat tortor</strong> odio, 
                                    quis iaculis metus. Phasellus neque ipsum, volutpat molestie pellentesque dapibus, 
                                    dapibus molestie libero
                                </p>
                            </div>
                        </div>
                        
                        <div class="testimonials-list group">
                            <div class="thumb-testimonial group">
                                <div class="sphere"><img src="images/testimonials/mori.jpg" alt="mori" title="mori" /></div>
                                <p class="name-testimonial group">
                                    <span class="title special-font">Ricardo Mori</span>
                                    <span class="website"><a href="http://SolarisInc">Solaris Inc</a></span>
                                </p>
                            </div>
                            <div class="the-post group">
                                <p>
                                    Nunc egestas magna luctus mauris ultricies vitae fermentum lectus faucibus. 
                                    Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia 
                                    Curae; Mauris et augue suscipit est ultricies gravida. Phasellus sollicitudin 
                                    scelerisque pellentesque. Mauris et augue suscipit!
                                </p>
                            </div>
                        </div>
                        
                    </div>
                   <%--END CONTENT --%>
                    
                   <%--START SIDEBAR --%>
                    <div id="sidebar" class="group">
                        
                       <%--START WIDGET --%>
                        <div class="widget-first widget recent-posts">
                            <h3>From the blog</h3>
                            
                            <div class="last-news group">
                            
                                <div class="box-post group thumbnail">
                                    <div class="box-post-thumb sphere"><img src="images/various/glasses-86x86.jpg" alt="glasses" title="glasses" /></div>
                                    <div class="box-post-body group">
                                        <div class="news_title"><a href="#" title="A fresh and nice blog layout: do u like it?" class="title">A fresh and nice blog layout: do u like it?</a></div>
                                        <p class="meta"><span class="date">December 13, 2011</span></p>
                                    </div>
                                </div>
                                
                                <div class="box-post group thumbnail">
                                    <div class="box-post-thumb sphere"><img src="images/various/sushi1-86x86.jpg" alt="sushi" title="sushi" /></div>
                                    <div class="box-post-body group">
                                        <div class="news_title"><a href="#" title="50% off on our products for the month of August" class="title">50% off on our products for the month of August</a></div>
                                        <p class="meta"><span class="date">December 7, 2011</span></p>
                                    </div>
                                </div>
                                
                                <div class="box-post group thumbnail">
                                    <div class="box-post-thumb sphere"><img src="images/no_image_recentposts.jpg" alt="No Image" /></div>
                                    <div class="box-post-body group">
                                        <div class="news_title"><a href="#" title="Di&rsquo;verso, a fresh WordPress Theme" class="title">Di&#8217;verso, a fresh WordPress Theme</a></div>
                                        <p class="meta"><span class="date">December 7, 2011</span></p>
                                    </div>
                                </div>
                                
                            </div>
                            
                        </div>          
                       <%--END WIDGET --%>
                        
                       <%--START WIDGET --%>
                        <div class="widget-last widget featured-projects">
                            <h3>From the Portfolio</h3>
                            
                            <div class="featured-projects-widget">
                                <ul>
                                
                                    <li>
                                        <div class="thumb-project"><a href="#"><img src="images/various/featured-projects-widget/0016-208x168.jpg" alt="0016" title="0016" /></a></div>
                                        <h5><span>Kassyopea Theme</span></h5>
                                        <p class="categories"><a href="#" rel="tag">web design</a></p>
                                    </li>
                                    
                                    <li>
                                        <div class="thumb-project"><a href="#"><img src="images/various/featured-projects-widget/0024-208x168.jpg" alt="0024" title="0024" /></a></div>
                                        <h5><span>Olìmpo</span></h5>
                                        <p class="categories"><a href="#" rel="tag">restyling</a> & <a href="#" rel="tag">web design</a></p>
                                    </li>
                                    
                                    <li>
                                        <div class="thumb-project"><a href="#"><img src="images/various/featured-projects-widget/0041-208x168.jpg" alt="0041" title="0041" /></a></div>
                                        <h5><span>Coffee Break</span></h5>
                                        <p class="categories"><a href="#" rel="tag">logo design</a></p>
                                    </li>
                                    
                                </ul>
                            </div>
                            
                        </div>  
                       <%--END WIDGET --%>
                        
                    </div>
                   <%--END SIDEBAR --%>   
                    
                </div>
               <%--END CONTENT --%>
               </div>
               </div>
               </div>
        </asp:Content>
