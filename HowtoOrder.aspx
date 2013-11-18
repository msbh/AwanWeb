<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" 
CodeFile="HowtoOrder.aspx.vb" Inherits="HowtoOrder" 
title="Awan International K.K | How to Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="myform">
    <div>
        <ul class="myform_heading">
               
           <%=appdata.GetLanguageString("howorder8")%>
        <ul class="myform_line">
        </ul>
    </div>
    
        <div>
        <div>
        
           
           <%=appdata.GetLanguageString("howorder1")%>
            </div>
            
            
            <div>
             <%=appdata.GetLanguageString("howorder2")%>
             </div>
             <div>
              <%=appdata.GetLanguageString("howorder3")%>
             </div>
             <div>
            <%=appdata.GetLanguageString("howorder4")%>
             </div>
             
             
            <div>
            
            <%=appdata.GetLanguageString("howorder5")%>
             
             
             </div>
            
  
             <div>
                 <%=appdata.GetLanguageString("howorder6")%>
   
            </div>
            
            <div>
               <%=appdata.GetLanguageString("howorder7")%>
            
            </div>
      </div>
      </div>
 </div>
</asp:Content>


