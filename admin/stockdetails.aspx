<%@ Page Language="VB" MasterPageFile="~/admin/MasterPage.master" EnableEventValidation="false"
    AutoEventWireup="false" CodeFile="stockdetails.aspx.vb" Inherits="admin_stockdetails"
    Title="-Stock Details-" Culture="zh-SG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"> <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.js" type="text/javascript"></script>  
<script type="text/javascript">
    $(window).bind('load', function () {
        var headerChk = $(".chkHeader input");
        var itemChk = $(".chkItem input");

        headerChk.bind("click", function () {
            itemChk.each(function () {
                this.checked = headerChk[0].checked;
            })
        });

        var flag = false;
        itemChk.bind("click", function () {

            itemChk.each(function () {
                if (this.checked == false) {
                    flag = false;
                    return false;
                }
                else
                    flag = true;
            })
            headerChk[0].checked = flag;
        });
    });

    //same version for partial postback
    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (sender, args) {

        var headerChk = $(".chkHeader input");
        var itemChk = $(".chkItem input");

        headerChk.bind("click", function () {
            itemChk.each(function () {
                this.checked = headerChk[0].checked;
            })
        });

        var flag = false;
        itemChk.bind("click", function () {
            itemChk.each(function () {
                if (this.checked == false) {

                    flag = false;
                    return false;
                }
                else
                    flag = true;
            })
            headerChk[0].checked = flag;
        });
    });
   </script>
    <script type="text/javascript">
        $(document).ready(function () {


            $('#<%=txtentry_date.clientid %>').datepicker({
                dateFormat: 'd-M-yy',
                inline: true,
                showButtonPanel: true,
                changeMonth: true,
                changeYear: true,
                minDate: -3000,
                maxDate: 3000
            });

            $('#<%=txtsold_date.clientid %>').datepicker({
                dateFormat: 'd-M-yy',
                inline: true,
                showButtonPanel: true,
                changeMonth: true,
                changeYear: true,
                minDate: -3000,
                maxDate: 3000
            });



            $("#txtsold_date").waterMarker("WaterMark", null, "Enter sold date");


        })



        var pageUrl = '<%=ResolveUrl("~/admin/stockdetails.aspx")%>'
        function PopulateMakeName() {

            if ($('#<%=ddlMake.ClientID%>').val() == "0") {
                $('#<%=ddlMakeName.ClientID %>').empty().append('<option selected="selected" value="0">Any</option>');
            }
            else {
                $('#<%=ddlMakeName.ClientID %>').empty().append('<option selected="selected" value="0">Loading...</option>');
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/get_MakeNames',
                    data: '{MakeID: ' + $('#<%=ddlMake.ClientID%>').val() + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnMakeNamePopulated,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        }


        function PopulateMakeCategory() {

            if ($('#<%=ddlmake_category.ClientID%>').val() == "0") {
                $('#<%=ddltype.ClientID %>').empty().append('<option selected="selected" value="0">Any</option>');
            }
            else {
                $('#<%=ddltype.ClientID %>').empty().append('<option selected="selected" value="0">Loading...</option>');
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/get_MakeCategory',
                    data: '{CategoryID: ' + $('#<%=ddlmake_category.ClientID%>').val() + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnMakeCategoryPopulated,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        }


        function OnMakeNamePopulated(response) {
            PopulateControl(response.d, $("#<%=ddlMakeName.ClientID %>"));
        }
        function OnMakeCategoryPopulated(response) {
            PopulateControl(response.d, $("#<%=ddltype.ClientID %>"));
        }


        function PopulateControl(list, control) {
            if (list.length > 0) {
                control.removeAttr("disabled");
                control.empty().append('<option selected="selected" value="0">Any</option>');
                $.each(list, function () {
                    control.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            }
            else {
                control.empty().append('<option selected="selected" value="0">Not available<option>');
            }
        }
    
    
    </script>
    <style type="text/css">
        .style1
        {
            width: 33px;
        }
        .style2
        {
            height: 5px;
            width: 97px;
        }
        .style3
        {
            width: 97px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="myform_heading2">
        <span style="color: #3366CC">Stock </span>Details
    </ul>
    <ul class="myform_line">
    </ul>
    <asp:Panel ID="Panel1" runat="server">
        <table style="width: 100%">
            <tbody style="border-top-width: medium; border-left-width: medium; border-bottom-width: medium;
                border-right-width: medium">
                <tr>
                    <td style="width: 31px">
                        <asp:Button ID="cmdSAVE" runat="server" Text="Save" SkinID="AspButton2" ValidationGroup="form"
                            CssClass="btn_action" UseSubmitBehavior="False"></asp:Button>
                    </td>
                    <td>
                        <asp:Button ID="cmdADDNEW" OnClick="cmdADDNEW_Click" runat="server" ValidationGroup="form"
                            Text="Add New" SkinID="AspButton2" CssClass="btn_action"></asp:Button>
                    </td>
                    <td>
                        <span onclick="return confirm('Are you sure to Delete?')">
                            <asp:Button ID="cmdDelete" runat="server" Text="Delete" CssClass="btn_action"></asp:Button>
                        </span>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtchassisno"
                            OnServerValidate="ServerSideValidation"></asp:CustomValidator>
                        <asp:Label ID="Label1" runat="server" Font-Size="11px" Width="40px"></asp:Label>
                        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/admin/stocklist.aspx">goto stock list</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblstatus" runat="server" __designer:wfdid="w1" Font-Bold="True" Font-Size="24pt"
                            ForeColor="Green"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblmsg" runat="server" ForeColor="#C04000" Width="271px"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblfileref" runat="server" Text="File Ref#"></asp:Label>
                        <asp:TextBox ID="txtfile_ref" runat="server" Width="91px"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlvehicledetails" runat="server" GroupingText="VEHICLE DETAILS...">
    <asp:Panel ID="Panel2" runat="server" GroupingText="Mandatory Items...">
    <table style="width: 100%">
    <tbody style="border-top-width: medium; border-left-width: medium; border-bottom-width: medium;
                border-right-width: medium">
                <tr>
                    <td style="width: 31px; height: 19px">
                        <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="#0033CC">CHASSIS_NO</asp:LinkButton>
                    </td>
                    <td>
                        <asp:TextBox ID="txtchassisno" runat="server" Width="150px" MaxLength="25" onfocus="this.style.backgroundColor='#FFFF99';"
                            onblur="this.style.backgroundcolor='white';"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularchassisno" ValidationGroup="form" runat="server"
                            ControlToValidate="txtchassisno" ValidationExpression="^[a-zA-Z0-9-]+$" Display="Dynamic"
                            ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td class="style3">
                        <span>Make </span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlmake" runat="server" onchange="PopulateMakeName()" Width="132px"
                            DataSourceID="vmake" DataTextField="make" DataValueField="makeID">
                        </asp:DropDownList>
                        <asp:HiddenField ID="HmakeID" runat="server" />
                    </td>
                      <td>
                        <span>Model Desc. </span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlMakeName" runat="server" Width="133px" DataSourceID="odsMakeDetails"
                            DataTextField="model_description" DataValueField="ID">
                            <asp:ListItem Value="0">Any</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    
                    </tr>
                    <tr><td>
                        <span>Year</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtmodel" runat="server" Width="120px" MaxLength="7" onfocus="this.style.backgroundColor='#FFFF99';"
                            onblur="this.style.backgroundcolor='white';"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="form"
                            runat="server" ControlToValidate="txtmodel" ValidationExpression="^\d{2,4}(\/\d{1,2})?$"
                            Display="Dynamic" ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td> <td class="style3">
                        Vehicle Grade
                    </td>
                    <td>
                        <asp:TextBox ID="txtVeh_Grade" runat="server"></asp:TextBox>
                    </td> <td>
                        <asp:Label ID="Label11" runat="server" Text="Mileage (km)" onfocus="this.style.backgroundColor='#FFFF99';"
                            onblur="this.style.backgroundcolor='white';"></asp:Label>
                    </td>
                    <td style="height: 5px">
                        <asp:TextBox ID="txtmileage" runat="server" MaxLength="14" Width="118px" onfocus="this.style.backgroundColor='#FFFF99';"
                            onblur="this.style.backgroundcolor='white';"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator21" ValidationGroup="form"
                            runat="server" ControlToValidate="txtmileage" ValidationExpression="\d*(\.\d{0,4})?"
                            Display="Dynamic" ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td></tr>
                    <tr><td>
                        <span>Steering</span>
                    </td>
                    <td valign="middle" colspan="1">
                        <asp:DropDownList ID="rdbdrive" runat="server">
                            <asp:ListItem Value="L">Left Hand</asp:ListItem>
                            <asp:ListItem Value="R">Right Hand</asp:ListItem>
                            <asp:ListItem Value="C">Classic Cars</asp:ListItem>
                        </asp:DropDownList>
                    </td> <td class="style3">
                        <span>Engine CC</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCC" runat="server" onfocus="this.style.backgroundColor='#FFFF99';"
                            onblur="this.style.backgroundcolor='white';" Width="115px" MaxLength="15"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegulartCC" ValidationGroup="form" runat="server"
                            ControlToValidate="txtCC" ValidationExpression="^[a-zA-Z0-9 ]+$" Display="Dynamic"
                            ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td><td>
                        <span>Fuel </span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFuel" runat="server" Width="123px" __designer:wfdid="w5"
                            DataSourceID="vfuel" DataTextField="veh_fuel_type_name" DataValueField="veh_fuel_type_id">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>PATROL</asp:ListItem>
                            <asp:ListItem>DEISEL</asp:ListItem>
                        </asp:DropDownList>
                    </td></tr>
                    <tr><td>
                        <span>Transmission</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddltransmission" runat="server">
                            <asp:ListItem></asp:ListItem>
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
                    </td><td class="style2">
                        <asp:Label ID="Label10" runat="server" Text="Seats "></asp:Label>
                    </td>
                    <td style="height: 5px">
                        <asp:TextBox ID="txtseats" MaxLength="20" runat="server" Width="118px" onfocus="this.style.backgroundColor='#FFFF99';"
                            onblur="this.style.backgroundcolor='white';"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regulartxtseats" ValidationGroup="form" runat="server"
                            ControlToValidate="txtseats" ValidationExpression="^[a-zA-Z0-9 ]+$" Display="Dynamic"
                            ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <span>Doors</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddldoor" runat="server" Width="120px">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                   </tr> <tr>
                 
                    <td>
                        <span>Color</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlcolor" runat="server" Width="125px" AppendDataBoundItems="True"
                            DataSourceID="vColor" DataTextField="color" DataValueField="id">
                        </asp:DropDownList>
                    </td>
                    <td class="style3">
                        <span>Interior Color </span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlInteriorColor" runat="server" AppendDataBoundItems="True"
                            DataSourceID="vColor" DataTextField="color" DataValueField="id" Width="119px">
                        </asp:DropDownList>
                    </td> <td>
                        <span>Type </span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlmake_category" runat="server" onchange="PopulateMakeCategory()"
                            Width="120px" DataSourceID="vmakecategory" DataTextField="category" DataValueField="id">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr><td>
                        <span>Location</span>
                    </td>
                    <td colspan="1">
                        <asp:DropDownList ID="ddlcountry" runat="server" DataSourceID="vGlobalLocation" DataTextField="globalLocation"
                            DataValueField="ID" Width="131px">
                            <asp:ListItem Value="2">Japan</asp:ListItem>
                            <asp:ListItem Value="3">U.A.E</asp:ListItem>
                            <asp:ListItem Value="4">China</asp:ListItem>
                            <asp:ListItem Value="5">Pakistan</asp:ListItem>
                            <asp:ListItem Value="11">South Korea</asp:ListItem>
                            <asp:ListItem Value="8">U.K</asp:ListItem>
                            <asp:ListItem Value="7">U.S</asp:ListItem>
                            <asp:ListItem Value="9">South Africa</asp:ListItem>
                            <asp:ListItem Value="10">Singapore</asp:ListItem>
                            <asp:ListItem Value="13">Tanzania</asp:ListItem>
                            <asp:ListItem Value="12">Uganda</asp:ListItem>
                            <asp:ListItem Value="6">Kenya</asp:ListItem>
                        </asp:DropDownList>
                    </td> <td class="style3">
                        <asp:Label ID="Label51" runat="server" Text="Options"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtoptions" runat="server" Height="52px" onblur="this.style.backgroundcolor='white';"
                            onfocus="this.style.backgroundColor='#FFFF99';" TextMode="MultiLine" Width="120px"></asp:TextBox>
                    </td></tr>
                </tbody>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" GroupingText="Optional Items...">
      <table style="width: 100%">
            <tbody style="border-top-width: medium; border-left-width: medium; border-bottom-width: medium;
                border-right-width: medium">
               
                <tr>
                   
                    
                   
                    <td >
                        <span>Cat type </span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddltype" runat="server" DataSourceID="odsCatType" DataTextField="veh_type_name"
                            DataValueField="veh_type_id">
                        </asp:DropDownList>
                        <br />
                    </td>
                    <td class="style3">
                        <span>M Country </span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlmake_country" runat="server" Width="120px" DataSourceID="dsCountry"
                            DataTextField="country_name" DataValueField="code">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <span>Used/New </span>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rdbused" runat="server" Width="120px" RepeatDirection="Horizontal">
                            <asp:ListItem Value="U">USED</asp:ListItem>
                            <asp:ListItem Value="N">NEW</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                
                <tr>
                    
                    
                    <td>
                        <span>Position</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddllocation" runat="server" Width="126px" __designer:wfdid="w8"
                            DataSourceID="odsLOC" DataTextField="CAR_LOCATION" DataValueField="ID">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <span>Brand </span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtbrand" runat="server" MaxLength="20" Width="120px" __designer:wfdid="w1"
                            onfocus="this.style.backgroundColor='#FFFF99';" onblur="this.style.backgroundcolor='white';"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="form"
                            runat="server" ControlToValidate="txtbrand" ValidationExpression="^[a-zA-Z0-9/]+$"
                            Display="Dynamic" ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td style="height: 5px" colspan="1">
                        <asp:Label ID="Label26" runat="server" Text="Engine No." Width="85px"></asp:Label>
                    </td>
                    <td style="height: 5px">
                        <asp:TextBox ID="txtengine_no" MaxLength="27" runat="server" Width="100px" __designer:wfdid="w3"
                            onfocus="this.style.backgroundColor='#FFFF99';" onblur="this.style.backgroundcolor='white';"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularengine_no" ValidationGroup="form" runat="server"
                            ControlToValidate="txtengine_no" ValidationExpression="^[a-zA-Z0-9-]+$" Display="Dynamic"
                            ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    
                    
                    <td style="width: 97px; height: 5px">
                        <asp:Label ID="Label31" runat="server" Text="Showroom"></asp:Label>
                    </td>
                    <td style="width: 140px; height: 5px">
                        <asp:DropDownList ID="ddlShowroom" runat="server" Width="120px" DataSourceID="dsShowroom"
                            DataTextField="SHOWROOM" DataValueField="ID">
                        </asp:DropDownList>
                    </td>
                    <td colspan="1" style="height: 5px">
                        <asp:Label ID="Label12" runat="server" Text="HS Code"></asp:Label>
                    </td>
                    <td style="height: 5px">
                        <asp:TextBox ID="txtHsCode" runat="server" onfocus="this.style.backgroundColor='#FFFF99';"
                            onblur="this.style.backgroundcolor='white';" Width="97px" MaxLength="20"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularHsCode" ValidationGroup="form" runat="server"
                            ControlToValidate="txtHsCode" ValidationExpression="^[a-zA-Z0-9 ]+$" Display="Dynamic"
                            ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:Label ID="Label36" runat="server" Text="Arr Date"></asp:Label>
                    </td>
                    <td style="width: 140px; height: 5px">
                        <asp:TextBox ID="txtentry_date" runat="server" Width="117px" onfocus="this.style.backgroundColor='#FFFF99';"
                            onblur="this.style.backgroundcolor='white';"></asp:TextBox>
                    </td>
                </tr>
               
                <tr>
                    <td style="width: 31px; height: 5px">
                        <asp:Label ID="Label41" runat="server" Text="Lenght (cm)" Width="90px"></asp:Label>
                    </td>
                    <td style="height: 5px">
                        <asp:TextBox ID="txtlenght" runat="server" MaxLength="40" onblur="this.style.backgroundcolor='white';"
                            onfocus="this.style.backgroundColor='#FFFF99';"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server"
                            ControlToValidate="txtlenght" ValidationGroup="form" ValidationExpression="\d*(\.\d{0,4})?"
                            Display="Dynamic" ErrorMessage="*">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td class="style5">
                        <asp:Label ID="Label42" runat="server" Text="Width (cm)" Width="80px"></asp:Label>
                    </td>
                    <td style="height: 5px">
                        <asp:TextBox ID="txtwidth" runat="server" MaxLength="40" onblur="this.style.backgroundcolor='white';"
                            onfocus="this.style.backgroundColor='#FFFF99';"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator14" ValidationGroup="form"
                            runat="server" ControlToValidate="txtwidth" ValidationExpression="\d*(\.\d{0,4})?"
                            Display="Dynamic" ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td colspan="1" style="height: 5px">
                        <asp:Label ID="Label43" runat="server" Text="Height(cm)" Width="80px"></asp:Label>
                    </td>
                    <td style="height: 5px">
                        <asp:TextBox ID="txtheight" runat="server" MaxLength="40" onblur="this.style.backgroundcolor='white';"
                            onfocus="this.style.backgroundColor='#FFFF99';" Width="116px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularheight" ValidationGroup="form" runat="server"
                            ControlToValidate="txtheight" ValidationExpression="\d*(\.\d{0,4})?" Display="Dynamic"
                            ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td>
                   
                </tr>
                <tr>
                 <td style="width: 97px; height: 5px">
                        <asp:Label ID="Label28" runat="server" Text="Weights(kg)"></asp:Label>
                    </td>
                    <td style="height: 5px">
                        <asp:TextBox ID="txtweight" runat="server" MaxLength="10" onblur="this.style.backgroundcolor='white';"
                            onfocus="this.style.backgroundColor='#FFFF99';" Width="120px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" ValidationGroup="form"
                            runat="server" ControlToValidate="txtweight" ValidationExpression="^(-)?\d+(\.\d\d)?$"
                            Display="Dynamic" ErrorMessage="Invalid Data">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <span>Status </span>
                        <br />
                        <span>Sold Date</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlstatus" runat="server">
                            <asp:ListItem>STOCK</asp:ListItem>
                            <asp:ListItem>SALE</asp:ListItem>
                            <asp:ListItem>SOLD</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:TextBox ID="txtsold_date" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regexSoldDat" ValidationGroup="form" runat="server"
                            ControlToValidate="txtsold_date" ValidationExpression="^(([0-9])|([0-2][0-9])|([3][0-1]))\-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\-\d{4}$"
                            Display="Dynamic" ErrorMessage="Format should be [dd-MMM-yyyy]">
                        </asp:RegularExpressionValidator>
                    </td>
                   
                    <td>
                        Display type
                    </td>
                    <td colspan="2">
                        <%-- <asp:ListBox ID="ddlwebdisplaytype" SelectionMode="Multiple" runat="server"></asp:ListBox>
                    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                            runat="server" 
                            ControlToValidate="ddlwebdisplaytype" 
                            
                            ErrorMessage="Required" ></asp:RequiredFieldValidator>--%>
                        <asp:ListBox ID="ddlwebdisplaytype" SelectionMode="Multiple" runat="server"></asp:ListBox>
                        <%--                    
                        <asp:RequiredFieldValidator ID="Reqwebdisplaytype" 
                        runat="server" 
                            ControlToValidate="ddlwebdisplaytype" 
                            ValidationGroup="form"
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        --%>
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        <span>Priority </span>
                      
                    </td>
                    <td>
                       <asp:DropDownList ID="ddlDisplayPriority" runat="server">
                            <asp:ListItem>None</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        Import Type
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlImportType" runat="server" DataSourceID="odsImportType"
                            DataTextField="Import_TypeName" DataValueField="Import_Type_ID">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td >
                        &nbsp;
                    </td>
                    
                </tr>
            </tbody>
        </table>
    </asp:Panel>
      
    </asp:Panel>
    <asp:Panel ID="pnlpurchase" runat="server" GroupingText="Purchase...">
        <table style="width: 100%">
            <tbody style="border-top-width: medium; border-left-width: medium; border-bottom-width: medium;
                border-right-width: medium">
                <tr>
                    <td>
                        &nbsp;<asp:Label ID="Label9" runat="server" Text="OP"></asp:Label>/<asp:Label ID="Label32"
                            runat="server" Text=" Frieght" Width="70px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtop_yen" runat="server" Width="71px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regulartop_yen" ValidationGroup="form" runat="server"
                            ControlToValidate="txtop_yen" ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                            Display="Dynamic" ErrorMessage="Valid format [999,999,999.999]">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtfreight_yen" runat="server" Width="55px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularfreight_yen" ValidationGroup="form" runat="server"
                            ControlToValidate="txtfreight_yen" ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                            Display="Dynamic" ErrorMessage="Valid format [999,999,999.999]">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label33" runat="server" Text="Buying" Width="83px"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:TextBox ID="txtOP_dhs" runat="server" Font-Bold="True" ForeColor="Desktop" Width="80px">
                        </asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegulartxtOP_dhs" ValidationGroup="form" runat="server"
                            ControlToValidate="txtOP_dhs" ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                            Display="Dynamic" ErrorMessage="Valid format [999,999,999.999]">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:Label ID="Label34" runat="server" Text="Rate" Width="79px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOP_yen_rate" runat="server" Width="88px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularOP_yen_rate" ValidationGroup="form" runat="server"
                            ControlToValidate="txtOP_yen_rate" ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                            Display="Dynamic" ErrorMessage="Valid format [999,999,999.999]">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td style="width: 140px">
                        &nbsp;
                        <asp:Label ID="Label55" runat="server" Text="Buying Curr"></asp:Label>
                    </td>
                    <td style="width: 140px">
                        <asp:DropDownList ID="ddlcurrency" runat="server" DataSourceID="odsCurrency" DataTextField="currency_name"
                            DataValueField="currency_ID">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 31px">
                        <asp:Label ID="Label37" runat="server" Text="Web Price" Width="109px"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtfob_price" runat="server" Font-Bold="True" ForeColor="Desktop"
                            Width="128px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularfob_price" ValidationGroup="form" runat="server"
                            ControlToValidate="txtfob_price" ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                            Display="Dynamic" ErrorMessage="Valid format [999,999,999.999]">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td class="style1">
                        <asp:Label ID="Label38" runat="server" Text="C Type" Width="109px"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:DropDownList ID="ddlC_type" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>FOB</asp:ListItem>
                            <asp:ListItem>CIF</asp:ListItem>
                            <asp:ListItem>C&amp;F</asp:ListItem>
                            <asp:ListItem>FINAL</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;<asp:Label ID="Label56" runat="server" Text="CF Price" Width="66px"></asp:Label>
                    </td>
                    <td>
                        &nbsp;<asp:TextBox ID="txtCF_price" runat="server" Font-Bold="True" ForeColor="Desktop"
                            Width="80px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularCF_price" ValidationGroup="form" runat="server"
                            ControlToValidate="txtCF_price" ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                            Display="Dynamic" ErrorMessage="Valid format [999,999,999.999]">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td style="width: 140px">
                        &nbsp;
                        <asp:Label ID="Label57" runat="server" Text="CI Price" Width="74px"></asp:Label>
                    </td>
                    <td style="width: 140px">
                        <asp:TextBox ID="txtci_price" runat="server" Font-Bold="True" ForeColor="Desktop"
                            Width="80px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularci_price" ValidationGroup="form" runat="server"
                            ControlToValidate="txtci_price" ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                            Display="Dynamic" ErrorMessage="Valid format [999,999,999.999]">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 31px">
                        <asp:Label ID="Label58" runat="server" Text="CIF Price(¥)" Width="109px"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtcif_price" runat="server" Font-Bold="True" ForeColor="Desktop"
                            Width="80px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="Regularcif_price" ValidationGroup="form" runat="server"
                            ControlToValidate="txtcif_price" ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                            Display="Dynamic" ErrorMessage="Valid format [999,999,999.999]">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td>
                        Selling Curr
                    </td>
                    <td colspan="1">
                        <asp:DropDownList ID="ddlSellingCurr" runat="server" DataSourceID="odsCurrency" DataTextField="currency_name"
                            DataValueField="currency_ID">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label59" runat="server" Text="Price Code:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtsellingpricecode" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularPriceCode" ValidationGroup="form" runat="server"
                            ControlToValidate="txtsellingpricecode" ValidationExpression="^\$?(?:\d+|\d{1,3}(?:,\d{3})*)(?:\.\d{1,4}){0,1}$"
                            Display="Dynamic" ErrorMessage="Valid format [999,999,999.999]">
                        </asp:RegularExpressionValidator>
                    </td>
                    <td style="width: 140px">
                        &nbsp;
                    </td>
                    <td style="width: 140px">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlRegionalStock" runat="server" GroupingText="Regional Stock...">
         <asp:DataList ID="DlReviewImages" runat="server"  DataSourceID="sqlRegional" 
                  RepeatColumns="6" RepeatDirection="Horizontal" CellSpacing="5" CellPadding="5"
                  HeaderStyle-VerticalAlign="Top" Width="878px">
                  <HeaderTemplate><asp:CheckBox ID="cbCheckAll" runat="server" CssClass="chkHeader" />  Check All</HeaderTemplate>
            <ItemTemplate>               
                        <asp:CheckBox ID="chkbx" runat="server" CssClass="chkItem"/>
                        <%#Container.DataItem("CountryName")%>
                        <asp:HiddenField ID="hdnID" runat="server" value='<%#Container.DataItem("RCID")%>' />                   
            </ItemTemplate>
           
        </asp:DataList>
    </asp:Panel>
    <asp:Panel ID="pnlUpload" runat="server" GroupingText="Upload Images ...">
        <div id="imageattachments">
            <ul>
                <li>
                    <asp:Label ID="Label2" runat="server" Text="Image 1"></asp:Label>
                </li>
                <li>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/imagecar/noimage.PNG" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="cmdupload1" runat="server" Text="Add" CssClass="btn_action" />
                </li>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </ul>
            <ul>
                <li>
                    <asp:Label ID="Label3" runat="server" Text="Image 2"></asp:Label>
                </li>
                <li>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/imagecar/noimage.PNG" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload2" runat="server" />
                    <asp:Button ID="cmdupload2" runat="server" Text="Add" CssClass="btn_action" />
                </li>
                <asp:HiddenField ID="HiddenField2" runat="server" />
            </ul>
            <ul>
                <li>
                    <asp:Label ID="Label4" runat="server" Text="Image 3"></asp:Label>
                </li>
                <li>
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/imagecar/noimage.PNG" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload3" runat="server" />
                    <asp:Button ID="cmdupload3" runat="server" Text="Add" CssClass="btn_action" />
                </li>
                <asp:HiddenField ID="HiddenField3" runat="server" />
            </ul>
            <ul>
                <li>
                    <asp:Label ID="Label5" runat="server" Text="Image 4"></asp:Label>
                </li>
                <li>
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/imagecar/noimage.PNG" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload4" runat="server" />
                    <asp:Button ID="cmdupload4" runat="server" Text="Add" CssClass="btn_action" />
                </li>
                <asp:HiddenField ID="HiddenField4" runat="server" />
            </ul>
            <ul>
                <li>
                    <asp:Label ID="Label6" runat="server" Text="Image 5"></asp:Label>
                </li>
                <li>
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/imagecar/noimage.PNG" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload5" runat="server" />
                    <asp:Button ID="cmdupload5" runat="server" Text="Add" CssClass="btn_action" />
                </li>
                <asp:HiddenField ID="HiddenField5" runat="server" />
            </ul>
            <ul>
                <li>
                    <asp:Label ID="Label7" runat="server" Text="Image 6"></asp:Label>
                </li>
                <li>
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/imagecar/noimage.PNG" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload6" runat="server" />
                    <asp:Button ID="cmdupload6" runat="server" Text="Add" CssClass="btn_action" />
                </li>
                <asp:HiddenField ID="HiddenField6" runat="server" />
            </ul>
            <ul>
                <li>
                    <asp:Label ID="Label8" runat="server" Text="Image 7"></asp:Label>
                </li>
                <li>
                    <asp:Image ID="Image7" runat="server" ImageUrl="~/imagecar/noimage.PNG" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload7" runat="server" />
                    <asp:Button ID="cmdupload7" runat="server" Text="Add" CssClass="btn_action" />
                </li>
                <asp:HiddenField ID="HiddenField7" runat="server" />
            </ul>
            <ul>
                <li>
                    <asp:Label ID="lblimage8" runat="server" Text="Image 8"></asp:Label>
                </li>
                <li>
                    <asp:Image ID="Image8" runat="server" ImageUrl="~/imagecar/noimage.PNG" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload8" runat="server" />
                    <asp:Button ID="cmdupload8" runat="server" Text="Add" CssClass="btn_action" />
                </li>
                <asp:HiddenField ID="HiddenField8" runat="server" />
            </ul>
            <ul>
                <li>
                    <asp:Label ID="lblimage9" runat="server" Text="Image 9"></asp:Label>
                </li>
                <li>
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/imagecar/noimage.PNG" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload9" runat="server" />
                    <asp:Button ID="cmdupload9" runat="server" Text="Add" CssClass="btn_action" />
                </li>
                <asp:HiddenField ID="HiddenField9" runat="server" />
            </ul>
            <ul>
                <li>
                    <asp:Label ID="lblimage10" runat="server" Text="Image 10"></asp:Label>
                </li>
                <li>
                    <asp:Image ID="Image10" runat="server" ImageUrl="~/imagecar/noimage.PNG" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload10" runat="server" />
                    <asp:Button ID="cmdupload10" runat="server" Text="Add" CssClass="btn_action" />
                </li>
                <asp:HiddenField ID="HiddenField10" runat="server" />
            </ul>
            <asp:Button ID="cmdUpload_all" runat="server" Text="Upload All" CssClass="btn_action" />
            <asp:Label ID="lblattachmentmsg" runat="server" Text="" Width="200px"></asp:Label>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlFeatures" runat="server" GroupingText="Features...">
        <div id="features">
            <ul>
                <li>
                    <asp:CheckBox ID="chkAC" runat="server" Text="AC" />
                </li>
                <li>
                    <asp:CheckBox ID="chkPW" runat="server" Text="PW" /></li>
                <li>
                    <asp:CheckBox ID="chkPS" runat="server" Text="PS" /></li>
                <li>
                    <asp:CheckBox ID="chkAirbag" runat="server" Text=" Airbag" /></li>
                <li>
                    <asp:CheckBox ID="chkDual_Airbag" runat="server" Text="Dual_Airbag" /></li>
                <li>
                    <asp:CheckBox ID="chkLeather_Seats" runat="server" Text="Leather_Seats" /></li>
                <li>
                    <asp:CheckBox ID="chkP_MIR" runat="server" Text="P_MIR" /></li>
                <li>
                    <asp:CheckBox ID="chkPLK" runat="server" Text="PLK" /></li>
            </ul>
            <ul>
                <li>
                    <asp:CheckBox ID="chkDigital_Meter" runat="server" Text="Digital_Meter" /></li>
                <li>
                    <asp:CheckBox ID="chkFog_Lights" runat="server" Text="Fog_Lights" /></li>
                <li>
                    <asp:CheckBox ID="chkRoofRail" runat="server" Text="RoofRail" /></li>
                <li>
                    <asp:CheckBox ID="chkSun_Roof" runat="server" Text="Sun_Roof" /></li>
                <li>
                    <asp:CheckBox ID="chkTwin_Sun_Roof" runat="server" Text="Twin_Sun_Roof" /></li>
                <li>
                    <asp:CheckBox ID="chkBack_Tyre" runat="server" Text="Back_Tyre" /></li>
                <li>
                    <asp:CheckBox ID="chkCAS" runat="server" Text="CAS" /></li>
                <li>
                    <asp:CheckBox ID="chkaac" runat="server" Text="AAC" /></li>
            </ul>
            <ul>
                <li>
                    <asp:CheckBox ID="chkFender_Mirror" runat="server" Text="Fender_Mirror" /></li>
                <li>
                    <asp:CheckBox ID="chkGuard_Grill" runat="server" Text="Guard_Grill" /></li>
                <li>
                    <asp:CheckBox ID="chkBack_Censor" runat="server" Text="Back_Censor" /></li>
                <li>
                    <asp:CheckBox ID="chkOne_Owner" runat="server" Text="One_Owner" /></li>
                <li>
                    <asp:CheckBox ID="chkTool_Kit" runat="server" Text="Tool_Kit" /></li>
                <li>
                    <asp:CheckBox ID="chkExtra_Tyre" runat="server" Text="Extra_Tyre" /></li>
                <li>
                    <asp:CheckBox ID="chkwac" runat="server" Text="WAC" /></li>
                <li>
                    <asp:CheckBox ID="chkabs" runat="server" Text="ABS" /></li>
            </ul>
            <ul>
                <li>
                    <asp:CheckBox ID="chkbackcamera" runat="server" Text="Back Camera" /></li>
                <li>
                    <asp:CheckBox ID="chkMD_Player" runat="server" Text="MD_Player" /></li>
                <li>
                    <asp:CheckBox ID="chkdvd" runat="server" Text="DVD" /></li>
                <li>
                    <asp:CheckBox ID="chkToll_Tax_Dedector" runat="server" Text="Toll_Tax_Dedector" /></li>
                <li>
                    <asp:CheckBox ID="chk4x4" runat="server" Text="4 X 4" /></li>
                <li>
                    <asp:CheckBox ID="chk6x6" runat="server" Text="6 X 6" /></li>
                <li>
                    <asp:CheckBox ID="chkaw" runat="server" Text="Alloy Wheels" /></li>
                <li>
                    <asp:CheckBox ID="chkkey_less" runat="server" Text="Key_Less" /></li>
            </ul>
            <ul>
                <li>
                    <asp:CheckBox ID="chkBodyKit" runat="server" Text="BodyKit" /></li>
                <li>
                    <asp:CheckBox ID="chkSeat_Heater" runat="server" Text="Seat_Heater" /></li>
                <li>
                    <asp:CheckBox ID="chkCD_Changer" runat="server" Text="CD_Changer" /></li>
                <li>
                    <asp:CheckBox ID="chkTV_NAVI" runat="server" Text="TV_NAVI" /></li>
                <li>
                    <asp:CheckBox ID="chkFront_Spoiler" runat="server" Text="Front_Spoiler" /></li>
                <li>
                    <asp:CheckBox ID="chkRear_Spoiler" runat="server" Text="Rear_Spoiler" /></li>
            </ul>
        </div>
    </asp:Panel>
    <div>
        <asp:Label ID="lblerror" runat="server" ForeColor="Red" Font-Bold="True" Width="491px"></asp:Label>
    </div>
    <table>
        <tbody>
            <tr>
                <td style="width: 31px; height: 6px">
                </td>
                <td style="height: 6px">
                    <asp:Button ID="cmdSave2" runat="server" Text="Save" SkinID="AspButton2" CssClass="btn_action"
                        UseSubmitBehavior="False"></asp:Button>
                </td>
                <td style="height: 6px" colspan="3">
                    &nbsp;
                    <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/admin/stocklist.aspx">goto stock list</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:HiddenField ID="hID" runat="server" />
                </td>
                <td style="width: 357px">
                </td>
                <td colspan="1">
                </td>
                <td>
                </td>
                <td style="width: 97px">
                </td>
                <td style="width: 140px" colspan="1">
                </td>
            </tr>
        </tbody>
    </table>
    <div>
     <asp:SqlDataSource 
          ConnectionString="<%$ ConnectionStrings:autoConnectionString %>"
            ID="sqlRegional"  ProviderName="<%$ ConnectionStrings:autoConnectionString.ProviderName %>"
            runat="server" 
            SelectCommand="Select * from StockCountries order by CountryName">
        </asp:SqlDataSource>
        <asp:ObjectDataSource ID="dsShowroom" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.vSHOWROOMTableAdapter">
        </asp:ObjectDataSource>
        <asp:SqlDataSource ID="dsModel" runat="server" __designer:wfdid="w2" SelectCommand="SELECT [MODEL] FROM [vMODEL]"
            ConnectionString="<%$ ConnectionStrings:autoConnectionString %>" ProviderName="<%$ ConnectionStrings:autoConnectionString.ProviderName %>"
            DataSourceMode="DataReader"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCountry" runat="server" __designer:wfdid="w2" SelectCommand="SELECT [country_name], [code] FROM [vMakeCountry]"
            ConnectionString="<%$ ConnectionStrings:autoConnectionString %>" ProviderName="<%$ ConnectionStrings:autoConnectionString.ProviderName %>"
            DataSourceMode="DataReader"></asp:SqlDataSource>
        <asp:HiddenField ID="Hupdate_Flag" runat="server" Value="0" />
        <asp:ObjectDataSource ID="vmake" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.make_nocountTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="vmakecategory" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.vMakeCategoryTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="vfuel" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.vFuelTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="vGlobalLocation" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.GlobalLocationTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="vColor" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.vCOLORTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsMakeDetails" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="getMakeModelNames" TypeName="masterdataTableAdapters.tblmake_detailsTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCountry" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.tblcountryTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCatType" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="getVehType_all" TypeName="dsStockTableAdapters.Get_VehTypeAdminTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsLOC" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.tblCar_LocationTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsImportType" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="masterdataTableAdapters.Select_ImportTypeTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCurrency" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="masterdataTableAdapters.currency_masterTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_currency_ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="currency_name" Type="String" />
                <asp:Parameter Name="currency_short_name" Type="String" />
                <asp:Parameter Name="Original_currency_ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="currency_ID" Type="Int32" />
                <asp:Parameter Name="currency_name" Type="String" />
                <asp:Parameter Name="currency_short_name" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsstock_type" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataBy" TypeName="masterdataTableAdapters.display_typeTableAdapter"
            DeleteMethod="Delete" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="display_type" Type="String" />
                <asp:Parameter Name="Original_ID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
