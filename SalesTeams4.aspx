<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="SalesTeams4.aspx.vb" Inherits="SalesTeams4" Title="Mohammed Awais | Managing Director-Russia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="myform">
        <ul class="myform_heading">
             <%=appdata.GetLanguageString("saleteams.heading")%>
            
            </ul>
        <ul class="myform_line">
        </ul>
        <img class="abouticon" alt="" src="images/awanstaff/awais.png"  style="border: 0px;
            width: 223px; height: 236px;">
        <p class="class">
        
        <%=appdata.GetLanguageString("MohammadAwaisInfo")%>
      
         
         
   
                        
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
                <li><span><b>Mohammed Awais Malik  </b></span></li>
                <li><span><b><% =appdata.GetLanguageString("MohammadAwaisTitle")%> </b></span></li>
                <li><span><b>malik021@yahoo.com </b></span></li>
                <li><span><b>awaisawais207 </b></span></li>
                <li><span><b>00996709445446</b></span></li>
                 <li><span><b><% =appdata.GetLanguageString("MohammadAwaisLanguages")%><b> </span></li>
            </ul>
        </div>
    </div>
</asp:Content>
