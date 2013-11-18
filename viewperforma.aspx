<%@ Page Title="View performa Invoice" Language="VB" MasterPageFile="~/MasterPage2.master" 
AutoEventWireup="false" CodeFile="viewperforma.aspx.vb" Inherits="viewperforma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
             width:100%; border:0; 
             
        }
        .style2
        {
            width: 239px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="myform">
    <h1 class="myform_heading">
        <span class="myform_span">Performa Invoice </span>
    </h1>
    <ul class="myform_line">
    </ul>
  
    <div class="content">
   
 
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Quote_ID" DataSourceID="odsTemFinalize">
            <ItemTemplate>
                <center class="js_a" style="margin: 4px;">
                
                 <a href="stockList.aspx?lv=1">Stock List </a>
                    <a href="performaList.aspx">Performa List </a>
                    
                    
                    <asp:LinkButton ID="lnkaccept" runat="server" onclick="lnkaccept_Click">Accept</asp:LinkButton>
                     <asp:LinkButton ID="lnkreject" runat="server" onclick="lnkreject_Click">Reject</asp:LinkButton>     
                          
                     <a href="reports/PerformaInvPrint.aspx?id=<%# Eval("perfInvoice_ID") %>&stkid=<%# Eval("stock_ID") %>"  target="_blank" >
                        Print </a>
                        
                        
                        
                        
                </center>
               
                <table border="1" style="color: #FFFFFF">
                    <tbody>
                        <tr>
                            <td>
                                <table class="style1" align="right">
                                    <tr>
                                        <td>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo1.png" ImageAlign="Left" />
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td align="right" style="font-size: 18px; font-weight: bold; color: #FFFFFF;" valign="middle">
                                            PERFORMA INVOICE
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <b>Awan International K.K </b>
                                        </td>
                                        <td align="left">
                                            &nbsp;</td>
                                        <td align="right">
                                            Perf. Invoice Date:<asp:Label ID="lblperformadate" runat="server" Text='<%# Eval("perfInvoice_Date") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <i>Deals in Japenese Used Cars </i>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td align="right">
                                            Quote Ref:<asp:Label ID="lblquoteref" runat="server" Text='<%# Eval("perfInv_Ref") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <b>Address: </b>
                                        </td>
                                        <td>
                                            939-0304 Toyamaken Imizu shi Kosugi shiraishi 138-1
                                        </td>
                                        <td>
                                            Status:&nbsp;
                                        </td>
                                        <td>
                                            &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="15px" 
                                                Text='<%# Eval("LegendName") %>'></asp:Label>
&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Phone :</b>
                                        </td>
                                        <td>
                                            (+81) 804-2528-786&nbsp;&nbsp;&nbsp; <b>Fax: </b>( +81) 766598750
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Email: </b>
                                        </td>
                                        <td>
                                            info@awan.co.jp
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>County: </b>
                                        </td>
                                        <td>
                                            Japan
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            To:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblfirstnamecon" runat="server" Text='<%# Eval("FirstName_Con") %>'></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td align="right" class="style2">
                                            Ship To:
                                        </td>
                                        <td>
                                            <asp:Label ID="lblfirstnameNOT" runat="server" Text='<%# Eval("FirstName_Not") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblphone" runat="server" Text='<%# Eval("Phone_Con") %>'></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td class="style2">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblphoneNOT" runat="server" Text='<%# Eval("Phone_Not") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("Email_Con") %>'></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td class="style2">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblemailNOT" runat="server" Text='<%# Eval("Email_Not") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lbladdress" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td class="style2">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lbladdressNOT" runat="server" Text='<%# Eval("Address_Not") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblconsigneecity" runat="server" Text='<%# Eval("City_Con") %>'></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td class="style2">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblcityNOT" runat="server" Text='<%# Eval("City_Not") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblcountry" runat="server" Text='<%# Eval("Country_Con") %>'></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td class="style2">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblcountryNOT" runat="server" Text='<%# Eval("Country_Not") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td class="style2">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <b>SALES MAN</b>
                                            </td>
                                            <td>
                                                <b>PORT OF LOADING </b>
                                            </td>
                                            <td>
                                                <b>PORT OF DISCHARGE </b>
                                            </td>
                                            <td>
                                                <b>PAYMENT TERMS </b>
                                            </td>
                                            <td>
                                                <b>DUE DATE </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblsalesman" runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblportofloading" runat="server" Text='<%# Eval("portName") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblportofdesc" runat="server" Text='JAPAN'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblpaymentterms" runat="server" Text='<%# Eval("paymentmodeTEXT") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblduedate" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                       
                       
                        <tr>
                            <td valign="top" align="left">
                                <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <table width="98%" cellspacing="0" cellpadding="8" bordercolor="#ffffff" border="1"
                                                    align="center" class="smallblack" style="border-collapse: collapse">
                                                    <tbody>
                                                        <tr height="33" bgcolor="#8F8E85">
                                                            <td width="6%" align="center">
                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff" style="font-size: 10px;">
                                                                    PHOTO</font>
                                                            </td>
                                                            <td width="53%" align="center">
                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff" style="font-size: 10px;">
                                                                    STOCK DETAIL</font>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff" style="font-size: 10px;">
                                                                    QUANTITY</font>
                                                            </td>
                                                            <td width="15%" align="center">
                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff" style="font-size: 10px;">
                                                                    AMOUNT []</font>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <img width="100" border="1" src="http://www.awan.co.jp/cars_images/<%# Eval("IMAGE1") %>">
                                                            </td>
                                                            <td align="left">
                                                                <table width="100%" cellspacing="0" border="0" align="center" style="font-size: 10px;
                                                                    color: #FFFFFF; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td width="120" align="left">
                                                                                STOCK NO
                                                                            </td>
                                                                            <td width="15">
                                                                                :
                                                                            </td>
                                                                            <td>
                                                                                <b>
                                                                                    <asp:Label ID="lblstockno" runat="server" Text='<%# Eval("FILE_REF") %>'></asp:Label></b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                MAKE
                                                                            </td>
                                                                            <td>
                                                                                :
                                                                            </td>
                                                                            <td>
                                                                                <b>
                                                                                    <asp:Label ID="lblMake" runat="server" Text='<%# Eval("make") %>'></asp:Label></b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                MAKE CATEGORY
                                                                            </td>
                                                                            <td>
                                                                                :
                                                                            </td>
                                                                            <td>
                                                                                <b>
                                                                                    <asp:Label ID="lblMakeCategory" runat="server" Text='<%# Eval("MAKE_CATEGORY") %>'></asp:Label></b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                CHASSIS NO
                                                                            </td>
                                                                            <td>
                                                                                :
                                                                            </td>
                                                                            <td>
                                                                                <b>
                                                                                    <asp:Label ID="lblChassis_no" runat="server" Text='<%# Eval("CHASSIS_NO") %>'></asp:Label></b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                YEAR
                                                                            </td>
                                                                            <td>
                                                                                :
                                                                            </td>
                                                                            <td>
                                                                                <b>
                                                                                    <asp:Label ID="lblYear" runat="server" Text='<%# Eval("MODEL") %>'></asp:Label>
                                                                                </b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                STEERING
                                                                            </td>
                                                                            <td>
                                                                                :
                                                                            </td>
                                                                            <td>
                                                                                <b>
                                                                                    <asp:Label ID="lblDrive" runat="server" Text='<%# Eval("DRIVE") %>'></asp:Label></b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="10" align="left">
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                INSPECTION CERT.
                                                                            </td>
                                                                            <td>
                                                                                :
                                                                            </td>
                                                                            <td>
                                                                                <b>
                                                                                    <asp:Label ID="lblinspection" runat="server" Text='<%# Eval("Inspection_Amt") %>'></asp:Label></b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="10" align="left">
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                            <td valign="top" align="center" style="padding-top: 80px;">
                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="White" style="font-size: 10px;">
                                                                    1</font>
                                                            </td>
                                                            <td valign="top" align="right" style="padding-top: 70px; padding-right: 20px;">
                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="White" style="font-size: 10px;">
                                                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                                                    []<br>
                                                                    <br>
                                                                    <asp:Label ID="lblInsAmt" runat="server" Text='<%# Eval("Inspection_Amt") %>'></asp:Label>
                                                                    []<br>
                                                                    <br>
                                                                </font>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <table width="98%" cellspacing="0" cellpadding="0" border="0" align="center">
                                                    <tbody>
                                                        <tr>
                                                            <td width="58%" valign="top" align="right">
                                                                <table width="100%" cellspacing="0" cellpadding="0" align="center">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td width="200" height="5" align="center">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <table width="100%" cellspacing="0" cellpadding="5" align="center" style="border: #ffffff 1px solid;">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td height="20" bgcolor="#8F8E85" align="center">
                                                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff" style="font-size: 10px;">
                                                                                                    BANK DETAILS</font>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="1" bgcolor="#000000" style="padding: 0px;">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="40" align="left">
                                                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff" style="font-size: 10px;">
                                                                                                    Bank Name: BANK OF TOKYO -MITSUBISHI UFJ<br>
                                                                                                    Bank Address: 2 -23-25 KOURINBOU, KANAZAWA, JAPAN
                                                                                                    <br>
                                                                                                    Branch Name: KANAZAWA BRANCH
                                                                                                    <br>
                                                                                                    Account Name: AWAN INTERNATIONAL K.K.
                                                                                                    <br>
                                                                                                    Account Number: 0687182<br>
                                                                                                    Swift Code: BOTKJPJT<br>
                                                                                                    Reason For Remittance: Payment for Motor Vehicle and/or Vehicle Parts</font></td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="30" align="left">
                                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff" style="font-size: 10px;">
                                                                                    <br>
                                                                                    Note:
                                                                                    <br>
                                                                                    All bank charges are the responsibility by purchaser.<br>
                                                                                    The name &amp; address, phone no shows on this invoice will be on B/L, Please advise
                                                                                    us if any changes before shipping</font></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                            <td width="42%" valign="top" align="right">
                                                                <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td width="2%">
                                                                            </td>
                                                                            <td align="center">
                                                                                <table width="100%" cellspacing="0" cellpadding="0" align="center" style="border: #ffffff 1px solid;
                                                                                    border-top: none;">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td width="200" height="30" bgcolor="#8F8E85" align="center">
                                                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff" style="font-size: 10px;">
                                                                                                    TOTAL AMOUNT DUE:</font>
                                                                                            </td>
                                                                                            <td width="1">
                                                                                            </td>
                                                                                            <td width="45%" align="right" style="padding-right: 25px">
                                                                                                <font face="Verdana, Arial, Helvetica, sans-serif" style="font-size: 10px;" color="White">
                                                                                                    <asp:Label ID="lbltotalAmount" runat="server" Text='<%# Eval("TTL_Amount") %>'></asp:Label>
                                                                                                    [] </font>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td height="10" colspan="3">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="border-bottom: none;">
                                                                            </td>
                                                                            <td align="center">
                                                                                <table width="100%" cellspacing="0" cellpadding="0" align="center" style="border: #ffffff 1px solid;">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td width="200" height="30" bgcolor="#4FA5FC" align="center">
                                                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff" style="font-size: 10px;">
                                                                                                    DUE DATE</font>
                                                                                            </td>
                                                                                            <td width="1" bgcolor="#000000">
                                                                                            </td>
                                                                                            <td width="45%" align="right" style="padding-right: 25px">
                                                                                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" style="font-size: 10px;">
                                                                                                </font>
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
                                                <table width="100%" cellspacing="0" cellpadding="2" border="0" align="center">
                                                    <tbody>
                                                        <tr>
                                                            <td width="100%">
                                                                <table width="100%" cellspacing="0" cellpadding="2" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td width="40%">
                                                                            </td>
                                                                            <td>
                                                                                <table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-size: 10px;
                                                                                    font-family: Verdana, Arial, Helvetica, sans-serif; font-color: #ffffff">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td height="40" align="right" colspan="3">
                                                                                                <img border="0" src="images/logo1.png">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="15" colspan="3">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="3">
                                                                                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td width="34%">
                                                                                                            </td>
                                                                                                            <td width="50%" style="border-top: 1px solid #fff">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="3">
                                                                                                <table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-size: 10px;
                                                                                                    font-family: Verdana, Arial, Helvetica, sans-serif; font-color: #ffffff; color: #FFFFFF;">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td width="35%">
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                            <td width="35%" align="center">
                                                                                                                Authorized Signature
                                                                                                            </td>
                                                                                                            <td width="15">
                                                                                                                :&nbsp;
                                                                                                            </td>
                                                                                                            <td width="25%" align="left" colspan="3">
                                                                                                                <b></b>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td height="3" colspan="3">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                &nbsp;
                                                                                                            </td>
                                                                                                            <td align="center" colspan="2">
                                                                                                                &nbsp;&nbsp;&nbsp;&nbsp;Awan International K.K
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="20" colspan="3">
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
                    </tbody>
                </table>
            </ItemTemplate>
        </asp:FormView>
    </div>
          </div>
           
            <asp:ObjectDataSource ID="odsTemFinalize" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" 
        TypeName="membersTableAdapters.perfinvoiceTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="perfinvoice_ID" QueryStringField="ID" 
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
</asp:Content>

