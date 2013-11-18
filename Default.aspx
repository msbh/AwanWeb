<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" Title="Awan International K.K | Home Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
                                        <%=appdata.GetLanguageString("QuickSearch")%>
                                    </h2>
                                </div>
                                <div id="QuickSearch">
                                    <asp:ObjectDataSource ID="odsMakeName" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="getMakeModelNames" TypeName="masterdataTableAdapters.tblmake_detailsTableAdapter">
                                    </asp:ObjectDataSource>
                                    <asp:ObjectDataSource ID="odsMake" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="masterdataTableAdapters.make_nocountTableAdapter">
                                    </asp:ObjectDataSource>
                                    <ul>
                                        <li style="width: 70px; color: #989393; height: 16px; margin-top: 6px;"><span>
                                            <%=appdata.GetLanguageString("Make")%></span></li>
                                        <li>
                                            <asp:DropDownList ID="ddlMake" runat="server" DataSourceID="odsMake" DataTextField="make"
                                                DataValueField="makeID">
                                                <asp:ListItem Value="0">Any</asp:ListItem>
                                            </asp:DropDownList>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li style="width: 70px; color: #989393; height: 16px; margin-top: 6px;"><span>
                                            <%=appdata.GetLanguageString("Model")%></span></li>
                                        <li>
                                            <asp:DropDownList ID="ddlMakeModel" runat="server" DataSourceID="odsMakeName" DataTextField="model_description"
                                                DataValueField="ID">
                                                <asp:ListItem Value="0">Any</asp:ListItem>
                                            </asp:DropDownList>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li style="width: 70px; color: #989393; height: 16px; margin-top: 6px;"><span>
                                            <%=appdata.GetLanguageString("Year")%></span></li>
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
                                        <li style="width: 70px; color: #989393; height: 16px; margin-top: 6px;"><span>
                                            <%=appdata.GetLanguageString("Steering")%></span></li>
                                        <li>
                                            <asp:DropDownList ID="ddldrive" runat="server">
                                                <asp:ListItem Selected="True" Value="">Any</asp:ListItem>
                                                <asp:ListItem Value="R">Right Hand</asp:ListItem>
                                                <asp:ListItem Value="L">Left Hand</asp:ListItem>
                                                <asp:ListItem Value="C">Classic Cars</asp:ListItem>
                                            </asp:DropDownList>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="js_a"><a onclick="quicksearch();">
                                            <%=appdata.GetLanguageString("Search")%></a></li>
                                    </ul>
                                </div>
                                <div class="box-footer">
                                    <div class="box-footer-padding">
                                        <a href="stocklist.aspx?lv=1">
                                            <%=appdata.GetLanguageString("AdvanceSearch")%></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="center">
                <div class="img_car_box2">
                    <a href="http://awan.ajes.com/" target="_blank">
                        <p id="becomeagent_Sprit_Images">
                        </p>
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
                                        Search by Vehicle Make
                                    </h2>
                                </div>
                                <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1">
                                    <ItemTemplate>
                                        <ul class="pointer2">
                                            <li><a href="stocklist.aspx?lv=1&make=1"><span class=" sprite2 Toyota2-icon"></span>
                                                <span><b>TOYOTA</b>
                                                    <br />
                                                    <span><span style="color: Black;">(&nbsp;<%#Eval("Toyota")%>&nbsp; ) <span></a>
                                            </li>
                                            <li><a href="stocklist.aspx?lv=1&make=8"><span class=" sprite2 nissan2-icon"></span>
                                                <span><b>NISSAN </b>
                                                    <br />
                                                    <span><span style="color: Black;">(&nbsp;<%#Eval("Nissan")%>&nbsp;)<span> </a>
                                            </li>
                                            <li><a href="stocklist.aspx?lv=1&make=7"><span class=" sprite2 honda2-icon"></span><span>
                                                <b>HONDA</b>
                                                <br />
                                                <span><span style="color: Black;">(&nbsp;<%#Eval("Honda")%>&nbsp;)<span> </a>
                                            </li>
                                            <li><a href="stocklist.aspx?lv=1&make=2"><span class=" sprite2 suzuki2-icon"></span>
                                                <span><b>SUZUKI</b><br />
                                                    <span><span style="color: Black;">(&nbsp;<%#Eval("Suzuki")%>&nbsp;)<span> </a>
                                            </li>
                                        </ul>
                                        <ul class="pointer2">
                                            <li><a href="stocklist.aspx?lv=1&make=10"><span class=" sprite2 Daihatsu2-icon"></span>
                                                <span><b>DAIHATSU</b><br />
                                                    <span><span style="color: Black;">(&nbsp;<%#Eval("Daihatsu")%>&nbsp;)<span>
                                            </a></li>
                                            <li><a href="stocklist.aspx?lv=1&make=9"><span class=" sprite2 Mitsubishi2-icon"></span>
                                                <span><b>MITSUBISHI</b><br />
                                                    <span><span style="color: Black;">(&nbsp;<%#Eval("Mitsubishi")%>&nbsp;)<span>
                                            </a></li>
                                            <li><a href="stocklist.aspx?lv=1&make=20"><span class=" sprite2 Mazda2-icon"></span>
                                                <span><b>MAZDA </b>
                                                    <br />
                                                    <span><span style="color: Black;">(&nbsp;<%#Eval("Mazda")%>&nbsp;)<span> </a>
                                            </li>
                                            <li><a href="stocklist.aspx?lv=1&make=3"><span class=" sprite2 SISUZU2-icon"></span>
                                                <span><b>ISUZU</b><br />
                                                    <span><span style="color: Black;">(&nbsp;<%#Eval("Isuzu")%>&nbsp;)<span> </a>
                                            </li>
                                        </ul>
                                        <ul class="pointer2">
                                            <li><a href="stocklist.aspx?lv=1&make=13"><span class=" sprite2 BMW2-icon"></span><span>
                                                <b>BMW</b>
                                                <br />
                                                <span><span style="color: Black;">(&nbsp;<%#Eval("Bmw")%>&nbsp;) <span></a></li>
                                            <li><a href="stocklist.aspx?lv=1&make=14"><span class=" sprite2 MercedesBenz2-icon">
                                            </span><span><b>MERCEDES</b>
                                                <br />
                                                <span><span style="color: Black;">(&nbsp;<%#Eval("Mercedes")%>&nbsp;) <span></a>
                                            </li>
                                            <li><a href="stocklist.aspx?lv=1&make=31"><span class=" sprite2 Chevrolet2-icon"></span>
                                                <span><b>CHEVROLET</b>
                                                    <br />
                                                    <span><span style="color: Black;">(&nbsp;<%#Eval("CHEVROLET")%>&nbsp;) <span>
                                            </a></li>
                                            <li><a href="stocklist.aspx?lv=1&make=15"><span class=" sprite2 OTHER2-icon"></span>
                                                <span></span><span style="color: Black;">(&nbsp;<%#Eval("Others")%>&nbsp;) <span>
                                            </a></li>
                                        </ul>
                                        <%-- <li><a class="sprite2 OTHER2-icon" href="stocklist.aspx?lv=1&make=15">
                                                    <br />
                                                    <br />
                                                    <br />
                                                    (<span><%#Eval("")%></span>) </a></li>                                     
           
                                        --%>
                                        </ul>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="dsStockTableAdapters.Select_MakeCountsTableAdapter">
                                </asp:ObjectDataSource>
                                <div class="box-footer">
                                    <div class="box-footer-padding">
                                        <a href="stocklist.aspx">More on stock page</a>
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
                                    <%=appdata.GetLanguageString("NewArrival")%>
                                </h2>
                            </div>
                            <asp:DataList ID="DataList2" runat="server" DataSourceID="odsStock_JA" RepeatColumns="1">
                                <ItemTemplate>
                                    <div class="box-padding">
                                        <div class="box-car_info_imag">
                                            <p>
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
                                                <li><span>
                                                    <%=appdata.GetLanguageString("colorlable")%></span> <span>
                                                        <%#Eval("color")%></span> </li>
                                                <li><span>
                                                    <%=appdata.GetLanguageString("Year")%></span> <span>
                                                        <%# Eval("MODEL") %></span> </li>
                                            </ul>
                                        </div>
                                        <div class="box-car_info_right">
                                            <ul>
                                                <li><span>
                                                    <%=appdata.GetLanguageString("Chassislable")%></span>
                                                    <%#Eval("chassis_no")%>
                                                </li>
                                                <li><span style="width: 50px">
                                                    <%=appdata.GetLanguageString("Pricelable")%>
                                                    :</span> <span style="color: #FF0000; text-align: left;">
                                                        <%#Eval("fob_price")%></span> </li>
                                                <li><span>
                                                    <%=appdata.GetLanguageString("EngineCClable")%></span> <span>
                                                        <%#Eval("CC")%></span> </li>
                                                <li><span id="infor_color3">
                                                    <%=appdata.GetLanguageString("nowonsale")%></span> </li>
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
                                    <a href="stocklist.aspx?displaytype=1&lv=1">
                                        <%=appdata.GetLanguageString("Clickmore")%>
                                    </a>
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
                                    <%=appdata.GetLanguageString("SpecialOffer")%>
                                </h2>
                            </div>
                            <asp:DataList ID="DataList3" runat="server" DataSourceID="odsStock_SO" RepeatColumns="1">
                                <ItemTemplate>
                                    <div class="box-padding">
                                        <div class="box-car_info_imag">
                                            <p>
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
                                                <li><span>
                                                    <%=appdata.GetLanguageString("colorlable")%></span> <span>
                                                        <%#Eval("color")%></span> </li>
                                                <li><span>
                                                    <%=appdata.GetLanguageString("Year")%></span> <span>
                                                        <%# Eval("MODEL") %></span> </li>
                                            </ul>
                                        </div>
                                        <div class="box-car_info_right">
                                            <ul>
                                                <li><span>
                                                    <%=appdata.GetLanguageString("Chassislable")%></span>
                                                    <%#Eval("chassis_no")%>
                                                </li>
                                                <li><span style="width: 50px">
                                                    <%=appdata.GetLanguageString("Pricelable")%>
                                                    :</span> <span style="color: #FF0000; text-align: left;">
                                                        <%#Eval("fob_price")%></span> </li>
                                                <li><span>
                                                    <%=appdata.GetLanguageString("EngineCClable")%></span> <span>
                                                        <%#Eval("CC")%></span> </li>
                                                <li><span id="infor_color3">
                                                    <%=appdata.GetLanguageString("nowonsale")%></span> </li>
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
                                    <a href="stocklist.aspx?displaytype=2&lv=1">
                                        <%=appdata.GetLanguageString("Clickmore")%>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="clear: both; height: 20px;">
        </div>
        <div style="margin-left: 1px;">
            <div class="box-2">
                <div class="box-center">
                    <div class="box-content-container">
                        <div class="box-content">
                            <div class="box-header">
                                <h2>
                                    <%=appdata.GetLanguageString("RegionalStock")%>
                                </h2>
                            </div>
                            <table cellpadding="0" cellspacing="0" border="0" width="100%" style="padding-top: 5px;
                                padding-bottom: 5px;">
                                <tr style="padding-top: 5px;">
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=51">
                                            <img src="images/CountryFlags/Australia.gif" alt="loader" class="imgwidth" />
                                        </a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=72">
                                            <img src="images/CountryFlags/Chile.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=4">
                                            <img src="images/CountryFlags/Congo.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=79">
                                            <img src="images/CountryFlags/Ethiopia.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=51"><span class="tdTxt">Australia </span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=72"><span class="tdTxt">Chile</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=4"><span class="tdTxt">Congo</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=79"><span class="tdTxt">Ethiopia</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 3px;" colspan="7">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr style="padding-top: 5px;">
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=64">
                                            <img src="images/CountryFlags/Georgia.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=6">
                                            <img src="images/CountryFlags/Kenya.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=66">
                                            <img src="images/CountryFlags/Kyrgyzstan.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=67">
                                            <img src="images/CountryFlags/Mongolia.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=64"><span class="tdTxt">Georgia</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=6"><span class="tdTxt">Kenya</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=66"><span class="tdTxt">Kyrgyzstan</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=67"><span class="tdTxt">Mongolia</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 3px;" colspan="7">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr style="padding-top: 5px;">
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=23">
                                            <img src="images/CountryFlags/Myanmar.jpg" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=54">
                                            <img src="images/CountryFlags/New Zealand.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=24">
                                            <img src="images/CountryFlags/Pakistan.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=77">
                                            <img src="images/CountryFlags/Peru.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=23"><span class="tdTxt">Myanmar</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=54"><span class="tdTxt">New Zealand</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=24"><span class="tdTxt">Pakistan</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=77"><span class="tdTxt">Peru</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 3px;" colspan="7">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr style="padding-top: 5px;">
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=25">
                                            <img src="images/CountryFlags/Philippines.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=68">
                                            <img src="images/CountryFlags/Russia.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=78">
                                            <img src="images/CountryFlags/Somalia.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=26">
                                            <img src="images/CountryFlags/Sri Lanka.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=25"><span class="tdTxt">Philippines</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=68"><span class="tdTxt">Russia</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=78"><span class="tdTxt">Somalia </span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=26"><span class="tdTxt">Sri Lanka</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 3px;" colspan="7">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr style="padding-top: 5px;">
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=14">
                                            <img src="images/CountryFlags/Tanzania.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=15">
                                            <img src="images/CountryFlags/Uganda.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=28">
                                            <img src="images/CountryFlags/UAE.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=16">
                                            <img src="images/CountryFlags/Zambia.gif" alt="loader" class="imgwidth" /></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=14"><span class="tdTxt">Tanzania</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=15"><span class="tdTxt">Uganda</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=28"><span class="tdTxt">U.A.E</span></a>
                                    </td>
                                    <td class="tdblnk">
                                    </td>
                                    <td class="tdimg" align="center">
                                        <a href="stocklist.aspx?rc=16"><span class="tdTxt">Zambia</span></a>
                                    </td>
                                </tr>
                            </table>
                            <div class="box-footer">
                                <div class="box-footer-padding">
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
                        <div class="box-content" style="height: 349px;">
                            <div class="box-header">
                                <h2>
                                    <%=appdata.GetLanguageString("Testimonials")%>
                                </h2>
                            </div><!--Testimonial -->
                            <div class="home image-sphere-style responsive" style="margin-left: 10px;height: 295px;">
                                <div>
                                    <div class="wrapper group">
                                        <div class="home-sections">
                                            <div class="section-content">
                                                
                                                <h3>
                                                    Our clients say</h3>
                                                <div class="cites group">
                                                    <div class="text">
                                                        <p>
                                                            Quisque vel ipsum nec magna aliquet molestie in quis ipsum. Sed nisl est, hendrerit
                                                            in laoreet facilisis, placerat eget tortor. Nunc ipsum eros, sagittis quis dignissim
                                                            sed, imperdiet vitae sem. Praesent et ultricies tellus. Etiam ornare dolor sagittis
                                                            quis dignissim sed, imperdiet vitae sem. Praesent et ultricies tellus.</p>
                                                    </div>
                                                    <div class="text">
                                                        <p>
                                                            Duis bibendum massa in felis auctor at pellentesque nulla consequat. Duis ornare
                                                            elementum nisl quis semper. <strong>In consequat tortor</strong> odio, quis iaculis
                                                            metus. Phasellus neque ipsum, volutpat molestie pellentesque dapibus, dapibus molestie
                                                            libero</p>
                                                    </div>
                                                    <div class="text">
                                                        <p>
                                                            Nunc egestas magna luctus mauris ultricies vitae fermentum lectus faucibus. Vestibulum
                                                            ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris
                                                            et augue suscipit est ultricies gravida. Phasellus sollicitudin scelerisque pellentesque.
                                                            Mauris et augue suscipit!</p>
                                                    </div>
                                                   
                                                </div>
                                                <div class="border-line">
                                                </div>
                                                <ul class="testimonials group">
                                                    <li class="active">
                                                        <div class="sphere">
                                                            <img width="78" height="78" src="images/testimonials/mergot-78x78.jpg" class="attachment-testimonial-thumb wp-post-image"
                                                                alt="mergot" title="mergot" /></div>
                                                        <div class="shadow-thumb">
                                                        </div>
                                                        <h4>
                                                            Joy Mèrgot</h4>
                                                        <a href="http://google.com" class="website">google.com</a> </li>
                                                    <li>
                                                        <div class="sphere">
                                                            <img width="78" height="78" src="images/testimonials/meis-78x78.jpg" class="attachment-testimonial-thumb wp-post-image"
                                                                alt="meis" title="meis" /></div>
                                                        <div class="shadow-thumb">
                                                        </div>
                                                        <h4>
                                                            Elisa Meis</h4>
                                                        <a href="http://LoveCraft" class="website">Love Craft</a> </li>
                                                    <li>
                                                        <div class="sphere">
                                                            <img width="78" height="78" src="images/testimonials/mori-78x78.jpg" class="attachment-testimonial-thumb wp-post-image"
                                                                alt="mori" title="mori" /></div>
                                                        <div class="shadow-thumb">
                                                        </div>
                                                        <h4>
                                                            Ricardo Mori</h4>
                                                        <a href="http://SolarisInc" class="website">Solaris Inc</a> </li>
                                                    
                                                </ul>
                                            </div>
                                            <div class="shadow">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span id="infor_color">Coming Soon..</span>
                            <div class="box-footer">
                                <div class="box-footer-padding">
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
    <style type="text/css">
        .tdimg
        {
            width: 70px;
        }
        .tdTxt
        {
            padding-top: 2px;
            text-decoration: none !important;
            font-family: Calibri, Arial, sans-serif;
            font-size: 14px;
            font-weight: 400;
            line-height: 18px;
            text-decoration: none;
            color: Black;
        }
        .tdTxt:hover
        {
            padding-top: 2px;
            text-decoration: none !important;
            font-family: Calibri, Arial, sans-serif;
            font-size: 14px;
            font-weight: 400;
            line-height: 18px;
            text-decoration: none;
            color: Gray;
        }
        .tdblnk
        {
            width: 2px;
        }
        .imgwidth
        {
            width: 28px;
            height: 25px;
        }
    </style>
</asp:Content>
