
Partial Class becomeagent
    Inherits System.Web.UI.Page


    Protected Sub ObjectDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Inserted
        Try
            If e.ReturnValue = 1 Then
                AddErrorMessage("Enquiry Submitted successfully!")

            Else

                AddErrorMessage("Ops there seems to be some problem!")

            End If



        Catch ex As Exception

        End Try
    End Sub





    Private Sub AddErrorMessage(ByVal errorMessage As String)
        Me.Page.Validators.Add( _
                     New myCustomValidator(errorMessage, ""))
    End Sub

End Class
