
Partial Class autoparts
    Inherits System.Web.UI.Page

    Protected Sub ObjectDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Inserted
        Try


            If e.ReturnValue = 1 Then

                AddErrorMessage("Enquiry Submitted successfully!")
                Send_Email()


            Else
                AddErrorMessage("Ops there seems to be some problem!")
            End If


        Catch ex As Exception

        End Try
    End Sub
    Private Sub Send_Email()

        Try

            Dim CustomerName As TextBox = Me.FormView1.FindControl("txtfirstname")
            Dim ClientEmail As TextBox = Me.FormView1.FindControl("txtEmail")
            Dim txtMoreDetails As TextBox = Me.FormView1.FindControl("txtMoreDetails")
          
            Dim HTML_para(2), HTML_para_value(2) As String
            HTML_para(0) = "@@@customername@@@"
            HTML_para(1) = "@@@clientemail@@@"
            HTML_para(2) = "@@@clientmsg@@@"


            HTML_para_value(0) = CustomerName.Text
            HTML_para_value(1) = ClientEmail.Text
            HTML_para_value(2) = txtMoreDetails.Text



            Dim a As New Email
            If a.SendEmail("parts@awan.co.jp", " Awan Web - AutoParts Enquiry ", "~\email_templates\parts.htm", HTML_para, HTML_para_value) = "Message transmitted successfully!" Then
                '  a.SendEmail(ClientEmail.Text, " Awan Web - Enquiry Acknowledgement ", "~\email_templates\enquiry_customerEmail.htm", HTML_para, HTML_para_value)
            End If



        Catch ex As Exception

        End Try
    End Sub
    Private Sub AddErrorMessage(ByVal errorMessage As String)
        Me.Page.Validators.Add( _
                     New MyCustomValidator(errorMessage, ""))
    End Sub

End Class
