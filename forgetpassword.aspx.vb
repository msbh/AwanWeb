
Partial Class forgetpassword
    Inherits System.Web.UI.Page
    Private Sub AddErrorMessage(ByVal errorMessage As String)
        Me.Page.Validators.Add( _
                     New MyCustomValidator(errorMessage, ""))
    End Sub

    Protected Sub btnRecoverPassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRecoverPassword.Click
        Try



            Dim o As New membersTableAdapters.select_memberTableAdapter
            Dim recoveredpassword As String = o.Get_Password(TextBox1.Text)
            Dim msg() As String = recoveredpassword.Split("@")

            If msg.Length > 1 Then

                AddErrorMessage(msg(1))


            End If



        Catch ex As Exception

        End Try
    End Sub
End Class
