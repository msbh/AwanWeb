<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="ContactUs.aspx.vb" Inherits="ContactUs" Title="Awan International K.K | Contact Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .greenborder
        {
            width: 970px;
            border-radius: 15px 15px 15px 15px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            padding: 5px;
            border: 8px solid #413E3E;
            behavior: url(ie-css3.htc);
            background-color: rgb(27, 26, 26);/*-box-shadow: 10px 10px 5px #888;
            -moz-box-shadow: 10px 10px 5px #888;
            -webkit-box-shadow: 10px 10px 5px #888;*/
        }
        
        
        
        /*.fillborder
        {
            border-radius: 15px 15px 15px 15px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;            
            border: 5px;
            behavior: url(ie-css3.htc);
          
        }/*
</style>
    <div id="myform" style="margin-left: 42px;">
        <ul class="myform_heading">
            <%=appdata.GetLanguageString("ContactUs.heading")%> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;  
                  <a href="http://facebook.com/awanint" target="_blank"><img src="images/facebook.png" title="Facebook" style="width:39px;height:39px"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="https://instagram.com/awanintjp" target="_blank"><img src="images/instagram.png" title="Instagram" style="width:39px;height:39px"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="http://www.linkedin.com/company/3350056" target="_blank"><img src="images/linkedin.png" title="Linkedin" style="width:39px;height:39px"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#" target="_blank"><img src="images/twitter.png" title="Twitter" style="width:39px;height:39px"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#" target="_blank"><img src="images/youtube.png" title="Youtube" style="width:39px;height:39px"/></a>
        </ul>
        <ul class="myform_line">
        </ul>
        <div style="clear: both; height: 5px;">
        </div>
        <div class="greenborder">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 260px;" valign="middle">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 32px;padding-top:8px;padding-left:2px;padding-right:4px;" valign="middle">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="images/CountryFlags/Japan.gif" style="width:30px;height:25px;" />
                                </td>
                                <td>
                                    <h2 class="top-heading">
                                        Japan</h2>
                                    <b>(Head Office)</b>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                        </table>
                    </td>
                    <td style="padding: 5px; width: 520px;">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Address</h4>
                                    <span class="normal">939-0304 Toyamaken Imizu shi Kosugi shiraishi 138-1 
Japan
</span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Phone ( Office ) 
                                    </h4>
                                    <span class="normal">(+81) 766-59-8751 </span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Phone ( Mobile ) </h4>
                                    <span class="normal">(+81) 90-3091-3914 ,  (+81) 804-2528-786</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="padding: 5px; width: 150px;">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Fax</h4>
                                    <span class="normal">(+81) 766598750</span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Email
                                    </h4>
                                    <span class="normal">info@awan.co.jp</span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Skype</h4>
                                    <span class="normal">awanintjp</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div style="clear: both; height: 20px;">
        </div>
        <div class="greenborder">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 260px;" valign="middle">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 32px;padding-top:8px;padding-left:2px;padding-right:4px;" valign="middle">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="images/CountryFlags/UAE.gif" style="width:30px;height:25px;" />
                                </td>
                                <td>
                                    <h2 class="top-heading">
                                        U.A.E</h2>
                                    <b>Tambiri Motors FZD , Dubai</b>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                        </table>
                    </td>
                    <td style="padding: 5px; width: 520px;">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Address</h4>
                                    <span class="normal">Showroom # 123 , DUCUMZ , Al-Aweer , RAS-AL-KHOR 92588 , Dubai , U.A.E </span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Phone ( Office ) 
                                    </h4>
                                    <span class="normal">+971-43338560</span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Phone ( Mobile ) </h4>
                                    <span class="normal">+971-508561527 , +971-558861527</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="padding: 5px; width: 150px;">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Fax</h4>
                                    <span class="normal">+971-43338570</span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Email
                                    </h4>
                                    <span class="normal">wanitmb1@gmail.com</span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Skype</h4>
                                    <span class="normal">wani000</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div style="clear: both; height: 20px;">
        </div>
        <div class="greenborder">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 260px;" valign="middle">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 32px;padding-top:8px;padding-left:2px;padding-right:4px;" valign="middle">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="images/CountryFlags/Kyrgyzstan.gif" style="width:30px;height:25px;"/>
                                </td>
                                <td>
                                    <h2 class="top-heading">
                                        KYRGYSTAN</h2>
                                    <b>AWAN TRADERS LTD</b>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                        </table>
                    </td>
                    <td style="padding: 5px; width: 520px;">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Address</h4>
                                    <span class="normal">жибек-жолу 406,пересекает лермонтова</span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Phone ( Office ) 
                                    </h4>
                                    <span class="normal"> +996312899058</span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Phone ( Mobile ) </h4>
                                    <span class="normal">+996709445446 , +9965532222916</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="padding: 5px; width: 150px;">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Fax</h4>
                                    <span class="normal">+996312899058</span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Email
                                    </h4>
                                    <span class="normal">awanint@mail.ru</span>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <h4 class="bottom-heading">
                                        Skype</h4>
                                    <span class="normal">awan.bishkek</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div style="clear: both; height: 20px;">
        </div>
    </div>
</asp:Content>
