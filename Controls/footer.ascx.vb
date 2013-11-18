
Partial Class Controls_footer
    Inherits System.Web.UI.UserControl

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Try
            Dim HTML_para(4), HTML_para_value(4) As String
            HTML_para(0) = "@@@customername@@@"
            HTML_para(1) = "@@@email@@@"
            HTML_para_value(0) = txtclientname.Text
            HTML_para_value(1) = Me.txtclientemail.Text.ToString.Trim

            HTML_para(2) = "@@@country@@@"
            HTML_para_value(2) = txtCountry.Value
            HTML_para(3) = "@@@skypeid@@@"
            HTML_para_value(3) = txtclientskype.Value
            HTML_para(4) = "@@@comments@@@"
            HTML_para_value(4) = txtclientcomments.Text

            Dim a As New Email
            Me.lblmessage.Text = a.SendEmail("info@awan.co.jp", " Awan Web - Quick Contact", "~\email_templates\general_enquiry.htm", HTML_para, HTML_para_value)





        Catch ex As Exception

        End Try
    End Sub
End Class
