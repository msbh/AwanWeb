
Partial Class admin_colors
    Inherits System.Web.UI.Page

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted

        Dim i As Integer = e.AffectedRows

        If i = -1 Then

            Me.lblmessage.Text = "Saved Successfully!"
        Else

            Me.lblmessage.Text = "Not saved!"


        End If

    End Sub

   
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        Try
            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim lkbtn As LinkButton = e.Row.Cells(0).FindControl("lnkdelete")
                lkbtn.Attributes.Add("onclick", "return ConfirmOnDelete('" + e.Row.Cells(1).Text + "');")

            End If

        Catch ex As Exception

        End Try

    End Sub
End Class
