
Partial Class enquiry
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try



            If Not Page.IsPostBack Then


                If Not Request.QueryString("id") Is Nothing Then
                    HStock_ID.Value = Request.QueryString("id").ToString
                End If
                Session.Add("customer_Id", 0)


            End If


        Catch ex As Exception

        End Try
    End Sub
    Private Sub Send_Email()

        Try

            Dim CustomerName As TextBox = Me.FormView1.FindControl("txtFirstName")
            Dim ClientEmail As TextBox = Me.FormView1.FindControl("txtEmail")
            Dim StockRef As HiddenField = Me.FormView1.FindControl("FormView2").FindControl("HstockID")
            Dim Chassis_NO As TextBox = Me.FormView1.FindControl("FormView2").FindControl("txtChassisno")

            Dim ClientMsg As TextBox = Me.FormView1.FindControl("txtmessage")

            Dim HTML_para(4), HTML_para_value(4) As String
            HTML_para(0) = "@@@customername@@@"
            HTML_para(1) = "@@@clientemail@@@"
            HTML_para(2) = "@@@StockRef@@@"
            HTML_para(3) = "@@@clientmsg@@@"
            HTML_para(4) = "@@@chassis_no@@@"

            HTML_para_value(0) = CustomerName.Text
            HTML_para_value(1) = ClientEmail.Text
            HTML_para_value(2) = StockRef.Value
            HTML_para_value(3) = ClientMsg.Text
            HTML_para_value(4) = Chassis_NO.Text


            Dim a As New Email
            If a.SendEmail("info@awan.co.jp", " Awan Web - Client Enquiry ", "~\email_templates\enquiry.htm", HTML_para, HTML_para_value) = "Message transmitted successfully!" Then
                a.SendEmail(ClientEmail.Text, " Awan Web - Enquiry Acknowledgement ", "~\email_templates\enquiry_customerEmail.htm", HTML_para, HTML_para_value)
            End If



        Catch ex As Exception

        End Try
    End Sub
    Protected Sub odsEnquiry_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles odsEnquiry.Inserted
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


    Private Sub AddErrorMessage(ByVal errorMessage As String)
        Me.Page.Validators.Add( _
                     New MyCustomValidator(errorMessage, ""))
    End Sub




End Class
