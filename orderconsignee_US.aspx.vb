
Partial Class orderconsignee
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try


            If Not Page.IsPostBack Then

                If Not Request.QueryString("uid") Is Nothing Then
                    Dim order_id As Integer = Request.QueryString("uid")
                    Dim o As New membersTableAdapters.Select_MemberAddressTableAdapter
                    Dim dt As New Data.DataTable
                    dt.Merge(o.Select_MemberAddress(CInt(Session("user_id"))))

                    If dt.Rows.Count > 0 Then
                        txtname_con.Text = dt.Rows(0).Item("firstname").ToString
                        txtEmail_con.Text = dt.Rows(0).Item("email").ToString
                        txtAddress_con.Text = dt.Rows(0).Item("address").ToString

                        ddlcountry_con.SelectedValue = dt.Rows(0).Item("country_id")
                        txtCity_Con.Text = dt.Rows(0).Item("city").ToString
                        txtPhone_con.Text = dt.Rows(0).Item("phoneno").ToString
                        txtFax_Con.Text = dt.Rows(0).Item("faxno").ToString






                    End If




                End If





            End If



        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click
        Try
            Dim O As New membersTableAdapters.Select_Quotation_TempTableAdapter
            Dim msg As String = O.Update_quote_temp(txtEmail_con.Text, txtname_con.Text, ddlcountry_con.SelectedValue, txtCity_Con.Text, _
                                 txtPhone_con.Text, txtFax_Con.Text, txtAddress_con.Text, txtEmail_Not.Text, _
                                  txtName_not.Text, ddlCountry_Not.SelectedValue, txtCity.Text, txtPhone_Not.Text, _
                                   txtFax_Not.Text, txtAddress_Not.Text, CInt(rdPaymentOptions.SelectedValue), txtComments.Text, CInt(Session("order_id")), CInt(Session("user_id")))

            Response.Redirect("orderfin.aspx?qid=" & Session("order_id") & "")




        Catch ex As Exception

        End Try
    End Sub
End Class
