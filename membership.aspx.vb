
Partial Class membership
    Inherits System.Web.UI.Page
    Private Sub AddErrorMessage(ByVal errorMessage As String)
        Me.Page.Validators.Add( _
                     New MyCustomValidator(errorMessage, ""))
    End Sub

    Protected Sub ObjectDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Inserted
        Try

            If e.ReturnValue.ToString = "2" Then

                lblmessage.Visible = True

            End If

            

        Catch ex As Exception

        End Try
    End Sub

 
End Class
