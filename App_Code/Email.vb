Imports Microsoft.VisualBasic
Imports System.Net.Mail
Imports System.IO
Imports System


Public Class Email


    Public Function SendEmail(ByVal ToStr As String, ByVal StrSubject As String, ByVal HTMLpath As String, ByVal HTML_para() As String, ByVal HTML_para_value() As String) As String

        Try
            Dim mail As New MailMessage()
            Dim ccStr As String = "sales_pk@awan.co.jp"


            '            'Start by creating a mail message object

            'DimMyMailMessage As New MailMessage()

            'From requires an instance of the MailAddress type

            mail.From = New MailAddress("info@awan.co.jp", "Awan International K.K")
            mail.To.Add(ToStr)






            mail.CC.Add(ccStr)
            mail.Subject = StrSubject


            ' mail.To.Add(ToStr)
            '  mail.CC.Add(ccStr)
            mail.IsBodyHtml = True


            mail.Body = get_HTMLmessageFormat(HTMLpath, HTML_para, HTML_para_value)

            Dim mailer As New SmtpClient("localhost")
            mailer.Send(mail)

            Return "Message transmitted successfully!"

        Catch ex As Exception
            Return ex.Message
        End Try
    End Function
    Public Function SendEmail(ByVal ToStr As String, ByVal StrSubject As String, ByVal HTMLpath As String, _
                              ByVal HTML_para() As String, ByVal HTML_para_value() As String, _
                              ByVal AttachmentFilePath As String) As String

        Try
            Dim mail As New MailMessage()
            Dim ccStr As String = "sales_pk@awan.co.jp"

            '            'Start by creating a mail message object

            'DimMyMailMessage As New MailMessage()

            'From requires an instance of the MailAddress type

            mail.From = New MailAddress("info@awan.co.jp", "Awan International K.K")
            mail.To.Add(ToStr)
            mail.CC.Add(ccStr)
            mail.Subject = StrSubject

            mail.IsBodyHtml = True
            mail.Body = get_HTMLmessageFormat(HTMLpath, HTML_para, HTML_para_value)


            mail.Attachments.Add(New Attachment(AttachmentFilePath))


            Dim mailer As New SmtpClient("localhost")
            mailer.Send(mail)

            Return "Message transmitted successfully!"

        Catch ex As Exception
            Return ex.Message
        End Try
    End Function

    Private Function get_HTMLmessageFormat(ByVal HTML_filename As String, ByVal HTML_para() As String, ByVal HTML_para_value() As String) As String
        Dim HTML_text As String = String.Empty
        Dim HTML_main As String = String.Empty
        Dim HTML_return As String = String.Empty

        Try
            Dim re As StreamReader

            re = File.OpenText(System.Web.HttpContext.Current.Server.MapPath(HTML_filename))
            If Not re Is Nothing Then
            End If

            HTML_text = re.ReadToEnd
            Dim cnt As Integer = HTML_para.Length
            For i As Integer = 0 To cnt - 1
                HTML_text = HTML_text.Replace(HTML_para(i), HTML_para_value(i))
            Next



            Return HTML_text


        Catch ex As Exception


            Return String.Empty



        End Try
    End Function

End Class
