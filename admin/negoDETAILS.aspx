<%@ Page Title="-Negotiation Details-" Language="VB" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="false"
    CodeFile="negoDETAILS.aspx.vb" Inherits="admin_negoDETAILS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 700px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">





<ul class="myform_heading2">
            <span style="color:  #3366CC">Negotiation  </span>Details 
        </ul>
        
        <ul class="myform_line">
        </ul>   

        <div class="content">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Edit">
                <EditItemTemplate>
                    <div>
                        <ul>
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Ref"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Stock Ref"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Chassis #"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label16" runat="server" Text="FOB Price"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Make"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Make Model"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Model Year"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="Color"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="font-weight: bold;">
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("negtiation_ID") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("FILE_REF") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("CHASSIS_NO") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("FOB_PRICE") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("MAKE") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("MODEL_DESCRIPTION") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("MODEL") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("color") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ul>
                        <ul>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2"
                                Width="100%" DataKeyNames="ID" onrowcommand="GridView1_RowCommand" 
                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" />
                                    <asp:BoundField DataField="Comment_By" HeaderText="Comment_By" SortExpression="Comment_By" />
                                    <asp:BoundField DataField="Time_Stamp" HeaderText="Time_Stamp" SortExpression="Time_Stamp" />
                                    <asp:BoundField DataField="client_FOB_Price" HeaderText="FOB_Price" SortExpression="client_FOB_Price" />
                                    <asp:BoundField DataField="Client_FrieghtPrice" HeaderText="Freight" SortExpression="FrieghtPrice" />
                                    <asp:BoundField DataField="Client_Vanning_Price" HeaderText="Vanning" SortExpression="Vanning_Price" />
                                    <asp:BoundField DataField="Client_Inspection_Price" HeaderText="Inspection" SortExpression="Inspection_Price" />
                                    <asp:BoundField DataField="Client_Total_Cost" HeaderText="Total Cost" SortExpression="Client_Total_Cost" />
                                    <asp:TemplateField HeaderText="Curr" SortExpression="Currency_ID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Currency_ID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("currency_short_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Client_Comments" HeaderText="Comments" SortExpression="Client_Comments" />
                                    <asp:TemplateField HeaderText="Country" SortExpression="Country_ID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Country_ID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("CountryName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ShipmentType" SortExpression="ShipmentType">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ShipmentType") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ShipTypeName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                Text="Remove"></asp:LinkButton>
                                                
                                              <br />
                                                
                                             <asp:LinkButton ID="lnkEmail" runat="server" CausesValidation="False" CommandName="Email"
                                                Text="Send Email" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>     
                                                
                                                
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                        </ul>
                        <ul>
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label18" runat="server" Text="FOB Price"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label19" runat="server" Text="Frieght Charges"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label20" runat="server" Text="Vanning Charges"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label21" runat="server" Text="Inspection Charges"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label22" runat="server" Text="Total "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label23" runat="server" Text="COMMENTS"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBox2" runat="server" Width="60px" Text='<%# Bind("client_FOB_Price") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox3" runat="server" Width="60px" Text='<%# Bind("Client_FrieghtPrice") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox4" runat="server" Width="60px" Text='<%# Bind("Client_Vanning_Price") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox5" runat="server" Width="60px" Text='<%# Bind("Client_Inspection_Price") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox6" runat="server" Width="60px" Text='<%# Bind("Client_Total_Cost") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="390px" Text='<%# Bind("Client_Comments") %>'
                                            Height="46px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                            Text="Add" />
                                        <br />
                                        
                             
                                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Cancel" Text="Cancel" />
                                            
                                            
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label24" runat="server" Text="Currency"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlcurrency" runat="server" DataSourceID="odsCurrency" DataTextField="currency_short_name"
                                            DataValueField="currency_ID" SelectedValue='<%# Bind("Currency_ID") %>' Width="60px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label25" runat="server" Text="Country"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlcountry" runat="server" DataSourceID="odsCountry" DataTextField="CountryName"
                                            DataValueField="Country_ID" SelectedValue='<%# Bind("Country_ID") %>'>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label26" runat="server" Text="Shipment"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlshipment" runat="server" SelectedValue='<%# Bind("ShipmentType") %>'>
                                            <asp:ListItem Value="1">RoRo</asp:ListItem>
                                            <asp:ListItem Value="2">Container</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ul>
                    </div>
                </EditItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData"
                TypeName="dsServicesTableAdapters.Select_NegoDetailsTableAdapter" UpdateMethod="Update">
                <UpdateParameters>
                    <asp:Parameter Name="Client_FrieghtPrice" Type="Decimal" />
                    <asp:Parameter Name="Client_Vanning_Price" Type="Decimal" />
                    <asp:Parameter Name="Client_Inspection_Price" Type="Decimal" />
                    <asp:Parameter Name="Client_Total_Cost" Type="Decimal" />
                    <asp:Parameter Name="country_ID" Type="Int32" />
                    <asp:Parameter Name="Currency_ID" Type="Int32" />
                    <asp:Parameter Name="shipmenttype" Type="Int32" />
                    <asp:Parameter Name="Client_Comments" Type="String" />
                    <asp:Parameter Name="Client_FOB_Price" Type="Decimal" />
                    <asp:QueryStringParameter Name="negtiation_ID" QueryStringField="ID" Type="Int32" />
                    <asp:Parameter DefaultValue="Awan Staff" Name="comment_by" Type="String" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="negtiation_ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsCurrency" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="masterdataTableAdapters.Select_AllCurrencyTableAdapter">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsCountry" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="Select_allCountries" TypeName="masterdataTableAdapters.Select_AllCountriesTableAdapter">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete_NegoDetails"
                SelectMethod="GetData" TypeName="dsServicesTableAdapters.nego_commuTableAdapter">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="negtiation_ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
