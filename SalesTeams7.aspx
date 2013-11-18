<%@ Page Title="Kamran Rauf | Head of Operations - Pakistan" Language="VB" MasterPageFile="~/MasterPage2.master"
 AutoEventWireup="false" CodeFile="SalesTeams7.aspx.vb" Inherits="SalesTeams7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div id="myform">
        <ul class="myform_heading">
          <%=appdata.GetLanguageString("saleteams.heading")%>
          <ul class="myform_line">    
          
 
  </ul>  
   <img class="abouticon" alt="" src="images/awanstaff/kamran.png" style="border: 0px;
            width: 223px; height: 236px;">
       
       
        <p class="class">

         <%=appdata.GetLanguageString("kamranraufinfo")%>
      
        </p>
        
        
        </ul>
        <div class="span-4 append-1">
            <ul id="bankdetails_menu">
                <li><span> <%=appdata.GetLanguageString("Name")%>:</span></li>
                <li><span> <%=appdata.GetLanguageString("Title")%>:</span></li>
                <li><span> <%=appdata.GetLanguageString("Email")%>:</span></li>
                <li><span><%=appdata.GetLanguageString("Skype")%></span></li>
                <li><span> <%=appdata.GetLanguageString("Mobile")%>:</span></li>
                <li><span> <%=appdata.GetLanguageString("Language")%>:</span></li>
               
                
            </ul>
        </div>
        <div class="span-4 last">
            <ul id="bankdetails2_menu">
            
        <li><span><b>Kamran Rauf</b></span></li>
                <li><b><span style="width:300px;"> Head of Operations - Pakistan</b></span></li>
                <li><b><span>kamran@awan.co.jp</span></b></li>
                <li><b><span>perzada.kamran1</span></b></li>
                <li><b><span>+92-0346-2435424 </span></b></li>
               <li><b><span style="width:300px;"><%=appdata.GetLanguageString("kamranrauflanguage")%></span></b></li>
            
                
            </ul>
        </div>
    </div>
</asp:Content>

