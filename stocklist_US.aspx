<%@ Page Title="Vehicle Stock List"  Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="stocklist_US.aspx.vb" Inherits="stocklist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="JavaScript">

        function OpenWin(type) {

            window.location = 'stocklist.aspx?lv=' + type;

        }

        // Read a page's GET URL variables and return them as an associative array.
        function getUrlVars() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }


        function calcurr2(a, b, c) {

            var e = document.getElementById(a);
            var val = e.options[e.selectedIndex].value;
            var bb = document.getElementById(b);
            var f = document.getElementById(c);
            var val2 = f.innerText;
            var newprice = val * val2;
            bb.innerText = newprice;

        }

    </script>
<script type="text/javascript">

    function InitXmlHttp() {
        // Attempt to initialize xmlhttp object
        try {
            xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");

            

            
            
        }
        catch (e) {
            // Try to use different activex object
            try {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (E) {
                xmlhttp = false;
            }
        }

        // If not initialized, create XMLHttpRequest object
        if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
            xmlhttp = new XMLHttpRequest();
        }
        // Define function call for when Request obj state has changed
        xmlhttp.onreadystatechange = XMLHttpRequestCompleted;
    }


    function calcurr(a, b, c) {

        InitXmlHttp();
        
        if (typeof (xmlhttp.onprogress) == 'object') {
            xmlhttp.onload = xmlhttp.onerror = xmlhttp.onabort = function() {
            XMLHttpRequestCompleted(xmlhttp);
            };
        } else {
            xmlhttp.onreadystatechange = function() {
                if (xmlhttp.readyState == 4) {
                    XMLHttpRequestCompleted(xmlhttp);
                }
            };
        }
        
      //  xmlhttp.onreadystatechange = XMLHttpRequestCompleted;
      //  xmlhttp.open("GET", "" + "Controls/basichandler.ashx?func=curr&cid=" + document.getElementById(a).value + "&b=" + b + "&c=" + c, false);

    xmlhttp.open("GET", "" + "http://www.awan.co.jp/Controls/basichandler.ashx?func=curr&cid=" + document.getElementById(a).value + "&b=" + b + "&c=" + c, false);
      
        xmlhttp.send(null);


    }


    function XMLHttpRequestCompleted() {
        if (xmlhttp.readyState == 4) {
            try {

                var list = xmlhttp.responseText.split('@');

                var val = list[0]
                var bb = document.getElementById(list[1]);
                var f = document.getElementById(list[2]);
              


                var val2 = f.innerText;
                var newprice = val * val2;
                bb.innerText =Number(newprice).toFixed(2);
                
                
            }
            catch (e) {
            }
        }
    }

</script>
    
    

    <div id="myform">
        <ul class="myform_heading">
            <span style="color: #F0F0F0">Stock </span>Search
        </ul>
        <ul class="myform_line">
        </ul>
        <div id="tabs">
            <ul>
                <li class="nolistyle"><a href="#tabs-1">Search by Make</a></li>
                <li class="nolistyle"><a href="#tabs-2">Search by Body Type </a></li>
                <li class="nolistyle"><a href="#tabs-3">Advance Search</a></li>
            </ul>
            <div id="tabs-1" class="js_a">
                <table width="100%" id="Table1" style="height: 200px; vertical-align: top; text-align: center;">
                    <tbody>
                        <div>
                            <tr>
                                <td width="5">
                                </td>
                                <td width="237">
                                    <a href="stocklist.aspx?lv=1&make=1" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-toyota"
                                            alt="Toyota">
                                    </a>
                                </td>
                                <td width="283">
                                    <a href="stocklist.aspx?lv=1&make=7" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-honda"
                                            alt="Honda">
                                    </a>
                                </td>
                                <td width="283">
                                    <a href="stocklist.aspx?lv=1&make=8" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-nissan"
                                            alt="Nissan">
                                    </a>
                                </td>
                                <td width="243">
                                    <a href="stocklist.aspx?lv=1&make=9" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-mitsubishi"
                                            alt="Mitsubishi">
                                    </a>
                                </td>
                                <td width="243">
                                    <a href="stocklist.aspx?lv=1&make=20" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-mazda"
                                            alt="Mazda">
                                    </a>
                                </td>
                                <td width="243">
                                    <a href="stocklist.aspx?lv=1&make=12" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-subaru"
                                            alt="Subaru">
                                    </a>
                                </td>
                                <td width="10">
                                </td>
                            </tr>
                            <tr>
                                <td width="5">
                                </td>
                                <td width="237">
                                    <a href="stocklist.aspx?lv=1&make=2" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-suzuki"
                                            alt="Suzuki"><br>
                                    </a>
                                </td>
                                <td width="243">
                                    <a href="stocklist.aspx?lv=1&make=19" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-LANDROVER"
                                            alt="Rover">
                                    </a>
                                </td>
                                <td width="283">
                                    <a href="stocklist.aspx?lv=1&make=31" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-CHEVROLET"
                                            alt="Chevrolet">
                                    </a>
                                </td>
                                <td width="243">
                                    <a href="stocklist.aspx?lv=1&make=51" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-JAGUAR"
                                            alt="Jaguar">
                                    </a>
                                </td>
                                <td width="237">
                                    <a href="stocklist.aspx?lv=1&make=13" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-bmw"
                                            alt="bmw"><br>
                                    </a>
                                </td>
                                <td width="243">
                                    <a href="stocklist.aspx?lv=1&make=21" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-opel"
                                            alt="opel">
                                    </a>
                                </td>
                                <td width="10">
                                </td>
                            </tr>
                            <tr>
                                <td width="5">
                                </td>
                                <td width="237">
                                    <a href="stocklist.aspx?lv=1&make=10" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-daihatsu"
                                            alt="daihatsu"><br>
                                    </a>
                                </td>
                                <td width="243">
                                    <a href="stocklist.aspx?lv=1&make=22" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-Porche"
                                            alt="Porche">
                                    </a>
                                </td>
                                <td width="243">
                                    <a href="stocklist.aspx?lv=1&make=3" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-isuzu"
                                            alt="isuzu">
                                    </a>
                                </td>
                                <td width="283">
                                    <a href="stocklist.aspx?lv=1&make=14" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-mercedes-benz"
                                            alt="mercedes-benz">
                                    </a>
                                </td>
                                <td width="283">
                                    <a href="stocklist.aspx?lv=1&make=17" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-chrysler"
                                            alt="chrysler">
                                    </a>
                                </td>
                                <td width="283">
                                    <a href="stocklist.aspx?lv=1&make=16" class="search_by_type">
                                        <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icn-Audi"
                                            alt="Audi">
                                    </a>
                                </td>
                                <td width="10">
                                </td>
                            </tr>
                        </div>
                    </tbody>
                </table>
            </div>
            <div id="tabs-2" class="js_a">
                <table width="100%" id="bytype_table1" style="height: 200px; vertical-align: top;
                    text-align: center;">
                    <tbody>
                        <tr>
                            <td width="5">
                            </td>
                         
                            <td width="283">
                                <a href="stocklist.aspx?lv=1&makecat=1" class="search_by_type">
                                    <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-cars"
                                        alt="Used Cars"><br style="line-height: 20px">
                                    Cars</a>
                            </td>
                            <td width="240">
                                <a href="stocklist.aspx?lv=1&makecat=2" class="search_by_type">
                                    <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-pickup"><br>
                                    Pickup Trucks</a>
                            </td>
                            <td width="240">
                                <a href="stocklist.aspx?lv=1&makecat=5" class="search_by_type">
                                    <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-suv"
                                        alt="used suv"><br>
                                    SUV's</a>
                            </td>
                            <td width="237">
                                <a href="stocklist.aspx?lv=1&makecat=3" class="search_by_type">
                                    <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-vans"><br>
                                    Vans</a>
                            </td>
                            
                               <td width="243">
                                <a href="stocklist.aspx?lv=1" class="search_by_type">
                                    <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-other"
                                        alt="Others"><br>
                                    Others</a>
                            </td>
                            
                            <td width="10">
                            </td>
                        </tr>
                        <!--<tr><td height="20"></td></tr>-->
                        <tr>
                            <td width="5">
                            </td>
                            <td>
                                <a href="stocklist.aspx?lv=1&makecat=6" class="search_by_type">
                                    <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-buses"
                                        alt="buses"><br>
                                    Buses</a>
                            </td>
                            <td>
                                <a href="stocklist.aspx?lv=1&makecat=2" class="search_by_type">
                                    <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-trucks"
                                        alt="trucks"><br>
                                    Trucks</a>
                            </td>
                            <td>
                                <a href="stocklist.aspx?lv=1&makecat=19" class="search_by_type">
                                    <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-machinery"><br>
                                    Machinery</a>
                            </td>
                            <td>
                                <a href="stocklist.aspx?lv=1" class="search_by_type">
                                    <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-other"><br>
                                    Other</a>
                            </td>
                            <td>
                                <a href="stocklist.aspx?lv=1" class="search_by_type">
                                    <img width="1" height="1" border="0" src="images/btn/spacer.gif" class="icon-overseas"><br>
                                    Overseas </a>
                            </td>
                            <td width="10">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="tabs-3">
                <div style="height: 270px;" id="inner_value">
                    <div id="advsearch">
                        <ul>
                            <asp:RadioButtonList ID="rdDrive" runat="server" RepeatDirection="Horizontal" Font-Bold="True">
                                <asp:ListItem Value="R">Right Hand</asp:ListItem>
                                <asp:ListItem Value="L">Left Hand</asp:ListItem>
                                <asp:ListItem Value="C">Classic Cars</asp:ListItem>
                                <asp:ListItem Value="">All</asp:ListItem>
                            </asp:RadioButtonList>
                        </ul>
                        <ul>
                            <li><span>Make</span>
                                <asp:DropDownList ID="ddlMake" runat="server" DataSourceID="odsMake" DataTextField="make"
                                    DataValueField="makeID">
                                    <asp:ListItem Value="0">Any</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li><span>Veh. Name</span>
                                <asp:DropDownList ID="ddlMakeModel" runat="server" DataSourceID="odsMakeName" DataTextField="model_description"
                                    DataValueField="ID">
                                    <asp:ListItem Value="0">Any</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li><span>Year</span> <span style="width: 40px;">From </span>
                                <asp:DropDownList ID="ddlYear" Width="58px" runat="server">
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
                                <span style="width: 30px;">To </span>
                                <asp:DropDownList ID="ddlYear2" Width="58px" runat="server">
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
                            <li><span>Door</span>
                                <asp:DropDownList ID="ddldoor" runat="server">
                                    <asp:ListItem Value="">Any</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                        </ul>
                        <ul>
                            <li><span>Veh. Category</span>
                                <asp:DropDownList ID="ddlCat" runat="server" DataSourceID="vmakecategory" DataTextField="category"
                                    DataValueField="id">
                                </asp:DropDownList>
                            </li>
                            <li><span>Color</span>
                                <asp:DropDownList ID="ddlcolor" runat="server" DataSourceID="odscolor" DataTextField="color"
                                    DataValueField="id">
                                    <asp:ListItem Value="0">Any</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li><span>Stock Type</span>
                                <asp:DropDownList ID="ddlstock_type" runat="server" DataSourceID="odsstock_type"
                                    DataTextField="display_type" DataValueField="ID">
                                </asp:DropDownList>
                            </li>
                            <li><span>Trans</span>
                                <asp:DropDownList ID="ddltransmission" runat="server">
                                    <asp:ListItem>Any</asp:ListItem>
                                    <asp:ListItem>AT</asp:ListItem>
                                    <asp:ListItem>M/T</asp:ListItem>
                                    <asp:ListItem>C4</asp:ListItem>
                                    <asp:ListItem>C5</asp:ListItem>
                                    <asp:ListItem>C6</asp:ListItem>
                                    <asp:ListItem>C7</asp:ListItem>
                                    <asp:ListItem>D1</asp:ListItem>
                                    <asp:ListItem>D2</asp:ListItem>
                                    <asp:ListItem>D3</asp:ListItem>
                                    <asp:ListItem>D4</asp:ListItem>
                                    <asp:ListItem>F4</asp:ListItem>
                                    <asp:ListItem>F5</asp:ListItem>
                                    <asp:ListItem>F6</asp:ListItem>
                                    <asp:ListItem>F7</asp:ListItem>
                                    <asp:ListItem>FAT</asp:ListItem>
                                    <asp:ListItem>CAT</asp:ListItem>
                                    <asp:ListItem>DAT</asp:ListItem>
                                    <asp:ListItem>IAT</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                        </ul>
                        <ul>
                            <li><span>Chassis No </span>
                                <asp:TextBox ID="txtchassis_no" CssClass="inputbox" runat="server"></asp:TextBox></li>
                            <li><span>Price Range</span> <span style="width: 40px;">B/W </span>
                                <asp:DropDownList ID="ddlcost1" Width="58px" runat="server">
                                    <asp:ListItem Value="">Any</asp:ListItem>
                                    <asp:ListItem Value="1000">&gt; $ 1000</asp:ListItem>
                                    <asp:ListItem Value="2000">&gt; $ 2000</asp:ListItem>
                                    <asp:ListItem Value="3000">&gt; $ 3000</asp:ListItem>
                                    <asp:ListItem Value="4000">&gt; $ 4000</asp:ListItem>
                                    <asp:ListItem Value="5000">&gt; $ 5000</asp:ListItem>
                                    <asp:ListItem Value="6000">&gt; $ 6000</asp:ListItem>
                                    <asp:ListItem Value="7000">&gt; $ 7000</asp:ListItem>
                                </asp:DropDownList>
                                <span style="width: 30px;">and </span>
                                <asp:DropDownList ID="ddlcost2" Width="58px" runat="server">
                                    <asp:ListItem Value="">Any</asp:ListItem>
                                    <asp:ListItem Value="1000">&lt; $ 1000</asp:ListItem>
                                    <asp:ListItem Value="2000">&lt; $ 2000</asp:ListItem>
                                    <asp:ListItem Value="3000">&lt; $ 3000</asp:ListItem>
                                    <asp:ListItem Value="4000">&lt; $ 4000</asp:ListItem>
                                    <asp:ListItem Value="5000">&lt; $ 5000</asp:ListItem>
                                    <asp:ListItem Value="6000">&lt; $ 6000</asp:ListItem>
                                    <asp:ListItem Value="7000">&lt; $ 7000</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                        </ul>
                        <ul>
                            <li><span>Country</span>
                                <asp:DropDownList ID="ddlcountry" runat="server">
                                    <asp:ListItem Value="0">Any</asp:ListItem>
                                    <asp:ListItem Value="4">China</asp:ListItem>
                                    <asp:ListItem Value="16">India</asp:ListItem>
                                    <asp:ListItem Value="2">Japan</asp:ListItem>
                                    <asp:ListItem Value="6">Kenya</asp:ListItem>
                                    <asp:ListItem Value="5">Pakistan</asp:ListItem>
                                    <asp:ListItem Value="17">Portugal</asp:ListItem>
                                    <asp:ListItem Value="15">Russia</asp:ListItem>
                                    <asp:ListItem Value="9">South Africa</asp:ListItem>
                                    <asp:ListItem Value="10">Singapore</asp:ListItem>
                                    <asp:ListItem Value="11">South Korea</asp:ListItem>
                                    <asp:ListItem Value="13">Tanzania</asp:ListItem>
                                    <asp:ListItem Value="3">U.A.E</asp:ListItem>
                                    <asp:ListItem Value="8">U.K</asp:ListItem>
                                    <asp:ListItem Value="12">Uganda</asp:ListItem>
                                    <asp:ListItem Value="7">U.S</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li><span>Fuel</span>
                                <asp:DropDownList ID="rdfuelType" runat="server">
                                    <asp:ListItem Value="">Any</asp:ListItem>
                                    <asp:ListItem Value="Patrol">Patrol</asp:ListItem>
                                    <asp:ListItem Value="Gasoline">Gasoline</asp:ListItem>
                                    <asp:ListItem Value="Diesel">Diesel</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <asp:Button ID="cmdsearch1" runat="server" Text="Search" />
                            </li>
                            <li>
                                <asp:Button ID="cmdsearch2" runat="server" Text="Search" />
                            </li>
                        </ul>
                    </div>
                    <div class="clr">
                    </div>
                </div>
            </div>
        </div>
        <div id="tabsstock">
            <ul>
                <li class="nolistyle"><a href="#tabs-4">Regular View</a></li>
                <li class="nolistyle"><a href="#tabs-5">Image View </a></li>
                <li class="nolistyle"><a href="#tabs-6">Tabular View</a></li>
            </ul>
            <div class="stklistborder">
                <div id="tabs-4">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="odsStklist">
                    
                        <ItemTemplate>
                             <table width="100%" cellspacing="1" cellpadding="0" border="0">
                                <tbody>
                                    <tr>
                                        <td width="100%">
                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                <tbody>
                                                    <tr>
                                                        <td width="160" align="center" style="padding-left: 10px">
                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="padding-top: 30px;">
                                                                            <table width="100%" cellspacing="1" cellpadding="0" border="0" class="normaltext_gr">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td align="center" class="js_a">
                                                                                            <a href="stockdetails2.aspx?ID=<%#Eval("id")%>">
                                                                                                <div class="soldTOI">
                                                                                                    <img width="140" height="105" border="0" align="absmiddle" class="image_border" alt="Click to view Details"
                                                                                                        src="http://www.awan.co.jp/<%#Eval("image1")%>">
                                                                                                 
                                                                                                        <div class="soldtext">
                                                                                                       
                                                                                                            <span> <%#Eval("availability1")%> </span>
                                                                                                        </div>
                                                                                                   
                                                                                                </div>
                                                                                               
                                                                                            </a>
                                                                                                    
                                                                                       
                                                                                                    
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            <div align="center" style="font-size: 10px; line-height: 15px;">
                                                                                [<%#Eval("make_category")%>]</div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td width="10">
                                                        </td>
                                                        <td valign="top" style="padding-right: 10px">
                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                <tbody>
                                                                    <tr>
                                                                        <td align="right">
                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td height="10">
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left">
                                                                                            <b>
                                                                                                <%#Eval("make")%>
                                                                                                &nbsp;
                                                                                                <%#Eval("model_description")%>
                                                                                                - -
                                                                                                <%#Eval("model")%></b>
                                                                                        </td>
                                                                                        <td align="right">
                                                                                            &nbsp; <b>FOB Price :</b> <b><a class="ndc" href="#"><strong>
                                                                                                <label id="lblfobprice" runat="server">
                                                                                                    <%#Eval("fob_price")%></label>
                                                                                                <label id="hfobprice" runat="server" style="display: none;">
                                                                                                    <%#Eval("fob_price")%></label>
                                                                                                     
                                                                                            </strong></a></b>&nbsp; &nbsp;
                                                                                            <asp:DropDownList ID="ddlcurr" Width="60px" runat="server" DataSourceID="odscurrency"
                                                                                                SelectedValue='<%# Eval("Selling_Curr_ID") %>' DataTextField="currency_short_name"
                                                                                                DataValueField="currency_ID">
                                                                                            </asp:DropDownList>
                                                                                            <asp:ObjectDataSource ID="odscurrency" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                                                SelectMethod="GetData" TypeName="masterdataTableAdapters.Select_AllCurrencyTableAdapter">
                                                                                            </asp:ObjectDataSource>
                                                                                            
                                                                                            
                                                                                            
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
                                                                        <td class="stklist_innercontent">
                                                                            <table width="100%" cellspacing="1" cellpadding="3" border="0" class="normaltext_gr">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td width="40%" height="17">
                                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="110">
                                                                                                            &nbsp;Stock Number
                                                                                                        </td>
                                                                                                        <td width="10">
                                                                                                            :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <%# Eval("FILE_REF") %>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td width="40%">
                                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="110">
                                                                                                            &nbsp;Chassis No.
                                                                                                        </td>
                                                                                                        <td width="10">
                                                                                                            :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <%#Eval("CHASSIS_NO")%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="17">
                                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="110">
                                                                                                            &nbsp;Stock Location
                                                                                                        </td>
                                                                                                        <td width="10">
                                                                                                            :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <%#Eval("GLOBALLOCATION")%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td>
                                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="110">
                                                                                                            &nbsp;Engine CC
                                                                                                        </td>
                                                                                                        <td width="10">
                                                                                                            :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <%#Eval("CC")%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="17">
                                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="110">
                                                                                                            &nbsp;Year/Month
                                                                                                        </td>
                                                                                                        <td width="10">
                                                                                                            :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <%#Eval("MODEL")%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td>
                                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="110">
                                                                                                            &nbsp;Transmission
                                                                                                        </td>
                                                                                                        <td width="10">
                                                                                                            :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <%#Eval("Transmission")%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="17">
                                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="110">
                                                                                                            &nbsp;Body Color
                                                                                                        </td>
                                                                                                        <td width="10">
                                                                                                            :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <%#Eval("COLOR")%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td>
                                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="110">
                                                                                                            &nbsp;Fuel Type
                                                                                                        </td>
                                                                                                        <td width="10">
                                                                                                            :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <%#Eval("fuel_type")%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td height="17">
                                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="110">
                                                                                                            &nbsp;Mileage (KM)
                                                                                                        </td>
                                                                                                        <td width="10">
                                                                                                            :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <%#Eval("mileage")%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td>
                                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="normaltext_gr">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td width="110">
                                                                                                            &nbsp;Status
                                                                                                        </td>
                                                                                                        <td width="10">
                                                                                                            :
                                                                                                        </td>
                                                                                                        <td>
                                                                                                        <b><%#Eval("AVAILABILITY")%></b>    
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
                                        </td>
                                    </tr>
                                    <tr class="js_a">
                                        <td height="30" align="center" style="padding-top: 4px;">
                                            <a href="stockdetails2.aspx?ID=<%#Eval("id")%>">View Details </a>&nbsp; <a href="order1.aspx?id=<%#Eval("id")%>&i=1">
                                                Order </a>&nbsp; <a href="nego2.aspx?id=<%#Eval("id")%>&i=1">Negotiate </a>&nbsp;
                                            <a href="enquiry.aspx?ID=<%#Eval("id")%>">Enquiry </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ItemTemplate>
                      
                        <EmptyDataTemplate>
                            <table style="">
                                <tr>
                                    <td>
                                        No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                   
                        <LayoutTemplate>
                           
                            <center> 
                                <asp:DataPager ID="DataPager2" runat="server">
                                    
                                      <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" />
                                                <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="select-pager-button" />
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="true" />
                                            </Fields>
                                  
                                </asp:DataPager>
                            </center>
                           
                           
                            <table runat="server" border="0" style="">
                                <tr ID="itemPlaceholderContainer" runat="server">
                                    <td ID="itemPlaceholder" runat="server">
                                    </td>
                                </tr>
                            </table>
                             <center> 
                             <br />
                                <asp:DataPager ID="DataPager1" runat="server">
                                    
                                      <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" />
                                                <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="select-pager-button" />
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="true" />
                                            </Fields>
                                  
                                </asp:DataPager>
                            </center>
                        </LayoutTemplate>
                       
                    </asp:ListView>   
                    
                    
                    
                </div>
                <div id="tabs-5">
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="odsStklist" GroupItemCount="5">
                        <EmptyItemTemplate>
                            <td id="Td1" runat="server" />
                        </EmptyItemTemplate>
                        <ItemTemplate>
                            <td id="Td2" runat="server" class="pm_textbox4" align="center">
                                <table>
                                    <tr>
                                        <td>
                                            <table width="100%" cellspacing="1" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td height="3">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#FFFFFF" align="center">
                                                           
                                                            <a href="#">
                                                                <div class="soldTOI">
                                                                    <img width="155px" height="140px" border="0" alt="Click to view Details" src="http://www.awan.co.jp/<%#Eval("image1")%>">
                                                                    <div class="soldtext">
                                                                        <span>
                                                                            <%#Eval("availability1")%>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                                
                                                           

                                                                
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="stockdetails2.aspx?ID=<%#Eval("id")%>"><strong>
                                                <%#Eval("make")%>&nbsp;<%#Eval("model_description")%>
                                            </strong></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="normaltext_gr">
                                            <strong>
                                                <%#Eval("fob_price")%></strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="normaltext_gr">
                                            <font>Year: <strong>
                                                <%#Eval("model")%></strong></font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="normaltext_gr">
                                            <strong>Now On Sale </strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="17" align="center" class="smalltext_gr js_a">
                                            <a href="stockdetails2.aspx?ID=<%#Eval("id")%>">View Details</a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table id="Table2" runat="server" style="">
                                <tr>
                                    <td>
                                        No data was returned.
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <table id="Table3" runat="server">
                               <tr id="Tr6" runat="server">
                                    <td id="Td7" runat="server" style="">
                                        <asp:DataPager ID="DataPager3" runat="server" PageSize="12">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" />
                                                <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="select-pager-button" />
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="true" />
                                            </Fields>
                                        </asp:DataPager>
                                        <br />
                                        
                                    </td>
                                </tr>
                                <tr id="Tr1" runat="server">
                                    <td id="Td3" runat="server">
                                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="Tr2" runat="server">
                                    <td id="Td4" runat="server" style="">
                                  
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                             <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" />
                                                <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="select-pager-button" />
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="true" />
                                            </Fields>
                                        </asp:DataPager>
                                        
                                          <br />
                                    </td>
                                </tr>
                            </table>
                           
                           
                            
                        </LayoutTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </GroupTemplate>
                    </asp:ListView>
                </div>
                <div id="tabs-6">
                    <asp:ListView ID="ListView3" runat="server" DataSourceID="odsStklist">
                        <ItemTemplate>
                            <tr style="color: #CCCCCC;">
                                <td>
                                    <asp:Label ID="MAKELabel" runat="server" Text='<%# Eval("MAKE") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="MODEL_DESCRIPTIONLabel" runat="server" Text='<%# Eval("MODEL_DESCRIPTION") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="MODELLabel" runat="server" Text='<%# Eval("MODEL") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="COLORLabel" runat="server" Text='<%# Eval("COLOR") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TRANSMISSIONLabel" runat="server" Text='<%# Eval("TRANSMISSION") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="DOORLabel" runat="server" Text='<%# Eval("DOOR") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="MAKE_CATEGORYLabel" runat="server" Text='<%# Eval("MAKE_CATEGORY") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="OPTIONSLabel" runat="server" Text='<%# Eval("OPTIONS") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="LabelDRIVE1" runat="server" Text='<%# Eval("DRIVE") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="availabilityLabel" runat="server" Text='<%# Eval("availability") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="WEB_PRICELabel" runat="server" Text='<%# Eval("WEB_PRICE") %>' />
                                </td>
                                <td class="js_a" align="center">
                                    <a href="stockdetails2.aspx?ID=<%#Eval("id")%>">View </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table id="Table4" runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
                                border-color: #999999; border-style: none; border-width: 1px;">
                                <tr>
                                    <td>
                                        No data was returned.
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <table id="Table5" runat="server">
                                <tr id="Tr7" runat="server">
                                    <td id="Td8" runat="server" style="text-align: center; font-family: Verdana, Arial, Helvetica, sans-serif;
                                        color: #CCCCCC;">
                                        <br />
                                    
                                        
                                        <asp:DataPager ID="DataPager4" runat="server">
                                             <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" />
                                                <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="select-pager-button" />
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="true" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                                <tr id="Tr3" runat="server">
                                    <td id="Td5" runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="border-collapse: collapse;
                                            border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;"
                                            class="gridlist">
                                            <tr id="Tr4" runat="server">
                                                <th id="Th1" runat="server">
                                                    Make
                                                </th>
                                                <th id="Th2" runat="server">
                                                    Make Model
                                                </th>
                                                <th id="Th3" runat="server">
                                                    Model Year
                                                </th>
                                                <th id="Th4" runat="server">
                                                    Color
                                                </th>
                                                <th id="Th5" runat="server">
                                                    Trans.
                                                </th>
                                                <th id="Th6" runat="server">
                                                    Door
                                                </th>
                                                <th id="Th7" runat="server">
                                                    Make Category
                                                </th>
                                                <th id="Th8" runat="server">
                                                    Options
                                                </th>
                                                <th id="Th9" runat="server">
                                                    Drive
                                                </th>
                                                <th id="Th10" runat="server">
                                                    Status
                                                </th>
                                                <th id="Th11" runat="server">
                                                    Price
                                                </th>
                                                <th id="Th12" runat="server" align="center">
                                                    View
                                                </th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="Tr5" runat="server">
                                    <td id="Td6" runat="server" style="text-align: center; font-family: Verdana, Arial, Helvetica, sans-serif;
                                        color: #CCCCCC;">
                                       
                                        
                                        <asp:DataPager ID="DataPager1" runat="server">
                                             <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" />
                                                <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="select-pager-button" />
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="true" />
                                            </Fields>
                                        </asp:DataPager>
                                        
                                        
                                       
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
    <asp:ObjectDataSource ID="odsstock_type" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBy" TypeName="masterdataTableAdapters.display_typeTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odscolor" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="masterdataTableAdapters.vCOLORTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="vmakecategory" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="masterdataTableAdapters.vMakeCategoryTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsMake" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="masterdataTableAdapters.make_nocountTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsMakeName" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="getMakeModelNames" TypeName="masterdataTableAdapters.tblmake_detailsTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsStklist" runat="server" 
    OldValuesParameterFormatString="{0}"
        SelectMethod="GetData" TypeName="dsStockTableAdapters.newSTOCK_LISTTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="MAKE" QueryStringField="make" Type="String" />
            <asp:QueryStringParameter DefaultValue="0" Name="MODEL_DESCRIPTION" QueryStringField="makemodel"
                Type="String" />
            <asp:QueryStringParameter DefaultValue="0" Name="COLOR" QueryStringField="color"
                Type="String" />
            <asp:QueryStringParameter DefaultValue="0" Name="make_category" QueryStringField="makecat"
                Type="String" />
            <asp:QueryStringParameter DefaultValue="0" Name="globalLocationID" QueryStringField="globaloc"
                Type="String" />
            <asp:QueryStringParameter DefaultValue="0" Name="display_type" QueryStringField="displaytype"
                Type="String" />
            <asp:QueryStringParameter DefaultValue="Any" Name="MODEL" QueryStringField="model"
                Type="String" />
            <asp:QueryStringParameter DefaultValue="Any" Name="MODEL2" QueryStringField="model2"
                Type="String" />
            <asp:QueryStringParameter DefaultValue=" " Name="AVAILABILITY" QueryStringField="ava"
                Type="String" />
            <asp:QueryStringParameter DefaultValue="Any" Name="TRANSMISSION" QueryStringField="trans"
                Type="String" />
            <asp:QueryStringParameter DefaultValue=" " Name="Cost1" QueryStringField="cost1"
                Type="String" />
            <asp:QueryStringParameter DefaultValue=" " Name="cost2" QueryStringField="cost2"
                Type="String" />
            <asp:QueryStringParameter DefaultValue=" " Name="fuel_type" QueryStringField="fuel_type"
                Type="String" />
            <asp:QueryStringParameter DefaultValue=" " Name="drive" QueryStringField="drive"
                Type="String" />
            <asp:QueryStringParameter DefaultValue=" " Name="door" QueryStringField="door" Type="String" />
            <asp:Parameter DefaultValue="1" Name="roleID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue=" " Name="chassis_no" QueryStringField="chassi"
                Type="String" />
            <asp:QueryStringParameter DefaultValue="0" Name="favourite_id" QueryStringField="fid"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
