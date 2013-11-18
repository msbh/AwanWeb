<%@ Page Title="- Select Vehicle to Order -" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="order1_US.aspx.vb" Inherits="order1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" >

        function calcurr(a, b, c) {

            var e = document.getElementById(a);
            var val = e.options[e.selectedIndex].value;
            var bb = document.getElementById(b);
            var f = document.getElementById(c);

            var val2 = f.value;


            var newprice = val * val2;


            bb.innerText = newprice;




        }

    
    
    </script>
    
    
    
    <div id="myform">
        <asp:HiddenField ID="H_OrderID" runat="server" /> 
        
        <h1 class="myform_heading">
            <span class="myform_span"> Stock    </span> to Order </h1>
        <ul class="myform_line">
        </ul>
        <div class="content js_a" >
               
              
               
               
           <fieldset> <legend>Stock to order  </legend>
               <ul>
                   <asp:DataList ID="DataList1" runat="server" DataKeyField="Order_ID" DataSourceID="odsSelect_CO">
                       <HeaderTemplate>
                           <tr style="border: thin dotted #FFFFFF; font-size: 14px; color: #C0C0C0; font-weight: bold;">
                               <td>
                                   Stock Ref&nbsp;
                               </td>
                               <td>
                                   Make Description
                               </td>
                               <td>
                                   Price&nbsp;
                               </td>
                               <td>
                                   &nbsp;Select Stock
                               </td>
                               <td>
                                   &nbsp;
                               </td>
                           </tr>
                       </HeaderTemplate>
                       <ItemTemplate>
                           <tr style="font-size: 14px; color: #FFFFFF; font-weight: bold;">
                               <td>
                                   <asp:Label ID="FILE_REFLabel" runat="server" Width="200px" Text='<%# Eval("FILE_REF") %>' />
                               </td>
                               <td>
                                   <asp:Label ID="MakeDescLabel" runat="server" Width="300px" Text='<%# Eval("MakeDesc") %>' />
                                   <asp:HiddenField ID="hfobprice" runat="server" 
                                       Value='<%# Eval("FOB_PRICE") %>' />
                               </td>
                               <td>
                                
                                   <asp:DropDownList ID="ddlCurr" runat="server" DataSourceID="odscurr" 
                                       DataTextField="currency_name" DataValueField="Curr_rate" Width="90px">
                                   </asp:DropDownList>
                                 
                                 
                                 
                                   <asp:Label ID="lblfobprice" runat="server" Text='<%# Eval("fob_PRICE") %>' 
                                       Width="200px" />
                               </td>
                               <td>
                                   <asp:CheckBox ID="CheckBox1" Width="50px" runat="server" />
                                   &nbsp;
                               </td>
                               <td>
                                   &nbsp;
                               </td>
                           </tr>
                       </ItemTemplate>
                   </asp:DataList>
               </ul>
               <center style="margin: 4px;">
                   <a href="stocklist.aspx?lv=1">Back </a><a href="order.aspx">Next 
                   
                   </a>
               </center>
               
               
               <asp:ObjectDataSource ID="odscurr" runat="server" 
                       OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                       TypeName="masterdataTableAdapters.Select_CurrencyTableAdapter">
                   </asp:ObjectDataSource>
               
           </fieldset> 
     
            <asp:ObjectDataSource ID="odsSelect_CO" runat="server" 
                OldValuesParameterFormatString="{0}" SelectMethod="GetData" 
                TypeName="membersTableAdapters.CustomerOrderTableAdapter" 
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_Order_ID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Customer_ID" Type="Int32" />
                    <asp:Parameter Name="Stock_ID" Type="Int32" />
                    <asp:Parameter Name="Request_Datetime" Type="DateTime" />
                    <asp:Parameter Name="AuditInfo_ID" Type="Int32" />
                    <asp:Parameter Name="IsFinalized" Type="Int32" />
                    <asp:Parameter Name="Session_ID" Type="String" />
                    <asp:Parameter Name="Original_Order_ID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="Order_ID" SessionField="order_ID" 
                        Type="Int32" />
                    <asp:QueryStringParameter DefaultValue="0" Name="curr_ID" 
                        QueryStringField="curr" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="Customer_ID" Type="Int32" />
                    <asp:Parameter Name="Stock_ID" Type="Int32" />
                    <asp:Parameter Name="Session_ID" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        
        </div>
    </div>
</asp:Content>

