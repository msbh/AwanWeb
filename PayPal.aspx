<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
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

 <td align="center">
 <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
 
 <table width="520px" style="border-color:#CCC; border-style:solid; border-width:1px;">
  <tr> <td style="text-align:right"><strong><%=appdata.GetLanguageString("FirstName")%></strong></td> <td><asp:TextBox ID="txtFirstName" runat="server" style="width:272px" ></asp:TextBox></td> 
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                               runat="server" ValidationGroup="form"
                              ControlToValidate="txtFirstName" Display="Dynamic"
                               ErrorMessage="FirstName required">
                               </asp:RequiredFieldValidator> 
                                   </tr> <tr> <td style="text-align:right"><strong><%=appdata.GetLanguageString("LastName")%>&nbsp;</strong></td><td ><asp:TextBox ID="txtlastName" runat="server" style="width:272px" ></asp:TextBox></td> </tr> <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                               runat="server" ValidationGroup="form"
                              ControlToValidate="txtlastName" Display="Dynamic"
                               ErrorMessage="LastName required">
                               </asp:RequiredFieldValidator> 
   <tr><td style="text-align:right"><strong><%=appdata.GetLanguageString("paypalPaymentfor")%> </strong></td><td><textarea rows="4" name="item_name" style="width:270px; font-size:13px;"></textarea></td> </tr>
 <tr><td style="text-align:right"><strong><%=appdata.GetLanguageString("AMOUNT")%></strong></td> <td><input type="text" name="first_name" value="" style="width:272px" /></td>                                        </tr>
 	   <tr>
                                         <td colspan="2" style="text-align:right"><strong style=" margin-right: 0px;"><%=appdata.GetLanguageString("paypalExample")%><br>                                         </strong><%=appdata.GetLanguageString("paypalExample2")%></td>
                                        
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

