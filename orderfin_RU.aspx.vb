Imports System.Data
Imports System.IO
Imports Microsoft.Reporting.WebForms

Partial Class orderfin
    Inherits System.Web.UI.Page

    Protected Sub btnfinalize_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnfinalize.Click
        Try

            Dim o As New membersTableAdapters.quotationTableAdapter
            Dim i As Integer = o.Insert_Quote(CInt(Session("order_id")))

            Session.Add("quote_id", i)
            Hquote_ID.Value = Session("quote_id")

            btnBack.Visible = False
            btnBack2.Visible = False
            btnfinalize.Visible = False
            btnfinalize2.Visible = False


            btnBacktoStock.Visible = True
            btnPrint.Visible = True


            lblmessage.Visible = True
            lblmessage.Text = " Your quotation is finalized. A performa Invoice will be send with in two days !"

            SendEmail(i)


        Catch ex As Exception

        End Try
    End Sub
    Private Sub SendEmail(ByVal Ref_ID As Integer)
        Try

            GeneratePDF(Ref_ID)

            Dim obj As New membersTableAdapters.Select_QuoteEmailTableAdapter
            Dim dt As New DataTable
            dt.Merge(obj.GetData(Ref_ID))

            Dim HTML_para(10), HTML_para_value(10) As String
            HTML_para(0) = "@@@customername@@@"
            HTML_para(1) = "@@@email@@@"
            HTML_para(2) = "@@@stkref@@@"
            HTML_para(3) = "@@@chassisno@@@"
            HTML_para(4) = "@@@make@@@"
            HTML_para(5) = "@@@makemodel@@@"
            HTML_para(6) = "@@@color@@@"
            HTML_para(7) = "@@@year@@@"
            HTML_para(8) = "@@@FirstName_Con@@@"
            HTML_para(9) = "@@@Email_Con@@@"
            HTML_para(10) = "@@@Quote_Ref@@@"
            HTML_para_value(0) = dt.Rows(0).Item("FirstName").ToString
            HTML_para_value(1) = dt.Rows(0).Item("Email").ToString
            HTML_para_value(2) = dt.Rows(0).Item("FILE_REF").ToString
            HTML_para_value(3) = dt.Rows(0).Item("CHASSIS_NO").ToString
            HTML_para_value(4) = dt.Rows(0).Item("make").ToString
            HTML_para_value(5) = dt.Rows(0).Item("model_description").ToString
            HTML_para_value(6) = dt.Rows(0).Item("color").ToString
            HTML_para_value(7) = dt.Rows(0).Item("MODEL").ToString
            HTML_para_value(8) = dt.Rows(0).Item("FirstName_Con").ToString
            HTML_para_value(9) = dt.Rows(0).Item("Email_Con").ToString
            HTML_para_value(10) = dt.Rows(0).Item("Quote_Ref").ToString

            Dim o As New Email
            'Dim lbl As Label = FormView1.FindControl("lblmessage")
            'lbl.Visible = True

            o.SendEmail(dt.Rows(0).Item("Email").ToString, "Online quotation ref " + dt.Rows(0).Item("Quote_Ref").ToString, _
                        "~\email_templates\quoteEmail.htm", HTML_para, HTML_para_value, GeneratePDF(Ref_ID))



        Catch ex As Exception

        End Try
    End Sub

    Private Function GeneratePDF(ByVal Ref_ID As Integer) As String
        Try
            Dim warnings As Warning() = Nothing
            Dim streamids As String() = Nothing
            Dim mimeType As String = Nothing
            Dim encoding As String = Nothing
            Dim extension As String = Nothing
            Dim bytes As Byte()

            Dim FolderLocation As String = Server.MapPath("~\Doc\")
            'First delete existing file
            Dim filepath As String = FolderLocation & "quote_" & Ref_ID.ToString & ".pdf"
            File.Delete(filepath)
            'Then create new pdf file


         

         



            bytes = reportviewer1.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamids, warnings)

            Dim fs As New FileStream(FolderLocation & "quote_" & Ref_ID.ToString & ".pdf", FileMode.Create)
            fs.Write(bytes, 0, bytes.Length)
            fs.Close()


            Return filepath


        Catch ex As Exception

            '   lblerror.Text = ex.Message

            Return String.Empty

        End Try
    End Function

   

    Protected Sub btnfinalize2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnfinalize2.Click
        Try
            Dim o As New membersTableAdapters.quotationTableAdapter
            Dim i As Integer = o.Insert_Quote(CInt(Session("order_id")))

            Session.Add("quote_id", i)

            Hquote_ID.Value = Session("quote_id")


            btnBack.Visible = False
            btnBack2.Visible = False
            btnfinalize.Visible = False
            btnfinalize2.Visible = False


            btnBacktoStock.Visible = True
            btnPrint.Visible = True


            lblmessage.Visible = True
            lblmessage.Text = " Your quotation is finalized. A performa Invoice will be send with in two days !"


        Catch ex As Exception

        End Try
      
    End Sub

    Protected Sub ReportViewer1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReportViewer1.Load
        Try

            Dim o As New dsStockTableAdapters.newSTOCK_LISTTableAdapter
            ReportViewer1.LocalReport.EnableExternalImages = True
            Dim f As HiddenField = Me.FormView1.FindControl("Hstock_ID")
            Dim imageName As String = o.Get_StockImage(CInt(f.Value))
            Dim params(0) As ReportParameter
            params(0) = New ReportParameter("path", "http://www.awan.co.jp/cars_images/" & imageName)
            ReportViewer1.LocalReport.SetParameters(params)



        Catch ex As Exception

        End Try
    End Sub
End Class
