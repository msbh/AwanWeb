<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" 
CodeFile="TermsandConditions.aspx.vb" Inherits="TermsandConditions" 
title="Awan International K.K | Terms & Condition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="myform">
      <div>
      <%=appdata.GetLanguageString("TermsandConditions1")%>
      </div>
    
    
    <div>
    <div>
         <%=appdata.GetLanguageString("TermsandConditions2")%>
    </div>
    
   <div>
         <%=appdata.GetLanguageString("TermsandConditions3")%>
    </div>
    
    <div>
         <%=appdata.GetLanguageString("TermsandConditions4")%>
    </div>
    
    <div>
         <%=appdata.GetLanguageString("TermsandConditions5")%>
    </div>
    
    </div>
    
    </div>

</asp:Content>

