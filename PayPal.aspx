﻿<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
 CodeFile="PayPal.aspx.vb" Inherits="PayPal" title="- Paypal payment interface -" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="myform">

<ul class="myform_heading">
<%=appdata.GetLanguageString("paypal.heading")%>

</ul>
<ul class="myform_line"></ul>
 <table width="990" border="0" cellpadding="0" cellspacing="0" align="center" >

 
 <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
 
 <table width="520px" style="border-color:#CCC; border-style:solid; border-width:1px;">

                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                               runat="server" ValidationGroup="form"
                              ControlToValidate="txtFirstName" Display="Dynamic"
                               ErrorMessage="FirstName required">
                               </asp:RequiredFieldValidator> 
                                 
                               runat="server" ValidationGroup="form"
                              ControlToValidate="txtlastName" Display="Dynamic"
                               ErrorMessage="LastName required">
                               </asp:RequiredFieldValidator> 
   <tr>
 <tr>
 	   <tr>
                                         <td colspan="2" style="text-align:right"><strong style=" margin-right: 0px;"><%=appdata.GetLanguageString("paypalExample")%><br>
                                        
                                       </tr>
                                       <tr>
                                         <td height="22"></td>
                                         <td height="22" valign="top">
                                         <input type="submit" value="Pay" ValidationGroup="form" class="js_a" border="0" name="I5" alt="Make payments with PayPal - it's fast, free and secure!" align="left" /></td>
                                       </tr>
 
 
 
 </table>
 
 </form>
 </td>
 
 
 
 
 
 </table>
</div>

</asp:Content>
