<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="SalesTeams5.aspx.vb" Inherits="SalesTeams5" 
    Title="Mohammad Al Khawaja Jan Hakim | Managing Director - Dubai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



<div id="myform">
        <ul class="myform_heading">
        
            <%=appdata.GetLanguageString("saleteams.heading")%>

            </ul>
        <ul class="myform_line">
        </ul>
        <img class="abouticon" alt="" src="images/awanstaff/khawaja.png"  style="border: 0px;
            width: 223px; height: 236px;">
        <p class="class">
          <%=appdata.GetLanguageString("MohammadalKhawajaInfo")%>
    
      
        </p>
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
                <li><span style="width:300px;"><b>Mohammad Al Khawaja Jan Hakim</b></span></li>
                <li><span style="width:300px;"><b><%=appdata.GetLanguageString("MohammadalTitle")%></b></span></li>
                <li><span><b>decan786@hotmail.com </b></span></li>
                <li><span><b>nickpain1984  </b></span></li>
                <li><span><b>00971-50-4655577</b></span></li>
                <li><span style="width:300px;"><b><%=appdata.GetLanguageString("MohammadalTitleLanguage")%></b></span></li>
                
            </ul>
        </div>
    </div>
</asp:Content>
