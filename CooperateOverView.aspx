<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="CooperateOverView.aspx.vb" Inherits="CooperateOverView" 
    Title="Awan International K.K | Cooperative Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="myform">
      
       <div>
        <%=appdata.GetLanguageString("cooperteoverview1")%>
       </div>     
            
   <div id="content">
   <div>
    <%=appdata.GetLanguageString("cooperteoverview2")%>
   </div>
   
   
    <div class="clear"> </div>
            
     <div>
    <%=appdata.GetLanguageString("cooperteoverview3")%>
   </div>
   
      <div class="clear"> </div>
      
      
    <div>
    <%=appdata.GetLanguageString("cooperteoverview4")%>
   </div>
   
   
   
    <div>
    <%=appdata.GetLanguageString("cooperteoverview5")%>
   </div>
   
   </div>
           
           
           
   </div>
</asp:Content>
