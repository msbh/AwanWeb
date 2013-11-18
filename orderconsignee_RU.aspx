<%@ Page Title="- Order Consignee Details -" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="orderconsignee_RU.aspx.vb" Inherits="orderconsignee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="myform" >
   <h1 class="myform_heading">
           
            <span class="myform_span">цитата </span>
        </h1>
        <ul class="myform_line">
        </ul>
        <div class="content">
        <fieldset>
                <center id="orderstatus">
                    <ul>
                        <li>Step 1 [Shipping details]</li>
                        <li >Step 2 [Order Details] </li>
                        <li class="active">Step 3 [Consignee Info] </li>
                        <li>Step 4 [Complete Order] </li>
                    </ul>
                </center>
            </fieldset>
      
  
       <table class="lvconsignee">
                <tr>
                    <td class="col heading">
                       Получатель информации</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="col">
                        Name</td>
                    <td>
                        <asp:TextBox ID="txtname_con" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        Email</td>
                    <td>
                        <asp:TextBox ID="txtEmail_con" runat="server"></asp:TextBox>
                        
                         <asp:RequiredFieldValidator ID="RequiredEmail_con" runat="server" 
                                          ControlToValidate="txtEmail_con" Display="Dynamic" 
                                          ErrorMessage="E_Mail required" ValidationGroup="form">
                                      </asp:RequiredFieldValidator>
                                      
                                      <asp:RegularExpressionValidator ID="regexEmail_con" runat="server" 
                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtEmail_con" ErrorMessage="Invalid Email Address" 
                                    Display="Dynamic"></asp:RegularExpressionValidator> 
                        
                        
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        Address</td>
                    <td>
                        <asp:TextBox ID="txtAddress_con"  runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        County </td>
                    <td>
                        <asp:DropDownList ID="ddlcountry_con" runat="server" DataSourceID="odsCountry" 
                            DataTextField="CountryName" DataValueField="Country_ID">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        City</td>
                    <td>
                        <asp:TextBox ID="txtCity_Con" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        Phone</td>
                    <td>
                        <asp:TextBox ID="txtPhone_con" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        Fax</td>
                    <td>
                        <asp:TextBox ID="txtFax_Con" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="col heading">
                        Сообщите партии</td>
                    <td>
                        <asp:CheckBox ID="chkSameAsAbove" runat="server" Text="Same as above" />
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                 <tr>
                    <td class="col">
                        Name</td>
                    <td>
                        <asp:TextBox ID="txtName_not" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        Email</td>
                    <td>
                        <asp:TextBox ID="txtEmail_Not" runat="server"></asp:TextBox>
                        
                             <asp:RequiredFieldValidator ID="RequiredEmail_Not" runat="server" 
                                          ControlToValidate="txtEmail_Not" Display="Dynamic" 
                                          ErrorMessage="E_Mail required" ValidationGroup="form">
                                      </asp:RequiredFieldValidator>
                                      
                                      <asp:RegularExpressionValidator ID="RegularEmail_Not" runat="server" 
                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtEmail_Not" ErrorMessage="Invalid Email Address" 
                                    Display="Dynamic"></asp:RegularExpressionValidator> 
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        Address</td>
                    <td>
                        <asp:TextBox ID="txtAddress_Not"  runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        County </td>
                    <td>
                        <asp:DropDownList ID="ddlCountry_Not" runat="server" DataSourceID="odsCountry" 
                            DataTextField="CountryName" DataValueField="Country_ID">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        City</td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        Phone</td>
                    <td>
                        <asp:TextBox ID="txtPhone_Not" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        Fax</td>
                    <td>
                        <asp:TextBox ID="txtFax_Not" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="col">
                        Паымент параметры</td>
                    <td>
                        <asp:RadioButtonList ID="rdPaymentOptions" runat="server">
                            <asp:ListItem Value="1" Selected="True">Telegraphic Transfer (TT)</asp:ListItem>
                            <asp:ListItem Value="2">Bank transfer</asp:ListItem>
                            <asp:ListItem Value="3">Credit Card (PayPal)</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        Comments</td>
                    <td>
                        <asp:TextBox ID="txtComments" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                </table>
      
  <center class="js_a" style="margin: 4px;">
                   
                            <a href="orderDetails.aspx"> Back </a>
                            
                            
                        &nbsp;
                        <asp:LinkButton ID="btnNext" runat="server" 
                                                Text="Next" />
                    </center>
        
        
        
        
         <asp:ObjectDataSource ID="odsCountry" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
            </asp:ObjectDataSource>
        
        </div>


</div>


    <script type="text/javascript">

        function pageLoad() {

          

            $('#<%=chkSameAsAbove.clientid %>').click(function() {


                var chked = $(this).is(':checked');

                if (chked == true) {


                    $('#<%=txtName_not.clientid %>').val($('#<%=txtName_con.clientid %>').val());
                    $('#<%=txtEmail_Not.clientid %>').val($('#<%=txtEmail_Con.clientid %>').val());
                    $('#<%=txtAddress_Not.clientid %>').val($('#<%=txtAddress_con.clientid %>').val());

                    selCountry = $('#<%=ddlCountry_Con.clientid %> option:selected').val();
                    $('#<%=ddlCountry_Not.clientid %>').val(selCountry);

                    $('#<%=txtCity.clientid %>').val($('#<%=txtCity_Con.clientid %>').val());
                    $('#<%=txtPhone_Not.clientid %>').val($('#<%=txtPhone_Con.clientid %>').val());
                    $('#<%=txtFax_Not.clientid %>').val($('#<%=txtFax_Con.clientid %>').val());


                    

                }

                else {



                }



            });


        };
    </script>

</asp:Content>

