<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" 
CodeFile="bankdetails.aspx.vb" Inherits="bankdetails" 
title="Awan International K.K | Bank Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="myform">
    <ul class="myform_heading">
    <%=appdata.GetLanguageString("bankdetails.heading")%>
    
    
   
    
    <img src="images/bankicon.png" alt="" class="ShippingInfo-img2">
    </ul>
    <ul class="myform_line"></ul>


 <table>
        <tr>
            <td>
                <table class="banktb">
                    <tr>
                        <td class="banktb_top">
                            &nbsp;
                            JAPAN</td>
                        <td align="center">
                            <asp:Image ID="Image2" runat="server" ImageUrl="images/japan1.png" />
                        </td>
                    </tr>
                </table>
            </td>
              <td>
                <table class="banktb">
                    <tr>
                        <td class="banktb_top">
                            &nbsp;
                            UNITED ARAB EMIRATES</td>
                        <td align="center">
                            <asp:Image ID="Image3" runat="server" ImageUrl="images/uae.png" />
                        </td>
                    </tr>
                </table>
            </td>
            
            
            
        </tr>
        <tr>
            <td>
                <table class="banktb">
                    <tr >
                        <td>
                           <b>Name of Bank: </b> </td>
                        <td class="class_span4" >
                            The Bank of Tokyo Mitsubishi UFJ, Ltd.</td>
                    </tr>
                    <tr>
                        <td>
                           <b> Name of Branch: </b></td>
                        <td class="class_span4">
                                    Kanazawa Branch
                                   
                                
                                </td>
                    </tr>
                    <tr>
                        <td>
                                  <b> Bank Address: </b>
                        </td>
                        <td class="class_span4">
                              2 -23-25 Kourinbou, Kanazawa, Japan  
                        </td>
                    </tr>
                    <tr>
                        <td>
                                    <b>Name of Account:</b>
                                </td>
                        <td class="class_span4">
                            Awan International K.K</td>
                    </tr>
                    <tr>
                        <td>
                                    <b>Account Number:</b>
                                </td>
                        <td class="class_span4">
                            
                            0687182</td>
                    </tr>
                    <tr>
                        <td>
                         <b>Swift Code: </b>   
                            
                            
                            </td>
                        <td class="class_span4">
                                   BOTKJPJT</td>
                    </tr>
                    </table>
            </td>
             <td>
                <table class="banktb">
                    <tr>
                        <td>
                            <b>Name of Bank: </b> </td>
                        <td class="class_span4">
                            Mashreq Bank</td>
                    </tr>
                    <tr>
                        <td>
                         <b>  Name of Branch:</b>  </td>
                        <td class="class_span4">
                                   Al Aweer Branch</td>
                    </tr>
                    <tr>
                        <td>
                                <b> Bank Address:</b>  
                        </td>
                        <td class="class_span4">
                             Al Aweer Branch, DOCUMZ, Dubai - U.A.E</td>
                    </tr>
                    <tr>
                        <td>
                                    <b>Name of Account:</b>
                                </td>
                        <td class="class_span4">
                            Tambiri Motors</td>
                    </tr>
                    <tr>
                        <td>
                                    <b>Account Number:</b>
                                </td>
                        <td class="class_span4">
                            
                                   0495303600
                                </td>
                    </tr>
                    <tr>
                        <td>
                          <b>Swift Code: </b>  </td>
                        <td class="class_span4">
                                  BOMLAEAD
                                </td>
                    </tr>
                    </table>
            </td>
        </tr>
    </table>

  <%--  <table>
        <tr>
            <td>
                <table class="banktb">
                    <tr>
                        <td class="banktb_top">
                            &nbsp;
                            JAPAN</td>
                        <td align="center">
                            <asp:Image ID="Image2" runat="server" ImageUrl="images/japan1.png" />
                        </td>
                    </tr>
                </table>
            </td>
              <td>
                <table class="banktb">
                    <tr>
                        <td class="banktb_top">
                            &nbsp;
                            UNITED ARAB EMIRATES</td>
                        <td align="center">
                            <asp:Image ID="Image3" runat="server" ImageUrl="images/uae.png" />
                        </td>
                    </tr>
                </table>
            </td>
            
            
            
        </tr>
        <tr>
            <td>
                <table class="banktb">
                    <tr >
                        <td>
                           <b><%=appdata.GetLanguageString("BankName")%> </b> </td>
                        <td class="class_span4" >
                        <%=appdata.GetLanguageString("banknamefull")%>
                           </td>
                    </tr>
                    <tr>
                        <td>
                           <b>  <%=appdata.GetLanguageString("bankBranch")%> </b></td>
                        <td class="class_span4">
                                
                                   <%=appdata.GetLanguageString("bankBranchName")%>
                                
                                </td>
                    </tr>
                    <tr>
                        <td>
                                  <b><%=appdata.GetLanguageString("bankAddress")%> </b>
                        </td>
                        <td class="class_span4">
                             <%=appdata.GetLanguageString("bankAddresstxt")%> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                                    <b>  <%=appdata.GetLanguageString("bankAccount")%></b>
                                </td>
                        <td class="class_span4">
                         <%=appdata.GetLanguageString("bankAccountname")%>
                           </td>
                    </tr>
                    <tr>
                        <td>
                                    <b><%=appdata.GetLanguageString("bankAccountNumber")%></b>
                                </td>
                        <td class="class_span4">
                             0687182
                           
                         </td>
                    </tr>
                    <tr>
                        <td>
                         <b>Swift Code </b>   
                            
                            
                            </td>
                        <td class="class_span4">
                                   BOTKJPJT</td>
                    </tr>
                    </table>
            </td>
             <td>
                <table class="banktb">
                    <tr>
                        <td>
                            <b><%=appdata.GetLanguageString("BankName")%> </b> </td>
                        <td class="class_span4">
                         
                            <%=appdata.GetLanguageString("bankname2")%>  
                            </td>
                    </tr>
                    <tr>
                        <td>
                         <b>  <%=appdata.GetLanguageString("bankBranch")%></b>  </td>
                        <td class="class_span4">
                                <%=appdata.GetLanguageString("bankBranchName2")%></td>
                    </tr>
                    <tr>
                        <td>
                                <b> <%=appdata.GetLanguageString("bankAddress")%></b>  
                        </td>
                        <td class="class_span4">
                        <%=appdata.GetLanguageString("bankAddresstxt2")%>
                            </td>
                    </tr>
                    <tr>
                        <td>
                                    <b><%=appdata.GetLanguageString("bankAccount")%></b>
                                </td>
                        <td class="class_span4">
                          <%=appdata.GetLanguageString("bankAccountname2")%>
                            </td>
                    </tr>
                    <tr>
                        <td>
                                    <b><%=appdata.GetLanguageString("bankAccountNumber")%></b>
                                </td>
                        <td class="class_span4">
                            0495303600
                                </td>
                    </tr>
                    <tr>
                        <td>
                          <b>Swift Code </b>  </td>
                        <td class="class_span4">
                                  BOMLAEAD
                                </td>
                    </tr>
                    </table>
            </td>
        </tr>
    </table>--%>

</div>


</asp:Content>

