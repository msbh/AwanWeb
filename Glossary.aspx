<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="Glossary.aspx.vb" Inherits="Glossary" Title="Awan International K.K | Glossary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div id="myform">
    <div>
    
  
    
         
               <%=appdata.GetLanguageString("glossary1")%>
         
        <ul class="myform_line">
        </ul>
        </div>
    <div id="main_Content">
    
    
       <div>
         <%=appdata.GetLanguageString("glossary2")%>
       </div>
       
       
       
       
       
       <div>
         <%=appdata.GetLanguageString("glossary3")%>
       
       </div>
       
       
       
         <div>
         <%=appdata.GetLanguageString("glossary4")%>
       
       </div>
    </div>
    
    
    
    
    
    
 </div>
</asp:Content>
