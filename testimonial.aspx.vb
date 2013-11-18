
Partial Class order
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            If Not Page.IsPostBack Then

                Session.Add("session_id", Session.SessionID)



            End If



        Catch ex As Exception

        End Try
    End Sub

    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InsertButton.Click
        Try

            Dim o As New membersTableAdapters.TEMP_quotationTableAdapter


            o.Insert(CInt(Session("user_id")), Me.ddlCountry.SelectedValue, Me.ddlport.SelectedValue, Me.RadioButtonList1.SelectedValue, _
                      1, CInt(Session("order_id")), Session.SessionID, CheckBox1.Checked, ddlshipment.SelectedValue)

            Response.Redirect("orderdetails.aspx?qid=" & Session("order_id") & "")

        Catch ex As Exception


        End Try
    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

    End Sub
End Class
