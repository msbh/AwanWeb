<%@ Page Title="Awan International K.K | Login Page" Language="VB" MasterPageFile="~/MasterPage2.master"
    AutoEventWireup="false" CodeFile="LoginPage.aspx.vb" Inherits="LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div id="myform">
        <ul class="myform_heading">
      <%=appdata.GetLanguageString("loginpages.heading")%>
      </ul>
        <ul class="myform_line">
        </ul>
        <%--<div class="content">
            <center class="js_a">
               <%=appdata.GetLanguageString("loginpages.heading1")%>
                <br />
                <br />
                <br />
            </center>
            <center>
                <asp:Login ID="Login1" runat="server" Width="309px">
                    <LayoutTemplate>
                        <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2">
                                               <%=appdata.GetLanguageString("loginpages.LogInlable")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName"> <%=appdata.GetLanguageString("loginpages.emaillable")%></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server" MaxLength="50"  style="margin-left: 40px; margin-bottom: 9px;"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password"  style="margin-left: -10px; margin-right: 11px;"> <%=appdata.GetLanguageString("loginpages.passwordlable")%></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="15" style="margin-bottom: 8px;"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                           
                                            
                                            
                                            <td>
                                                <asp:Button ID="Button1" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1"
                                                    OnClick="LoginButton_Click" style="margin-bottom: 7px;"/>
                                            </td>
                                            
                                            
                                            <td>
                                            
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:100px;" >
                                               
                                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time."  
                                                    Width="300px" />
                                            </td>
                                            
                                            
                                            <td>
                                             
                                            
                                            </td>
                                        </tr>
                                        <tr>
                                           
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forgetpassword.aspx" style="margin-right: 186px; width: 255px; margin-left: 18px;"><%=appdata.GetLanguageString("loginpages.Forgetpassworlable")%> </asp:HyperLink>
                                            
                                            
                                            <td>
                                                
                                            </td>
                                            
                                            
                                            <td>
                                            
                                            </td>
                                        </tr>
                                        
                                        
                                        <tr>
                                            <td align="center" colspan="2" style="color: Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:Login>
            </center>
        </div>--%>
        
        <div class="content">
            <center class="js_a">
               <%=appdata.GetLanguageString("loginpages.heading1")%>
                <br />
                <br />
                <br />
            </center>
            
            
           
            
            <center>
       <asp:Login ID="Login1" runat="server">
           <LayoutTemplate>
               <table border="0" cellpadding="1" cellspacing="0" 
                   style="border-collapse:collapse;">
                   <tr>
                       <td>
                           <table border="0" cellpadding="0">
                               <tr>
                                   <td align="right">
                                     <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" style="margin-right: 40px;"> <%=appdata.GetLanguageString("loginpages.emaillable")%></asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="UserName" runat="server" ></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                           ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                           ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                               <tr>
                                   <td align="right">
                                           <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password"  style="margin-left: -10px; margin-right: 11px;"> <%=appdata.GetLanguageString("loginpages.passwordlable")%></asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                           ControlToValidate="Password" ErrorMessage="Password is required." 
                                           ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                               <tr>
                                   <td colspan="2">
                                       <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                   <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forgetpassword.aspx"><%=appdata.GetLanguageString("loginpages.Forgetpassworlable")%> </asp:HyperLink>
                                  
                                   </td>
                                   
                               </tr>
                               
                              
                                    
                               
                               
                               <tr>
                                   <td align="center" colspan="2" style="color:Red;">
                                       <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                   </td>
                               </tr>
                               <tr>
                                   <td align="right" colspan="2">
                                       <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                           ValidationGroup="Login1"  />
                                   </td>
                               </tr>
                           </table>
                       </td>
                   </tr>
               </table>
           </LayoutTemplate>
       </asp:Login>
        </center>
        
         </div>
        
    </div>
</asp:Content>
