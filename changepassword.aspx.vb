
Partial Class changepassword
    Inherits System.Web.UI.Page

  

    Protected Sub ChangePasswordPushButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try

            If Not Session("user_id") Is Nothing Then

                Me.lblmessages.Visible = True

                Dim o As New dsAdminTableAdapters.passwordTableAdapter
                Me.lblmessages.Text = o.ChangePassword(CInt(Session("user_id")), ChangePassword1.CurrentPassword.ToString, ChangePassword1.NewPassword.ToString, ChangePassword1.ConfirmNewPassword.ToString)


            End If



        Catch ex As Exception

        End Try
    End Sub
End Class
