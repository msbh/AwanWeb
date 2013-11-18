<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Default_RU.aspx.vb" Inherits="_Default" Title="Awan International K.K | Home Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   <%-- <script src="js/custom.js" type="text/javascript"></script>
--%>
    <script type="text/javascript">

        function quicksearch() {

            var makevalue = document.getElementById('ctl00_ContentPlaceHolder1_ddlMake').value;
            var makemodelvalue = document.getElementById('ctl00_ContentPlaceHolder1_ddlMakeModel').value;
            var modelyear = document.getElementById('ctl00_ContentPlaceHolder1_ddlYear').value;
            var steering = document.getElementById('ctl00_ContentPlaceHolder1_ddldrive').value;

            window.location = 'stocklist.aspx?lv=1&make=' + makevalue + '&makemodel=' + makemodelvalue + '&model=' + modelyear + '&drive=' + steering + '';



        }



    </script>

    <div id="content-container">
        <div id="content_content1">
            <div id="left">
                <div class="box">
                    <div class="box-center">
                        <div class="box-content-container">
                            <div class="box-content">
                                <div class="box-header">
                                    <h2>
                                       Быстрый поиск</h2>
                                </div>
                                <div id="QuickSearch">
                                    <asp:ObjectDataSource ID="odsMakeName" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="getMakeModelNames" TypeName="masterdataTableAdapters.tblmake_detailsTableAdapter">
                                    </asp:ObjectDataSource>
                                    <asp:ObjectDataSource ID="odsMake" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="masterdataTableAdapters.make_nocountTableAdapter">
                                    </asp:ObjectDataSource>
                                    <ul>
                                        <li style="width: 70px; color: #989393; height: 16px; margin-top: 6px;"><span>делать</span></li>
                                        <li>
                                            <asp:DropDownList ID="ddlMake" runat="server" DataSourceID="odsMake" DataTextField="make"
                                                DataValueField="makeID">
                                                <asp:ListItem Value="0">Any</asp:ListItem>
                                            </asp:DropDownList>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li style="width: 70px; color: #989393; height: 16px; margin-top: 6px;"><span>модель</span></li>
                                        <li>
                                            <asp:DropDownList ID="ddlMakeModel" runat="server" DataSourceID="odsMakeName" DataTextField="model_description"
                                                DataValueField="ID">
                                                <asp:ListItem Value="0">Any</asp:ListItem>
                                            </asp:DropDownList>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li style="width: 70px; color: #989393; height: 16px; margin-top: 6px;"><span>год</span></li>
                                        <li>
                                            <asp:DropDownList ID="ddlYear" runat="server">
                                                <asp:ListItem>Any</asp:ListItem>
                                                <asp:ListItem>1990</asp:ListItem>
                                                <asp:ListItem>1991</asp:ListItem>
                                                <asp:ListItem>1992</asp:ListItem>
                                                <asp:ListItem>1993</asp:ListItem>
                                                <asp:ListItem>1994</asp:ListItem>
                                                <asp:ListItem>1995</asp:ListItem>
                                                <asp:ListItem>1996</asp:ListItem>
                                                <asp:ListItem>1997</asp:ListItem>
                                                <asp:ListItem>1998</asp:ListItem>
                                                <asp:ListItem>1999</asp:ListItem>
                                                <asp:ListItem>2000</asp:ListItem>
                                                <asp:ListItem>2001</asp:ListItem>
                                                <asp:ListItem>2002</asp:ListItem>
                                                <asp:ListItem>2003</asp:ListItem>
                                                <asp:ListItem>2004</asp:ListItem>
                                                <asp:ListItem>2005</asp:ListItem>
                                                <asp:ListItem>2006</asp:ListItem>
                                                <asp:ListItem>2007</asp:ListItem>
                                                <asp:ListItem>2008</asp:ListItem>
                                                <asp:ListItem>2009</asp:ListItem>
                                                <asp:ListItem>2010</asp:ListItem>
                                                <asp:ListItem>2011</asp:ListItem>
                                                <asp:ListItem>2012</asp:ListItem>
                                            </asp:DropDownList>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li style="width: 70px; color: #989393; height: 16px; margin-top: 6px;"><span>рулевой</span></li>
                                        <li>
                                            <asp:DropDownList ID="ddldrive" runat="server">
                                                <asp:ListItem Value="R">Right Hand</asp:ListItem>
                                                <asp:ListItem Value="L">Left Hand</asp:ListItem>
                                                <asp:ListItem Value="C">Classic Cars</asp:ListItem>
                                                <asp:ListItem Selected="True" Value="">Any</asp:ListItem>
                                            </asp:DropDownList>
                                            
                                            
                                            
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="js_a"><a onclick="quicksearch();">Поиск</a></li>
                                    </ul>
                                </div>
                                <div class="box-footer">
                                    <div class="box-footer-padding">
                                        <a href="stocklist.aspx?lv=1">Расширенный поиск</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div id="center">
              <div class="img_car_box2">
                 
               
                
                  <a href="becomeagent.aspx">
                       <p id="becomeagent_Sprit_Images"></p>
                    </a>
                </div>
               
             <div class="img_car_box3">
             
                   <a href="sellycar.aspx">
                   <p id="sellcar_Sprit_Images">
                   </p>
                   </a>
                   
                   
                </div>
            </div>
            
            
            <div id="right">
                <div class="box">
                    <div class="box-center">
                        <div class="box-content-container">
                            <div class="box-content">
                                <div class="box-header">
                                    <h2>
                                   
                                        <%=appdata.GetLanguageString("Searchbybodytype")%>
                                        
                                        </h2>
                                </div>
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="odsbodyType" RepeatColumns="3"
                                    RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <div id="SearchByType">
                                            <ul>
                                                <li><a href="stocklist.aspx?makecat=<%# Eval("veh_cat_id") %>">
                                                    <img src='<%# Eval("BODY_IMAGE") %>' class="bodytypeimage" alt="" />
                                                </a></li>
                                                <li><a href="stocklist.aspx?makecat=<%# Eval("veh_cat_id") %>"><span>
                                                    <%# Eval("CATEGORY") %>
                                                </span></a></li>
                                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("veh_cat_id") %>' />
                                            </ul>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:ObjectDataSource ID="odsbodyType" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="dsStockTableAdapters.LIST_BY_BODYTYPETableAdapter">
                                </asp:ObjectDataSource>
                                <div class="box-footer">
                                    <div class="box-footer-padding">
                                        <a href="stocklist.aspx">Подробнее об акции страницы</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-left: 1px;">
            <div class="box-2">
                <div class="box-center">
                    <div class="box-content-container">
                        <div class="box-content">
                            <div class="box-header">
                                <h2>
                                   Новое прибытие</h2>
                            </div>
                            <asp:DataList ID="DataList2" runat="server" DataSourceID="odsStock_JA" RepeatColumns="1">
                                <ItemTemplate>
                                    <div class="box-padding">
                                        <div class="box-car_info_imag">
                                            <p >
                                                <a href="stockdetails2.aspx?ID=<%#Eval("id")%>">
                                                    <img class="image-right" alt="box-NewArrival" src="http://www.awan.co.jp/<%#Eval("image1")%>"
                                                        width="108px" height="78px"></a></p>
                                        </div>
                                        <div class="box-car_info_left">
                                            <ul>
                                                <li><span id="infor_color">
                                                    <%# Eval("make") %>
                                                    <%#Eval("model_description")%>
                                                </span></li>
                                                <li><span>Color:</span> <span>
                                                    <%#Eval("color")%></span> </li>
                                                <li><span>Year:</span> <span>
                                                    <%# Eval("MODEL") %></span> </li>
                                            </ul>
                                        </div>
                                        <div class="box-car_info_right">
                                            <ul>
                                                <li><span>Chassis#:</span>
                                                    <%#Eval("chassis_no")%>
                                                </li>
                                                <li><span style="width: 50px">Price :</span> <span style="color: #FF0000; text-align: left;">
                                                    <%#Eval("fob_price")%></span> </li>
                                                <li><span>Engine CC:</span> <span>
                                                    <%#Eval("CC")%></span> </li>
                                                <li><span id="infor_color3">Now On Sale</span> </li>
                                            </ul>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:ObjectDataSource ID="odsStock_JA" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsStockTableAdapters.Stock_JATableAdapter">
                            </asp:ObjectDataSource>
                            <div class="box-footer">
                                <div class="box-footer-padding">
                                    <a href="stocklist.aspx?displaytype=1&lv=1">Нажмите больше</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-left: 1px;">
            <div class="box-2">
                <div class="box-center">
                    <div class="box-content-container">
                        <div class="box-content">
                            <div class="box-header">
                                <h2>
                                   специальное предложение</h2>
                            </div>
                            <asp:DataList ID="DataList3" runat="server" DataSourceID="odsStock_SO" RepeatColumns="1">
                                <ItemTemplate>
                                    <div class="box-padding">
                                        <div class="box-car_info_imag">
                                            <p >
                                                <a href="stockdetails2.aspx?ID=<%#Eval("id")%>">
                                                    <img class="image-right" alt="box-NewArrival" src="http://www.awan.co.jp/<%#Eval("image1")%>"
                                                        width="108px" height="78px"></a></p>
                                        </div>
                                        <div class="box-car_info_left">
                                            <ul>
                                                <li><span id="infor_color">
                                                    <%# Eval("make") %>
                                                    <%#Eval("model_description")%>
                                                </span></li>
                                                <li><span>цвет:</span> <span>
                                                    <%#Eval("color")%></span> </li>
                                                <li><span>год:</span> <span>
                                                    <%# Eval("MODEL") %></span> </li>
                                            </ul>
                                        </div>
                                        <div class="box-car_info_right">
                                            <ul>
                                                <li><span>шасси#:</span>
                                                    <%#Eval("chassis_no")%>
                                                </li>
                                                <li><span style="width: 50px">Price :</span> <span style="color: #FF0000; text-align: left;">
                                                    <%#Eval("fob_price")%></span> </li>
                                                <li><span>двигатель:</span> <span>
                                                    <%#Eval("CC")%></span> </li>
                                                <li><span id="infor_color3">Уже в продаже</span> </li>
                                            </ul>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:ObjectDataSource ID="odsStock_SO" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsStockTableAdapters.STOCK_SOTableAdapter">
                            </asp:ObjectDataSource>
                            <div class="box-footer">
                                <div class="box-footer-padding">
                                    <a href="stocklist.aspx?displaytype=2&lv=1">Нажмите больше </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="img_car_box1">
            <a href="stocklist.aspx?lv=1&displaytype=5" class="Newcar"></a><a href="autoparts.aspx"
                class="accessorice"></a><a href="stocklist.aspx?lv=1&makecat=19" class=" tractors_mech">
                </a><a href="stocklist.aspx?lv=1&displaytype=5" class="accidents"></a>
        </div>
    </div>
       

</asp:Content>
