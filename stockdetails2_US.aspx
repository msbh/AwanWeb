<%@ Page Title="Awan International K.K | Stock Details " Language="VB" MasterPageFile="~/MasterPage2.master"
    AutoEventWireup="false" CodeFile="stockdetails2_US.aspx.vb" Inherits="stockdetails2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/jquery.lightbox-0.5.css" media="screen" />
    <!----Lightbox -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        $(function() {
            $('#gallery a').lightBox();
        });
    </script>

    <div id="myform">
    
            <asp:FormView ID="FormView1" runat="server" DataSourceID="odsStockDetails">
                <ItemTemplate>
                   
                    <tr class="js_a">
                        <td style="width:450px; vertical-align:middle; " >
                           
                                <h3>
                                    <%# Eval("make") %>
                                    <%#Eval("model_description")%>
                                   &nbsp; <%# Eval("model") %>
                                </h3>
                          
                        </td>
                        
                        <td style=" width:210px; vertical-align:bottom;" >
                        <h4>
                        Price: <%# Eval("currency_short_name") %> 
                         <%# Eval("FOB_PRICE") %>
                        
                        
                        </h4>
                        
                        </td>
                        
                        
                        <td >
                            &nbsp;   &nbsp;   &nbsp; <a href="order1.aspx?id=<%#Eval("id")%>&i=1">
                                Order </a>&nbsp; <a href="nego2.aspx?id=<%#Eval("id")%>&i=1">Negotiate </a>&nbsp;
                            <a href="enquiry.aspx?ID=<%#Eval("id")%>">Enquiry </a>
                        </td>
                    </tr>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top: 5px;">
                        <tbody>
                            <tr>
                                <td>
                                    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="smallblack">
                                        <tbody>
                                            <tr>
                                                <td width="80%">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="smallblack">
                                                        <tbody>
                                                            <tr>
                                                                <!-- Vehicle big image  -->
                                                                <td width="45%" valign="top">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="normaltext_gr">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                               
                                                                                   <div id="gallery">
                                                                                    <table width="100%" border="0" cellspacing="2" cellpadding="0" class="normaltext_gr">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td height="200" valign="top">
                                                                                                    <table class="normaltext_gr" cellpadding="0" cellspacing="2">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td width="347" height="330" align="center" class="image_border">
                                                                                                                    <img src="http://www.awan.co.jp/cars_images/<%# Eval("image1") %>" width="430" height="323"
                                                                                                                        border="0" name="main_pic">
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2" valign="top">
                                                                                                    <table cellpadding="0" cellspacing="2" border="0">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td align="right" valign="top">
                                                                                                                    <div class="image_border">
                                                                                                                        <a href="http://www.awan.co.jp/cars_images/<%# Eval("image1") %>" class="st_size"
                                                                                                                            rel="lightbox[a]" title="<%# Eval("make") %>  <%#Eval("model_description")%>"
                                                                                                                            style="padding-bottom: 2px">
                                                                                                                            <img src="http://www.awan.co.jp/cars_images/<%# Eval("image1") %>" width="100" height="75"
                                                                                                                                border="0" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/<%# Eval("image1") %>'"></a>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                                <td align="right" valign="top">
                                                                                                                    <div class="image_border">
                                                                                                                        <a href="http://www.awan.co.jp/cars_images/<%# Eval("image2") %>" class="st_size"
                                                                                                                            rel="lightbox[a]" title="<%# Eval("make") %>  <%#Eval("model_description")%>"
                                                                                                                            style="padding-bottom: 2px">
                                                                                                                            <img src="http://www.awan.co.jp/cars_images/<%# Eval("image2") %>" width="100" height="75"
                                                                                                                                border="0" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/<%# Eval("image2") %>'"></a>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                                <td align="right" valign="top">
                                                                                                                    <div class="image_border">
                                                                                                                        <a href="http://www.awan.co.jp/cars_images/<%# Eval("image3") %>" class="st_size"
                                                                                                                            rel="lightbox[a]" title="" style="padding-bottom: 2px">
                                                                                                                            <img src="http://www.awan.co.jp/cars_images/<%# Eval("image3") %>" width="100" height="75"
                                                                                                                                border="0" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/<%# Eval("image3") %>'"></a>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                                <td align="right" valign="top">
                                                                                                                    <div class="image_border">
                                                                                                                        <a href="http://www.awan.co.jp/cars_images/<%# Eval("image4") %>" class="st_size"
                                                                                                                            rel="lightbox[a]" title="<%# Eval("make") %>  <%#Eval("model_description")%>"
                                                                                                                            style="padding-bottom: 2px">
                                                                                                                            <img src="http://www.awan.co.jp/cars_images/<%# Eval("image4") %>" width="100" height="75"
                                                                                                                                border="0" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/<%# Eval("image4") %>'"></a>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td align="right" valign="top">
                                                                                                                    <div class="image_border">
                                                                                                                        <a href="http://www.awan.co.jp/cars_images/<%# Eval("image5") %>" class="st_size"
                                                                                                                            rel="lightbox[a]" title="<%# Eval("make") %>  <%#Eval("model_description")%>"
                                                                                                                            style="padding-bottom: 2px">
                                                                                                                            <img src="http://www.awan.co.jp/cars_images/<%# Eval("image5") %>" width="100" height="75"
                                                                                                                                border="0" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/<%# Eval("image5") %>'"></a>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                                <td align="right" valign="top">
                                                                                                                    <div class="image_border">
                                                                                                                        <a href="http://www.awan.co.jp/cars_images/<%# Eval("image6") %>" class="st_size"
                                                                                                                            rel="lightbox[a]" title="<%# Eval("make") %>  <%#Eval("model_description")%>"
                                                                                                                            style="padding-bottom: 2px">
                                                                                                                            <img src="http://www.awan.co.jp/cars_images/<%# Eval("image6") %>" width="100" height="75"
                                                                                                                                border="0" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/<%# Eval("image6") %>'"></a>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                                <td align="right" valign="top">
                                                                                                                    <div class="image_border">
                                                                                                                        <a href="http://www.awan.co.jp/cars_images/noimage.png" class="st_size" rel="lightbox[a]"
                                                                                                                            title="<%# Eval("make") %>  <%#Eval("model_description")%>" style="padding-bottom: 2px">
                                                                                                                            <img src="http://www.awan.co.jp/cars_images/noimage.png" width="100" height="75"
                                                                                                                                border="0" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/noimage.png'"></a>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                                <td align="right" valign="top">
                                                                                                                    <div class="image_border">
                                                                                                                        <a href="http://www.awan.co.jp/cars_images/noimage.png" class="st_size" rel="lightbox[a]"
                                                                                                                            title="<%# Eval("make") %>  <%#Eval("model_description")%>" style="padding-bottom: 2px">
                                                                                                                            <img src="http://www.awan.co.jp/cars_images/noimage.png" width="100" height="75"
                                                                                                                                border="0" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/noimage.png'"></a>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                               
                                                                               </div>
                                                                               
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td width="5">
                                                                </td>
                                                                <td valign="top">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td height="5">
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td valign="top" width="65%">
                                                                                    <table width="100%" border="0" cellspacing="1" cellpadding="4" class="smallblack"
                                                                                        bgcolor="#999999">
                                                                                        <tbody>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td width="50%" valign="top" bgcolor="#EAEAEA">
                                                                                                    <strong>Stock No.</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%# Eval("FILE_REF") %>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td width="50%" valign="top" bgcolor="#EAEAEA">
                                                                                                    <strong>Chassis No.</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%#Eval("CHASSIS_NO")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td width="50%" valign="top" bgcolor="#EAEAEA">
                                                                                                    <strong>Make</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%#Eval("MAKE")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td width="50%" valign="top" bgcolor="#EAEAEA">
                                                                                                    <strong>Model</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%#Eval("model_description")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td width="50%" valign="top" bgcolor="#EAEAEA">
                                                                                                    <strong>Vehicle Grade</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%#Eval("ENGINE_POWER")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#EAEAEA">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Year/Month</strong>
                                                                                                </td>
                                                                                                <td bgcolor="#FFFFFF">
                                                                                                    <%#Eval("MODEL")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#EAEAEA">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Status</strong>
                                                                                                </td>
                                                                                                <td bgcolor="#FFFFFF" class="smallred1">
                                                                                                    <b style="color: black;">
                                                                                                        <%#Eval("availability")%></b>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Mileage (Km)</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <strong>
                                                                                                        <%#Eval("mileage")%></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#EAEAEA">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Steering</strong>
                                                                                                </td>
                                                                                                <td bgcolor="#FFFFFF">
                                                                                                    <%#Eval("drive")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Engine (CC)</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%#Eval("CC")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#EAEAEA">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Fuel</strong>
                                                                                                </td>
                                                                                                <td bgcolor="#FFFFFF">
                                                                                                    <%#Eval("FUEL_TYPE")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Transmission</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%#Eval("TRANSMISSION")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#EAEAEA">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Seats</strong>
                                                                                                </td>
                                                                                                <td bgcolor="#FFFFFF">
                                                                                                    <%#Eval("SEAT")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Door</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%#Eval("DOOR")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#EAEAEA">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Colour</strong>
                                                                                                </td>
                                                                                                <td bgcolor="#FFFFFF">
                                                                                                    <%#Eval("COLOR")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Interior Color</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%#Eval("interior_color")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Type</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%#Eval("SEAT")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr bgcolor="#FFFFFF">
                                                                                                <td bgcolor="#EAEAEA">
                                                                                                    <strong>Location</strong>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <%#Eval("globallocation")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="5">
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td valign="top" align="right">
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF"
                                                                                        class="smallblack">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td height="100" style="border: 1px solid #999999" align="left" valign="top">
                                                                                                    <strong>Vehicle options:</strong><br>
                                                                                                    <div id="features">
                                                                                                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="2">
                                                                                                            <HeaderTemplate>
                                                                                                                <div class="details_options">
                                                                                                                </div>
                                                                                                            </HeaderTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <table class="details_options_items">
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                            <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/images/check.jpg"
                                                                                                                                Width="22px" />
                                                                                                                        </td>
                                                                                                                        <td>
                                                                                                                            <asp:Label ID="att_name" runat="server" Text='<%# Eval("ATT_NAME") %>' Width="200px"></asp:Label>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:DataList>
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="5">
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        
        <asp:ObjectDataSource ID="odsStockDetails" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="select_stock" TypeName="dsStockTableAdapters.Select_StockTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
