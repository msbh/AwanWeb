<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" 
CodeFile="AwanInter.aspx.vb" Inherits="AwanInter" title="Why Awan International ?" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="myform">
        <ul class="myform_heading">
           <%-- <span style="color: #F0F0F0">Why Awan </span>International K.K</ul>
        <ul class="myform_line">--%>
        
           <%=appdata.GetLanguageString("AwanInter.heading")%>
        
        </ul>
        <div>
           
            <%=appdata.GetLanguageString("AwanInter.content")%>
        </div>
    </div>
</asp:Content>

