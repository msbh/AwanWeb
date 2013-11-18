<%@ Page Title="Awan International K.K | Favourite List" 
Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="favouritelist.aspx.vb" Inherits="favouritelist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="myform">
        <h1 class="myform_heading">
            <span class="myform_span">Favourite List</span>
        </h1>
        <ul class="myform_line">
        </ul>
        <div class="content">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="favourite_ID" DataSourceID="odsFavouriteList" Width="100%" >
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:HyperLinkField DataNavigateUrlFields="favourite_ID" DataNavigateUrlFormatString="addfavourite.aspx?eid={0}"
                        DataTextFormatString="Edit" Text="Edit" />
                    <asp:BoundField DataField="favourite_ID" HeaderText="favourite_ID" ReadOnly="True"
                        SortExpression="favourite_ID" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="model_description" HeaderText="model_description" SortExpression="model_description"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="model_year_from" HeaderText="model_year_from" SortExpression="model_year_from"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="model_year_till" HeaderText="model_year_till" SortExpression="model_year_till"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Match_records" SortExpression="Match_records" ItemStyle-HorizontalAlign="Center">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Match_records") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <center class="js_a">
                                <asp:LinkButton ID="btnMatchRecords" 
                                PostBackUrl='<%#String.Format("~/stocklist.aspx?make={0}&makemodel={1}&model={2}&model2={3}&fid={4}", Eval("makeid"),Eval("makemodel_id"),Eval("model_year_from"),Eval("model_year_till"),Eval("favourite_id"))%>'
                                
                                runat="server" >View <%# Eval("Match_records") %> match record/s</asp:LinkButton>
                            
                          
                            
                            </center>
                            <asp:HiddenField ID="hmatchrecords" runat="server" Value='<%# Eval("Match_records") %>'>
                            </asp:HiddenField>
                            <asp:HiddenField ID="HiddenField1" runat="server" 
                                Value='<%# Bind("makeID") %>' />
                                
                            <asp:HiddenField ID="HiddenField2" runat="server" 
                                Value='<%# Eval("MakeModel_ID") %>' />
                                
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <asp:ObjectDataSource ID="odsFavouriteList" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Select_favList" 
        TypeName="dsServicesTableAdapters.Favourite_ListTableAdapter" 
        DeleteMethod="Delete_favourite">
        <DeleteParameters>
            <asp:Parameter Name="favourite_ID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters><asp:Parameter DefaultValue="0" Name="make_ID" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="makeModel_ID" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="customer_ID" SessionField="user_id" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

