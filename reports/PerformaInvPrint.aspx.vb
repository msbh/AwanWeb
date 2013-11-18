Imports System.IO
Imports System.Data
Imports Microsoft.Reporting
Imports Microsoft.Reporting.WebForms

Partial Class reports_PerformaInvPrint
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try


            If Not Page.IsPostBack Then

                ReportViewer1.LocalReport.EnableExternalImages = True
                Dim o As New dsStockTableAdapters.newSTOCK_LISTTableAdapter
                Dim imageName As String = o.Get_StockImage(CInt(Request.QueryString("stkid")))
                Dim params(0) As ReportParameter
                params(0) = New ReportParameter("path", "http://www.awan.co.jp/cars_images/" & imageName)
                ReportViewer1.LocalReport.SetParameters(params)

            End If


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_SaveStateComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.SaveStateComplete
        Dim warnings As Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim bytes As Byte()

        Dim FolderLocation As String = Server.MapPath("~\Doc\")
        'First delete existing file
        Dim filepath As String = FolderLocation & "performa_" & Request.QueryString("id") & ".pdf"
        File.Delete(filepath)
        'Then create new pdf file

        bytes = ReportViewer1.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamids, warnings)

        Dim fs As New FileStream(FolderLocation & "performa_" & Request.QueryString("id") & ".pdf", FileMode.Create)
        fs.Write(bytes, 0, bytes.Length)
        fs.Close()

        'Set the appropriate ContentType.
        Response.ContentType = "Application/pdf"

        'Write the file directly to the HTTP output stream.
        Response.WriteFile(filepath)

        Response.End()


    End Sub



End Class
