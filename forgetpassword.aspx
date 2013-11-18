<%@ Page Title="Awan International K.K | Password Recovery " Language="VB" 

MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" 

CodeFile="forgetpassword.aspx.vb" Inherits="forgetpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="myform"> 

  <ul class="myform_heading">
         <%=appdata.GetLanguageString("PasswordRecovery")%>
        </ul>
        <ul class="myform_line">
        </ul>
        
        <div class="content" >   
            <p>
                 <%=appdata.GetLanguageString("ProvideYourEmail")%>
                <asp:TextBox ID="TextBox1" runat="server" Width="271px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnRecoverPassword" runat="server" Text="Recover Password" />
            </p>
            <p>
            </p>
            <p>
                <ul>
                    <asp:ValidationSummary ID="valsummary" runat="server" CssClass="infomessages" DisplayMode="List">
                    </asp:ValidationSummary>
                </ul>
            </p>
    
    
    </div>
    
    


</div>





</asp:Content>

