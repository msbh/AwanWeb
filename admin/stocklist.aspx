<%@ Page Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false" CodeFile="stocklist.aspx.vb" Inherits="admin_stocklist" title="-Stock Vehicle List-" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    <script type="text/javascript">

        var pageUrl = '<%=ResolveUrl("~/admin/stocklist.aspx")%>'
        function PopulateMakeName() {

            if ($('#<%=ddlMake.ClientID%>').val() == "0") {
                $('#<%=ddlMakeName.ClientID %>').empty().append('<option selected="selected" value="0">Any</option>');
            }
            else {
                $('#<%=ddlMakeName.ClientID %>').empty().append('<option selected="selected" value="0">Loading...</option>');
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/get_MakeNames',
                    data: '{MakeID: ' + $('#<%=ddlMake.ClientID%>').val() + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnMakeNamePopulated,
                    failure: function(response) {
                        alert(response.d);
                    }
                });
            }
        }

        function OnMakeNamePopulated(response) {
            PopulateControl(response.d, $("#<%=ddlMakeName.ClientID %>"));
        }



        function PopulateControl(list, control) {
            if (list.length > 0) {
                control.removeAttr("disabled");
                control.empty().append('<option selected="selected" value="0">Any</option>');
                $.each(list, function() {
                    control.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            }
            else {
                control.empty().append('<option selected="selected" value="0">Not available<option>');
            }
        }
    
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>
   
 

<ul class="myform_heading2">
            <span style="color: #3366CC">Stock Vehicle </span>List
        </ul>
        <ul class="myform_line">
        </ul> 
   
 
          <table>
                        <tr>
                            <td class="search_ferozi" colspan="3">
                                Search 
                            </td>
                            <td style="width: 67px">
                            </td>
                            <td class="search_ferozi" colspan="2">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label26" runat="server" Text="Chassis No" Width="70px"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtchassis_no" runat="server"></asp:TextBox>
                                     
                            </td>
                            <td>
                                <asp:Label ID="Label27" runat="server" Text="Drive "></asp:Label>
                            </td>
                            <td style="width: 67px">
                                <asp:DropDownList ID="ddlDrive" runat="server">
                                    <asp:ListItem Value="">All</asp:ListItem>
                                    <asp:ListItem Value="R">Right Hand</asp:ListItem>
                                    <asp:ListItem Value="L">Left Hand</asp:ListItem>
                                    <asp:ListItem Value="C">Classic cars</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label28" runat="server" Text="Country"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlcountry" runat="server" Width="110px">
<asp:ListItem Value="0">Any</asp:ListItem>
 <asp:ListItem Value="4">China</asp:ListItem>
<asp:ListItem Value="16">India</asp:ListItem>
<asp:ListItem Value="2">Japan</asp:ListItem>
<asp:ListItem Value="6">Kenya</asp:ListItem>
<asp:ListItem Value="5">Pakistan</asp:ListItem>
<asp:ListItem Value="17">Portugal</asp:ListItem>
 <asp:ListItem Value="15">Russia</asp:ListItem>
<asp:ListItem Value="9">South Africa</asp:ListItem>
<asp:ListItem Value="10">Singapore</asp:ListItem>
 <asp:ListItem Value="11">South Korea</asp:ListItem>
  <asp:ListItem Value="13">Tanzania</asp:ListItem>
  <asp:ListItem Value="3">U.A.E</asp:ListItem>
<asp:ListItem Value="8">U.K</asp:ListItem>
 <asp:ListItem Value="12">Uganda</asp:ListItem> 
<asp:ListItem Value="7">U.S</asp:ListItem> 
 
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label37" runat="server" Text="Year"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlYear" runat="server">
                                    <asp:ListItem Value="">Any</asp:ListItem>
                                    <asp:ListItem>1990</asp:ListItem>
                                    <asp:ListItem>1991</asp:ListItem>
                                    <asp:ListItem>1992</asp:ListItem>
                                    <asp:ListItem>1993</asp:ListItem>
                                    <asp:ListItem>1994</asp:ListItem>
                                    <asp:ListItem>1995</asp:ListItem>
                                    <asp:ListItem>1996</asp:ListItem>
                                    <asp:ListItem>1997</asp:ListItem>
                                    <asp:ListItem>1998</asp:ListItem>
                                    <asp:ListItem>1999</asp:ListItem>
                                    <asp:ListItem>2000</asp:ListItem>
                                    <asp:ListItem>2001</asp:ListItem>
                                    <asp:ListItem>2002</asp:ListItem>
                                    <asp:ListItem>2003</asp:ListItem>
                                    <asp:ListItem>2004</asp:ListItem>
                                    <asp:ListItem>2005</asp:ListItem>
                                    <asp:ListItem>2006</asp:ListItem>
                                    <asp:ListItem>2007</asp:ListItem>
                                    <asp:ListItem>2008</asp:ListItem>
                                    <asp:ListItem>2009</asp:ListItem>
                                    <asp:ListItem>2010</asp:ListItem>
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Make"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMake" runat="server" Width="130px" DataSourceID="odsMake" DataTextField="make" 
                                    DataValueField="makeID" onchange="PopulateMakeName()">
                                    <asp:ListItem Value="0">Any</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Model"></asp:Label>
                              
                            </td>
                            <td style="width: 67px">
                                <asp:DropDownList ID="ddlMakeName" runat="server" Width="150px">
                                    <asp:ListItem Value="0">Any</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label34" runat="server" Text="Color"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlcolor" runat="server" DataSourceID="odscolor" 
                                    DataTextField="color" DataValueField="id" Width="100px">
                                    <asp:ListItem>Any</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label18" runat="server" Text="Door"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddldoor" runat="server">
                                    <asp:ListItem Value="">Any</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label30" runat="server" Text="Display type" Width="80px"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlwebdisplaytype" runat="server" 
                                    DataSourceID="odsWebDisplayType" DataTextField="display_type" 
                                    DataValueField="ID">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label35" runat="server" Text="Veh Category" Width="85px"></asp:Label>
                            </td>
                            <td style="width: 67px">
                                <asp:DropDownList ID="ddlCat" runat="server" DataSourceID="odsMakeCategory" 
                                    DataTextField="category" DataValueField="id">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label36" runat="server" Text="Fuel Type" Width="60px"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlfuelType" runat="server">
                                    <asp:ListItem Value="">Any</asp:ListItem>
                                    <asp:ListItem Value="Patrol">Patrol</asp:ListItem>
                                    <asp:ListItem Value="GASOLINE">GASOLINE</asp:ListItem>
                                    <asp:ListItem Value="DIESEL">DIESEL</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label24" runat="server" Text="Trans."></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddltransmission" runat="server">
                                    <asp:ListItem>Any</asp:ListItem>
                                    <asp:ListItem>AT</asp:ListItem>
                                    <asp:ListItem>M/T</asp:ListItem>
                                    <asp:ListItem>C4</asp:ListItem>
                                    <asp:ListItem>C5</asp:ListItem>
                                    <asp:ListItem>C6</asp:ListItem>
                                    <asp:ListItem>C7</asp:ListItem>
                                    <asp:ListItem>D1</asp:ListItem>
                                    <asp:ListItem>D2</asp:ListItem>
                                    <asp:ListItem>D3</asp:ListItem>
                                    <asp:ListItem>D4</asp:ListItem>
                                    <asp:ListItem>F4</asp:ListItem>
                                    <asp:ListItem>F5</asp:ListItem>
                                    <asp:ListItem>F6</asp:ListItem>
                                    <asp:ListItem>F7</asp:ListItem>
                                    <asp:ListItem>FAT</asp:ListItem>
                                    <asp:ListItem>CAT</asp:ListItem>
                                    <asp:ListItem>DAT</asp:ListItem>
                                    <asp:ListItem>IAT</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr >
                            <td>
                                <asp:Label ID="Label38" runat="server" Text="Stock Ref#"></asp:Label>
                              </td>
                            <td>
                                <asp:TextBox ID="txtfile_ref" runat="server" Width="99px"></asp:TextBox>
                            </td>
                            <td>
                              
                                <asp:Label ID="Label39" runat="server" Text="Availability"></asp:Label>
                              
                            </td>
                            <td> 
                            </td>
                           
                           
                            <asp:DropDownList ID="ddlstatus" runat="server">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>STOCK</asp:ListItem>
                                <asp:ListItem>SALE</asp:ListItem>
                                <asp:ListItem>SOLD</asp:ListItem>
                            </asp:DropDownList>
                                
                                
                               
                            
                            <td>
                                </td>
                            <td>
                            </td>
                            <td>
                               
                            </td>
                            <td>
                             
                                <asp:Button ID="cmdsearch0" runat="server" CssClass="btn_action" 
                                    Text="Search" />
                             
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                               </td>
                        </tr>
                        </table>
     
           


    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" 
           Width="100%" EmptyDataText="- No data -" PageSize="15" >
        
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="CHASSIS_NO" HeaderText="CHASSIS_NO" 
                SortExpression="CHASSIS_NO" />
            <asp:BoundField DataField="MODEL" HeaderText="MODEL" SortExpression="MODEL" />
            <asp:BoundField DataField="COLOR" HeaderText="COLOR" SortExpression="COLOR" />
            <asp:BoundField DataField="TRANSMISSION" HeaderText="TRANS." 
                SortExpression="TRANSMISSION" />
            <asp:BoundField DataField="DOOR" HeaderText="DOR" 
                SortExpression="DOOR" ReadOnly="True" />
    
            <asp:BoundField DataField="MAKE_CATEGORY" HeaderText="CAT" 
                SortExpression="MAKE_CATEGORY" />

            <asp:BoundField DataField="DRIVE" HeaderText="DRV" 
                SortExpression="DRIVE" />
  
            <asp:BoundField DataField="FOB_PRICE" HeaderText="FOB_PRICE" 
                SortExpression="FOB_PRICE" />
       
            <asp:BoundField DataField="WEB_PRICE" HeaderText="WEB_PRICE" 
                SortExpression="WEB_PRICE" />
  
            <asp:BoundField DataField="availability" HeaderText="STATUS" 
                ReadOnly="True" SortExpression="availability" />
       
            <asp:BoundField DataField="globalLocation" HeaderText="LOC" 
                SortExpression="globalLocation" />
            <asp:BoundField DataField="FILE_REF" HeaderText="REF" 
                SortExpression="FILE_REF" />
          
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="stockdetails.aspx?ID={0}" 
                DataTextFormatString="View" HeaderText="View" Text="View" />
  
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>




<div>
  
         <asp:ObjectDataSource ID="odscolor" runat="server" 
             OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
             TypeName="masterdataTableAdapters.vCOLORTableAdapter"></asp:ObjectDataSource>
           

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetData" 
        TypeName="dsStockTableAdapters.adminStockListTableAdapter" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMake" Name="MAKE" PropertyName="SelectedValue" 
            Type="String" DefaultValue="0" />
            <asp:ControlParameter ControlID="ddlMakeName" Name="MODEL_DESCRIPTION" PropertyName="SelectedValue" 
            Type="String" DefaultValue="0" />
            <asp:ControlParameter ControlID="ddlcolor" Name="COLOR" PropertyName="SelectedValue" 
            Type="String" DefaultValue="0" />
            <asp:ControlParameter ControlID="ddlCat" DefaultValue="0" 
                Name="make_category" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlcountry" DefaultValue="0" Name="globalLocationID" 
                PropertyName="SelectedValue" Type="String" />
            
            
            
            <asp:ControlParameter ControlID="ddlwebdisplaytype" 
                PropertyName="SelectedValue"    Name="display_type" Type="String" 
                DefaultValue="0" />
            <asp:ControlParameter ControlID="ddlyear" Name="MODEL" 
                PropertyName="SelectedValue" Type="String" DefaultValue=" " />
            <asp:ControlParameter ControlID="ddlstatus" Name="AVAILABILITY" PropertyName="SelectedValue" 
             Type="String" DefaultValue=" " />
            <asp:ControlParameter ControlID="ddltransmission"  DefaultValue=" " 
                Name="TRANSMISSION" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlfuelType" DefaultValue="  " Name="fuel_type" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlDrive" Name="drive" 
                PropertyName="SelectedValue" Type="String" DefaultValue=" " />
            <asp:ControlParameter ControlID="ddldoor" Name="door" 
                PropertyName="SelectedValue" Type="String" DefaultValue=" " />
            <asp:Parameter Name="roleID" Type="Int32" DefaultValue="0" />
            <asp:ControlParameter ControlID="txtchassis_no"  DefaultValue=" " Name="chassis_no" Type="String" />
            
             
             
                   
             
             <asp:ControlParameter ControlID="txtfile_ref" DefaultValue=" " Name="stk_ref" 
                Type="String" PropertyName="Text" />
            
             
             
                   
             
        </SelectParameters>
    </asp:ObjectDataSource>
        

    <asp:ObjectDataSource ID="odsMakeCategory" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="masterdataTableAdapters.vMakeCategoryTableAdapter">
    </asp:ObjectDataSource>
           

         <asp:ObjectDataSource ID="odsMake" runat="server" 
             OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
             TypeName="masterdataTableAdapters.make_nocountTableAdapter">
         </asp:ObjectDataSource>
           

         <asp:ObjectDataSource ID="odsWebDisplayType" runat="server" 
             DeleteMethod="Delete" 
             OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" 
             TypeName="masterdataTableAdapters.display_typeTableAdapter" 
             UpdateMethod="Update">
             <DeleteParameters>
                 <asp:Parameter Name="Original_ID" Type="Int32" />
             </DeleteParameters>
             <UpdateParameters>
                 <asp:Parameter Name="display_type" Type="String" />
                 <asp:Parameter Name="Original_ID" Type="Int32" />
             </UpdateParameters>
         </asp:ObjectDataSource>
           

</div>
</ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>

