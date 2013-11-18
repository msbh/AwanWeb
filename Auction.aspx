<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="Auction.aspx.vb" Inherits="Auction" Title="Auction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div id="myform">
  

   <div>
   
   <%=appdata.GetLanguageString("auction1")%>
   </div>
   
      <div>
   
   <%=appdata.GetLanguageString("auction2")%>
   </div>
   
  
    </div>
  
</asp:Content>
