
Partial Class favouritelist
    Inherits System.Web.UI.Page

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        Try

            If e.CommandName = "view" Then




            End If





        Catch ex As Exception

        End Try
    End Sub
    

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Try

            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim hF As HiddenField = e.Row.FindControl("hmatchrecords")

                If hF.Value = 0 Then

                    Dim btn As LinkButton = e.Row.FindControl("btnMatchRecords")
                    btn.Enabled = False


                End If



            End If



        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub
End Class
