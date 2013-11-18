<%@ Page Title="Add favourite Vehicle" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="addFavourite.aspx.vb" Inherits="addFavourite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" 
Runat="Server">
    <div id="myform">
        <h1 class="myform_heading">
            <span class="myform_span">Add Favourite  </span>
        </h1>
        <ul class="myform_line">
        </ul>
        <div class="content">
          
        
        
        </div>
        
      
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="favourite_ID" 
            DataSourceID="odsFavourite" DefaultMode="Edit" >
          
           <InsertItemTemplate>
            <fieldset>
                    <legend>Select Vehicle </legend>
                    <ul>
                        <li><span>Make </span>
                            <asp:DropDownList ID="ddlMake" runat="server" DataSourceID="odsMake" DataTextField="make"
                                DataValueField="makeID" SelectedValue='<%# Bind("make_ID") %>'>
                            </asp:DropDownList>
                        </li>
                        <li><span>Make Description </span>
                            <asp:DropDownList ID="ddlMakeDesc" runat="server" DataSourceID="odsMakeDetails" DataTextField="model_description"
                                DataValueField="ID" SelectedValue='<%# Bind("make_modeldesc_ID") %>'>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </fieldset>
                <fieldset>
                    <legend>Transmission </legend>
                    <ul>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkAutomatic" Text="AUTOMATIC" runat="server" 
                                Checked='<%# Bind("trans_auto") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkCVT" Text="CVT" runat="server" 
                                Checked='<%# Bind("trans_cvt") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkF1" Text="F1" runat="server" 
                                Checked='<%# Bind("trans_F1") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkGX" Text="GX" runat="server" 
                                Checked='<%# Bind("trans_GX") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkManual" Text="MANUAL" runat="server" 
                                Checked='<%# Bind("trans_manual") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkTriptonic" Text="TRIPTRONIC" runat="server" 
                                Checked='<%# Bind("trans_triptonic") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkUNSPECIFIED" Text="UNSPECIFIED" runat="server" 
                                Checked='<%# Bind("trans_unspecified") %>' />
                        </li>
                    </ul>
                </fieldset>
                <fieldset>
                    <legend>Year Range </legend>
                    <ul>
                        <li><span>From </span>
                            <asp:DropDownList ID="ddlYearfrom" runat="server" DataSourceID="odsYears" DataTextField="model"
                                DataValueField="model" SelectedValue='<%# Bind("model_year_from") %>'>
                            </asp:DropDownList>
                        </li>
                        <li><span>To </span>
                            <asp:DropDownList ID="ddlYearTo" runat="server" DataSourceID="odsYears" DataTextField="model"
                                DataValueField="model" SelectedValue='<%# Bind("model_year_till") %>'>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </fieldset>
                <center class="js_a" style="margin: 6px;">
                    <asp:LinkButton ID="btnaddfavourite" runat="server" CommandName="Insert" Text="Add Favourite"
                        CausesValidation="True" />
                    &nbsp;
                    <asp:LinkButton ID="btnClear" runat="server" Text="Clear" CommandName="Cancel" />
                    <asp:LinkButton ID="btnFavouriteList" runat="server" Text="Go to Favourite List"
                        PostBackUrl="favouritelist.aspx" />
                </center>
        
        
               
            
                    <asp:ObjectDataSource ID="odsMake" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="masterdataTableAdapters.tblmakeTableAdapter">
    </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsYears" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="masterdataTableAdapters.tblModelTableAdapter">
        </asp:ObjectDataSource>
      <asp:ObjectDataSource ID="odsMakeDetails" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="getMakeModelNames" TypeName="masterdataTableAdapters.tblmake_detailsTableAdapter">
    </asp:ObjectDataSource>
           
           </InsertItemTemplate>
            
            <EditItemTemplate>
            
              <fieldset>
                    <legend>Select Vehicle </legend>
                    <ul>
                        <li><span>Make </span>
                            <asp:DropDownList ID="ddlMake" runat="server" DataSourceID="odsMake" DataTextField="make"
                                DataValueField="makeID" SelectedValue='<%# Bind("make_ID") %>'>
                            </asp:DropDownList>
                        </li>
                        <li><span>Make Description </span>
                            <asp:DropDownList ID="ddlMakeDesc" runat="server" DataSourceID="odsMakeDetails" DataTextField="model_description"
                                DataValueField="ID" SelectedValue='<%# Bind("make_modeldesc_ID") %>'>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </fieldset>
                <fieldset>
                    <legend>Transmission </legend>
                    <ul>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkAutomatic" Text="AUTOMATIC" runat="server" 
                                Checked='<%# Bind("trans_auto") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkCVT" Text="CVT" runat="server" 
                                Checked='<%# Bind("trans_cvt") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkF1" Text="F1" runat="server" 
                                Checked='<%# Bind("trans_F1") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkGX" Text="GX" runat="server" 
                                Checked='<%# Bind("trans_GX") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkManual" Text="MANUAL" runat="server" 
                                Checked='<%# Bind("trans_manual") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkTriptonic" Text="TRIPTRONIC" runat="server" 
                                Checked='<%# Bind("trans_triptonic") %>' />
                        </li>
                        <li style="width: 200px;">
                            <asp:CheckBox ID="chkUNSPECIFIED" Text="UNSPECIFIED" runat="server" 
                                Checked='<%# Bind("trans_unspecified") %>' />
                        </li>
                    </ul>
                </fieldset>
                <fieldset>
                    <legend>Year Range </legend>
                    <ul>
                        <li><span>From </span>
                            <asp:DropDownList ID="ddlYearfrom" runat="server" DataSourceID="odsYears" DataTextField="model"
                                DataValueField="model" SelectedValue='<%# Bind("model_year_from") %>'>
                            </asp:DropDownList>
                        </li>
                        <li><span>To </span>
                            <asp:DropDownList ID="ddlYearTo" runat="server" DataSourceID="odsYears" DataTextField="model"
                                DataValueField="model" SelectedValue='<%# Bind("model_year_till") %>'>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </fieldset>
                <center class="js_a" style="margin: 6px;">
                    <asp:LinkButton ID="btnaddfavourite" runat="server" CommandName="Update" Text="Update Favourite"
                        CausesValidation="True" />
                    &nbsp;
                  
                    <asp:LinkButton ID="btnFavouriteList" runat="server" Text="Go to Favourite List"
                        PostBackUrl="favouritelist.aspx" />
                </center>
        
            
                    <asp:ObjectDataSource ID="odsMake" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="masterdataTableAdapters.tblmakeTableAdapter">
    </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsYears" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="masterdataTableAdapters.tblModelTableAdapter">
        </asp:ObjectDataSource>
      <asp:ObjectDataSource ID="odsMakeDetails" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="getMakeModelNames" TypeName="masterdataTableAdapters.tblmake_detailsTableAdapter">
    </asp:ObjectDataSource>
           
            
            </EditItemTemplate>
    
        </asp:FormView>
    
    
       
        
        <asp:ObjectDataSource ID="odsFavourite" runat="server" 
            InsertMethod="Insert_favourite" OldValuesParameterFormatString="{0}" 
            SelectMethod="GetData" 
            TypeName="dsServicesTableAdapters.Select_favourite_byIDTableAdapter" 
            UpdateMethod="Update_favourite">
            <UpdateParameters>
                <asp:Parameter Name="make_ID" Type="Int32" />
                <asp:Parameter Name="make_modeldesc_ID" Type="Int32" />
                <asp:Parameter Name="trans_auto" Type="Boolean" />
                <asp:Parameter Name="trans_cvt" Type="Boolean" />
                <asp:Parameter Name="trans_F1" Type="Boolean" />
                <asp:Parameter Name="trans_GX" Type="Boolean" />
                <asp:Parameter Name="trans_manual" Type="Boolean" />
                <asp:Parameter Name="trans_triptonic" Type="Boolean" />
                <asp:Parameter Name="trans_unspecified" Type="Boolean" />
                <asp:Parameter Name="model_year_from" Type="String" />
                <asp:Parameter Name="model_year_till" Type="String" DefaultValue="" />
                <asp:Parameter Name="status" Type="Int32" DefaultValue="1" />
                <asp:QueryStringParameter Name="favourite_ID" QueryStringField="eid" 
                    Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="favourite_id" 
                    QueryStringField="eid" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter Name="Customer_ID" SessionField="user_id" Type="Int32" />
                <asp:Parameter Name="make_ID" Type="Int32" />
                <asp:Parameter Name="make_modeldesc_ID" Type="Int32" />
                <asp:Parameter Name="trans_auto" Type="Boolean" />
                <asp:Parameter Name="trans_cvt" Type="Boolean" />
                <asp:Parameter Name="trans_F1" Type="Boolean" />
                <asp:Parameter Name="trans_GX" Type="Boolean" />
                <asp:Parameter Name="trans_manual" Type="Boolean" />
                <asp:Parameter Name="trans_triptonic" Type="Boolean" />
                <asp:Parameter Name="trans_unspecified" Type="Boolean" />
                <asp:Parameter Name="model_year_from" Type="String" />
                <asp:Parameter Name="model_year_till" Type="String" />
                <asp:Parameter Name="status" Type="Int32" DefaultValue="1" />
            </InsertParameters>
        </asp:ObjectDataSource>
       
        
    </div>
</asp:Content>

