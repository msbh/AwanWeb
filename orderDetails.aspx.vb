
Partial Class orderDetails
    Inherits System.Web.UI.Page

    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click
        Try

            Response.Redirect("orderconsignee.aspx?uid=" & Session("user_id") & "&qid=" & Session("order_id"))





        Catch ex As Exception

        End Try
    End Sub
End Class
