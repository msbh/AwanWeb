<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="SalesTeams2.aspx.vb" Inherits="SalesTeams2" Title="Arif Rauf | Managing Director-Japan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="myform">
        <ul class="myform_heading">
              <%=appdata.GetLanguageString("saleteams.heading")%>
        <ul class="myform_line">
        </ul>
        <img class="abouticon" alt="" src="images/awanstaff/arif.png"  style="border: 0px;
            width: 223px; height: 236px;">
        <p class="class"><%=appdata.GetLanguageString("ARIFRAUFINFO")%></p>
        </ul>
        <div class="span-4 append-1">
            <ul id="bankdetails_menu">
              
                <li><span> <%=appdata.GetLanguageString("Name")%>:</span></li>
                <li><span> <%=appdata.GetLanguageString("Title")%>:</span></li>
                <li><span> <%=appdata.GetLanguageString("Email")%>:</span></li>
                <li><span> Skype</span></li>
                <li><span> <%=appdata.GetLanguageString("Mobile")%>:</span></li>
                <li><span> <%=appdata.GetLanguageString("Language")%>:</span></li>
                
            </ul>
        </div>
        <div class="span-4 last">
            <ul id="bankdetails2_menu">
            <li><b><span>Arif Rauf</span></b></li>
            <li><span><%=appdata.GetLanguageString("ManagingDirector")%></span></li>
            <li><span><b>arifawanjp@yahoo.com</b> </span></li>
            <li><span><b>arifarif6423</b></span></li>
            <li><span><b>00818042528786</b></span></li>
            <li><b><%=appdata.GetLanguageString("LanguagesArif")%></b></li>
            </ul>
        </div>
    </div>
</asp:Content>
