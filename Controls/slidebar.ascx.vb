
Partial Class Controls_slidebar
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try



            If Session("validmember") <> 555 Then

                Me.Visible = False

            Else


            End If



        Catch ex As Exception

        End Try
    End Sub
End Class
