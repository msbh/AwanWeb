<%@ Page Title="Noman Rauf | Sales Manager Pakistan" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" 
CodeFile="SalesTeams6.aspx.vb" Inherits="SalesTeams6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div id="myform">
        <ul class="myform_heading">
          <%=appdata.GetLanguageString("saleteams.heading")%>
          <ul class="myform_line">    
          
 
  </ul>  
   <img class="abouticon" alt="" src="images/awanstaff/NomanRauf.png" style="border: 0px;
            width: 223px; height: 236px;">
       
       
        <p class="class">

         <%=appdata.GetLanguageString("NomanRaufInfo")%>
      
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
            
        <li><span><b> <%=appdata.GetLanguageString("NomanRaufName")%></b></span></li>
                <li><b><span style="width:300px;"> <%=appdata.GetLanguageString("NomanRaufTitle")%></b></span></li>
                <li><b><span>sales_pk@awan.co.jp</span></b></li>
                <li><b><span>nominomi80</span></b></li>
                <li><b><span>+92-308-2762200</span></b></li>
               <li><b><span style="width:300px;">English,Urdu and French</span></b></li>
         
                
            </ul>
        </div>
    </div>
</asp:Content>

