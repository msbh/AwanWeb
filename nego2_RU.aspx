<%@ Page Title="- Negotiation - " Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="nego2_RU.aspx.vb" Inherits="nego2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        $(document).ready(function() {


            var curr = $('#ctl00_ContentPlaceHolder1_FormView1_ddlCurrency option:selected').text();

            var curr_id = $('#ctl00_ContentPlaceHolder1_FormView1_ddlCurrency option:selected').val();

            document.getElementById('ctl00_ContentPlaceHolder1_FormView1_hcurrID').value = Number(curr_id).toFixed(0);

           
            

            calcu($('#fob').text().replace(/,/g, ""), $('#freight').text().replace(/,/g, ""), $('#vanning').text().replace(/,/g, ""), parseFloat($('#ctl00_ContentPlaceHolder1_FormView1_inspection').text().replace(/,/g, "")), curr);



            $('#ctl00_ContentPlaceHolder1_FormView1_ddlcountry').change(function() {
                var cid = $('#ctl00_ContentPlaceHolder1_FormView1_ddlcountry option:selected').val();


                $.ajax({
                    type: "GET",
                    url: "Controls/basichandler.ashx?func=co&cid=" + cid,
                  //  data: dataString,
                    success: function(txt) {


                        var temp = new Array();
                        var b = txt;
                        temp = b.split(',');

                        $('#freight').text(Number(temp[0]).toFixed(2));
                        $('#ctl00_ContentPlaceHolder1_FormView1_txtfrieghtcustomer').val(Number(temp[0]).toFixed(2));

                        $('#ctl00_ContentPlaceHolder1_FormView1_inspection').text(Number(temp[1]).toFixed(2));
                        $('#ctl00_ContentPlaceHolder1_FormView1_txtinspectioncustomer').val(Number(temp[1]).toFixed(2));


                        var curr = $('#ctl00_ContentPlaceHolder1_FormView1_ddlCurrency option:selected').text();

                        calcu($('#fob').text().replace(/,/g, ""), temp[0], $('#vanning').text().replace(/,/g, ""), parseFloat($('#ctl00_ContentPlaceHolder1_FormView1_inspection').text().replace(/,/g, "")), curr);

                    }
                });
                return false;
            });


        });



        function calcu(fobprice, freight, vanning, inspection,curr) {

    
            var fobprice1 = fobprice ? fobprice : 0;
            var freight1 = freight ? freight : 0;
            var vanning1 = vanning ? vanning : 0;
            var inspection1 = inspection ? inspection : 0;

            var ttl_cost = parseFloat(fobprice1) + parseFloat(freight1) + parseFloat(vanning1) + parseFloat(inspection1);

            document.getElementById('total_cost').innerText = ttl_cost;

            document.getElementById('fobcurr').innerText = curr;
            document.getElementById('vanningcurr').innerText = curr;
            document.getElementById('freightcurr').innerText = curr;
            document.getElementById('inspectioncurr').innerText = curr;
            document.getElementById('total_costcurr').innerText = curr;


            var curr_id = $('#ctl00_ContentPlaceHolder1_FormView1_ddlCurrency option:selected').val();
            document.getElementById('ctl00_ContentPlaceHolder1_FormView1_hcurrID').value = Number(curr_id).toFixed(0);

            var country_ID = $('#ctl00_ContentPlaceHolder1_FormView1_ddlcountry option:selected').val();
            document.getElementById('ctl00_ContentPlaceHolder1_FormView1_HcountryID').value = Number(country_ID).toFixed(0);
            
            var shipment_ID = $('#ctl00_ContentPlaceHolder1_FormView1_ddlshipmenttype option:selected').val();
            document.getElementById('ctl00_ContentPlaceHolder1_FormView1_HshipmentTypeID').value = Number(shipment_ID).toFixed(0);
       
        }


      
        

    </script>





    <script type="text/javascript">
        $(function() {
            $('#gallery a').lightBox();


        });

        function calcuCustomer() {


       

            var fobprice = $('#ctl00_ContentPlaceHolder1_FormView1_txtfobcustomer').val();
            var freight = $('#ctl00_ContentPlaceHolder1_FormView1_txtfrieghtcustomer').val();
            var vanning = $('#ctl00_ContentPlaceHolder1_FormView1_txtvanningcustomer').val();
            var inspection = $('#ctl00_ContentPlaceHolder1_FormView1_txtinspectioncustomer').val();
            //   var fobprice = $('#txttotal_costcustomer').val();



            var fobprice1 = fobprice ? fobprice : 0;
            var freight1 = freight ? freight : 0;
            var vanning1 = vanning ? vanning : 0;
            var inspection1 = inspection ? inspection : 0;

            var ttl_cost = parseFloat(fobprice1) + parseFloat(freight1) + parseFloat(vanning1) + parseFloat(inspection1);

            $('#ctl00_ContentPlaceHolder1_FormView1_txttotal_costcustomer').val(Number(ttl_cost).toFixed(2));

     
        }

        function getfobprice(rate) {

            var fob = document.getElementById('fob');
            var hfob = document.getElementById('ctl00_ContentPlaceHolder1_FormView1_hfobpirce');
            fob.innerText =Number(hfob.value * (1/rate)).toFixed(2);
            var curr = $('#ctl00_ContentPlaceHolder1_FormView1_ddlCurrency option:selected').text();
        
            calcu($('#fob').text().replace(/,/g, ""), $('#freight').text().replace(/,/g, ""), $('#vanning').text().replace(/,/g, ""), parseFloat($('#ctl00_ContentPlaceHolder1_FormView1_inspection').text().replace(/,/g, "")), curr);
         
            
            
            return false;


        }

        function addshipment(val) {
                       
            if (val == 1) {

                document.getElementById('vanning').innerText = Number(300).toFixed(2);
                document.getElementById('ctl00_ContentPlaceHolder1_FormView1_txtvanningcustomer').value = Number(300).toFixed(2);
                
            } else {

            document.getElementById('vanning').innerText = Number(0).toFixed(2);
            document.getElementById('ctl00_ContentPlaceHolder1_FormView1_txtvanningcustomer').value = Number(0).toFixed(2);
              
            }

            var curr = $('#ctl00_ContentPlaceHolder1_FormView1_ddlCurrency option:selected').text();

                
            calcu($('#fob').text().replace(/,/g, ""), $('#freight').text().replace(/,/g, ""), $('#vanning').text().replace(/,/g, ""), parseFloat($('#ctl00_ContentPlaceHolder1_FormView1_inspection').text().replace(/,/g, "")), curr);



            return false;


        }


      
    </script>

    <div id="myform">
     <span ID="lblmessage" runat="server" visible="false" style=" padding:8px; font-size:12px; "  class="infomessages" >
     We have recieved your negotiation. We will get back to you shortly. </span> 
     
 
            <asp:FormView ID="FormView1" Width="100%" runat="server" DataSourceID="odsnegotiate"
                DefaultMode="Edit" style="margin-top: 50px" DataKeyNames="negtiation_ID">
                <EditItemTemplate>
                 
                    <asp:HiddenField ID="HiddenField1" runat="server" 
                        Value='<%# Bind("negtiation_ID") %>' />
                 
                 
                    <div class="car_detail_left">
                        <h1 class="cardetail_h1">
                            <%# Eval("make") %>
                            <%#Eval("model_description")%>
                            --
                            <%#Eval("model")%></h1>
                        <span>REF#
                            <%#Eval("file_ref")%></span> <a id="img_path" target="_blank" rel="lightbox[detail]"
                                href="http://www.awan.co.jp/cars_images/<%# Eval("image1") %>">
                                <img id="main_pic" name="main_pic" class="car_image" src="http://www.awan.co.jp/cars_images/<%# Eval("image1") %>"></a>
                        <ul class="car_detail_car_navigation">
                            <li><a target="_blank" rel="lightbox[a]" href="http://www.awan.co.jp/cars_images/<%# Eval("image1") %>">
                                <img width="85" border="0" height="63" rel="lightbox[a]" name="f" id="f" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/<%# Eval("image1") %>'"
                                    src="http://www.awan.co.jp/cars_images/<%# Eval("image1") %>"></a> <a target="_blank"
                                        rel="lightbox[a]" href="http://www.awan.co.jp/cars_images/<%# Eval("image2") %>">
                                        <img width="85" border="0" height="63" rel="lightbox[a]" name="f" id="Img1" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/<%# Eval("image2") %>'"
                                            src="http://www.awan.co.jp/cars_images/<%# Eval("image2") %>"></a> <a target="_blank"
                                                rel="lightbox[a]" href="http://www.awan.co.jp/cars_images/<%# Eval("image3") %>">
                                                <img width="85" border="0" height="63" rel="lightbox[a]" name="f" id="Img2" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/<%# Eval("image3") %>'"
                                                    src="http://www.awan.co.jp/cars_images/<%# Eval("image3") %>"></a>
                                <a target="_blank" rel="lightbox[a]" href="http://www.awan.co.jp/cars_images/<%# Eval("image4") %>">
                                    <img width="85" border="0" height="63" rel="lightbox[a]" name="f" id="Img3" onmouseover="document.images.main_pic.src='http://www.awan.co.jp/cars_images/<%# Eval("image4") %>'"
                                        src="http://www.awan.co.jp/cars_images/<%# Eval("image4") %>"></a></li>
                        </ul>
                        <ul>
                            <strong>Vehicle options:</strong><br>
                            <div id="features">
                                <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" ForeColor="Black" BackColor="#FFFFFF">
                                    <HeaderTemplate>
                                        <div class="details_options">
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table class="details_options_items">
                                            <tr>
                                                <td>
                                                    <asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/images/check.jpg"
                                                        Width="22px" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="att_name" runat="server" Text='<%# Eval("ATT_NAME") %>' Width="200px"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </ul>
                    </div>
                    <div class="left car_detail_center_main">
                       <asp:HiddenField ID="hcurrID" 
                                            runat="server" Value='<%# Bind("Currency_ID") %>' />
                                            
                                            <asp:HiddenField ID="HcountryID" 
                                            runat="server" Value='<%# Bind("Country_ID") %>' />
                                            
                                            <asp:HiddenField ID="HshipmentTypeID" 
                                            runat="server" Value='<%# Bind("shipmenttype") %>' />
                                            
                                            
                                            
                        <table width="350" cellspacing="0" cellpadding="0" border="0" align="left">
                            <tbody>
                                <tr>
                                    <td align="left" colspan="2">
                                        <h4 class="center_left_heading">
                                           Переговоры сделки:</h4>
                                    </td>
                                    <td>
                                        <div style="display: none;" id="snake">
                                            <img src="img/ajaxSnake.gif"></div>
                                    </td>
                                </tr>
                                <tr id="currency_selector">
                                    <td>
                                        <span class="clear left bold ">валюта:
                                        </span>
                                    &nbsp;</td>
                                    <td colspan="2">
                                        <span class="right blue bold">
                                         
                                         
                                            
                                      
                                            <asp:DropDownList ID="ddlCurrency" runat="server" 
                                            DataSourceID="odsCurrency" DataTextField="currency_name"
                                                DataValueField="Curr_rate" 
                                                onchange="getfobprice(this.value);"  >
                                           
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="odsCurrency" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" TypeName="masterdataTableAdapters.Select_CurrencyTableAdapter">
                                            </asp:ObjectDataSource>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="clear left bold ">отгрузка</span>
                                    </td>
                                    <td colspan="2">
                                        <span class="right">
                                         
                                            <asp:DropDownList ID="ddlshipmenttype" runat="server" 
                                            onchange="addshipment(this.value);" >
                                                <asp:ListItem Value="1">RoRo</asp:ListItem>
                                                <asp:ListItem Value="2">Container</asp:ListItem>
                                            </asp:DropDownList>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="clear">Location:</span>
                                    </td>
                                    <td colspan="2">
                                        <span class="right">
                                           
                                            <asp:DropDownList ID="ddlcountry" runat="server" 
                                            DataSourceID="odscountries"
                                            DataTextField="CountryName"  
                                            DataValueField="Country_ID">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="odscountries" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
                                            </asp:ObjectDataSource>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4>
                                            Price</h4>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <h4>
                                            Negotiate</h4>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="clear left">Цена FOB::</span>
                                        <asp:HiddenField ID="hfobpirce" runat="server" Value='<%# Eval("FOB_PRICE") %>' />
                                    </td>
                                    <td width="151">
                                     <span id="fobcurr"></span>
                                     &nbsp;
                                        <span id="fob" class="right">
                                            <%#Eval("fob_price")%></span>
                                    </td>
                                    <td>
                                        
                                        <asp:TextBox ID="txtfobcustomer" onblur="calcuCustomer();"  runat="server" 
                                            Text='<%# Bind("client_FOB_Price") %>'></asp:TextBox>  
                                        
                                        
                                        
                                    </td>
                                </tr>
                                <tr id="freightInfo">
                                    <td>
                                        <span id="car_detail_freight" class="clear left bold ">грузовой:</span>
                                    </td>
                                    <td>
                                     <span id="freightcurr"></span>&nbsp;<span id="freight"> 0</span>
                                    </td>
                                    <td class="right">
                                      
                                     <asp:TextBox ID="txtfrieghtcustomer" Text='<%# Bind("Client_FrieghtPrice") %>' 
                                            onblur="calcuCustomer();" runat="server"></asp:TextBox>
                                    
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="car_detail_vanning" class="clear left bold">Vanning:</span>
                                    </td>
                                    <td>
                                      <span id="vanningcurr" class="right"></span>&nbsp;<span id="vanning" class="right">0</span>
                                    </td>
                                    <td class="right">
                                    <asp:TextBox ID="txtvanningcustomer" Text='<%# Bind("Client_Vanning_Price") %>' 
                                            onchange="calcucustomer();"   runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="car_detail_vanning" class="clear left bold ">проверка</span>
                                    </td>
                                    <td>
                                    <span id="inspectioncurr" ></span>&nbsp; <asp:Label ID="inspection" runat="server" Text="0"></asp:Label>
                                    </td>
                                    <td class="right">
                                      <asp:TextBox ID="txtinspectioncustomer" 
                                            Text='<%# Bind("Client_Inspection_Price") %>' runat="server"  ></asp:TextBox>
                                           
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="car_detail_vanning" class="clear left">
                                            <div id="insurancelabel" style="display: none;">
                                                Страхование:</div>
                                        </span>
                                    </td>
                                    <td>
                                        <div id="insurancelabelvalue" style="display: none;">
                                            <span id="insurance" class="right blue bold">US$ 0</span></div>
                                    </td>
                                    <td class="right">
                                        <div id="insurancelabelfield" style="display: none;">
                                            <input type="text" value="" name="insurancetxt" id="insurancetxt" readonly=""></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="clear left ">Полная стоимость</span>
                                    </td>
                                    <td>
                                       
                                      <span id="total_costcurr"></span>&nbsp; 
                                        <span  id="total_cost" >
                                            <%#Eval("fob_price")%></span>
                                    </td>
                                    <td class="right">
                                        
                                      <asp:TextBox ID="txttotal_costcustomer" Text='<%# Bind("Client_Total_Cost") %>' 
                                             runat="server"></asp:TextBox>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="3">
                                        <h4 class="center_left_heading">
                                           Моя информацией</h4>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <div class="error_h2">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="left bold ">Name:</span>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td class="right blue bold">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                        runat="server" 
                                         ControlToValidate="txtcustomername"
                                         Display="Dynamic"
                                            ErrorMessage="*"> *</asp:RequiredFieldValidator> 
                                        
                                        <asp:TextBox ID="txtcustomername" runat="server" 
                                            Text='<%# Bind("Client_Name") %>'></asp:TextBox>
                                        
                                        
                                     
                                        
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="left bold ">Email:</span>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td class="right blue bold">
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                        runat="server" 
                                         ControlToValidate="txtcustomerEmail"
                                         Display="Dynamic"
                                            ErrorMessage="*"> *</asp:RequiredFieldValidator>      
                                        
                                      <asp:TextBox ID="txtcustomerEmail" runat="server" 
                                            Text='<%# Bind("Client_Email") %>'></asp:TextBox>    
                                        
                                     
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class=" left bold ">Phone:</span>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td class="right blue bold">
                                       <asp:TextBox ID="txtcustomer_phone" runat="server" 
                                            Text='<%# Bind("Client_Phone") %>'></asp:TextBox>    
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="left">Comments:</span>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                       <asp:TextBox ID="txtComments" runat="server" 
                                            Text='<%# Bind("Client_Comments") %>'></asp:TextBox>    
                                        
                                       
                                        
                                        
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="3">
                                        <div id="negotiate_btn">
                                            <div class="js_a">
                                                <asp:LinkButton ID="Update" runat="server" CausesValidation="True" CommandName="Update"
                                                   
                                                    Text="Negotiate Now"  />
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="3">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </EditItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="odsnegotiate" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" SelectMethod="GetData" 
                TypeName="dsServicesTableAdapters.Select_NegotiateTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_negtiation_ID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:QueryStringParameter Name="stock_ID" QueryStringField="id" 
                        Type="Int32" />
                    <asp:Parameter Name="FOB_Price" Type="Decimal" DefaultValue="0" />
                    <asp:Parameter Name="Client_FrieghtPrice" Type="Decimal" DefaultValue="" />
                    <asp:Parameter Name="Client_Vanning_Price" Type="Decimal" />
                    <asp:Parameter Name="Client_Inspection_Price" Type="Decimal" DefaultValue="" />
                    <asp:Parameter Name="Client_Total_Cost" Type="Decimal" />
                    <asp:Parameter Name="country_ID" Type="Int32"  />
                    <asp:Parameter Name="Currency_ID" Type="Int32" />
                    <asp:SessionParameter Name="Customer_ID" SessionField="user_id" Type="Int32" />
                    <asp:Parameter Name="shipmenttype" Type="Int32" DefaultValue=""  />
                    <asp:Parameter Name="Client_Name" Type="String" />
                    <asp:Parameter Name="Client_Email" Type="String" />
                    <asp:Parameter Name="Client_Phone" Type="String" />
                    <asp:Parameter Name="Client_Comments" Type="String" />
                    <asp:Parameter Name="Client_FOB_Price" Type="Decimal" DefaultValue="" />
                    <asp:Parameter Name="negtiation_ID" Type="Int32" DefaultValue="1" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="stock_ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="stock_ID" Type="Int32" />
                    <asp:Parameter Name="client_FOB_Price" Type="Decimal" />
                    <asp:Parameter Name="Client_FrieghtPrice" Type="Decimal" />
                    <asp:Parameter Name="Client_Vanning_Price" Type="Decimal" />
                    <asp:Parameter Name="Client_Inspection_Price" Type="Decimal" />
                    <asp:Parameter Name="Client_Total_Cost" Type="Decimal" />
                    <asp:Parameter Name="Currency_ID" Type="Int32" />
                    <asp:Parameter Name="Customer_ID" Type="Int32" />
                    <asp:Parameter Name="Client_Name" Type="String" />
                    <asp:Parameter Name="Client_Email" Type="String" />
                    <asp:Parameter Name="Client_Phone" Type="String" />
                    <asp:Parameter Name="Client_Comments" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>

    </div>
</asp:Content>
