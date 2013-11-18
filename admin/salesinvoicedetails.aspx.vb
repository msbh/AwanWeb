Imports System.Data
Imports System.IO
Imports Microsoft.Reporting.WebForms


Partial Class admin_salesinvoicedetails
    Inherits System.Web.UI.Page





    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try

            Dim stock_ID As HiddenField = Me.FormView1.FindControl("HStock_ID")
            Dim stkid As Integer = stock_ID.Value

            Response.Redirect("~/reports/salesinvprint.aspx?id=" & Request.QueryString("ID") & "&stkid=" & stkid, False)



        Catch ex As Exception

        End Try
    End Sub

    Protected Sub lnkfinalize_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try


            GeneratePDF()

            Dim obj As New dsAdminTableAdapters.Select_SaleInvoiceEmailTableAdapter
            Dim dt As New DataTable



            dt.Merge(obj.GetData(Request.QueryString("id")))

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
            Dim lbl As Label = FormView1.FindControl("lblmessage")
            lbl.Visible = True

            lbl.Text = o.SendEmail(dt.Rows(0).Item("Email").ToString, "Sales Invoice Ref quote " + dt.Rows(0).Item("Quote_Ref").ToString, _
                        "~\email_templates\saleInvoiceEmail.htm", HTML_para, HTML_para_value, GeneratePDF)



        Catch ex As Exception

        End Try
    End Sub

    Private Function GeneratePDF() As String
        Try
            Dim warnings As Warning() = Nothing
            Dim streamids As String() = Nothing
            Dim mimeType As String = Nothing
            Dim encoding As String = Nothing
            Dim extension As String = Nothing
            Dim bytes As Byte()

            Dim FolderLocation As String = Server.MapPath("~\Doc\")
            'First delete existing file

            Dim filepath As String = FolderLocation & "invoice_" & Request.QueryString("id") & ".pdf"
            File.Delete(filepath)
            'Then create new pdf file

            bytes = ReportViewer1.LocalReport.Render("PDF", Nothing, mimeType, encoding, extension, streamids, warnings)

            Dim fs As New FileStream(FolderLocation & "invoice_" & Request.QueryString("id") & ".pdf", FileMode.Create)
            fs.Write(bytes, 0, bytes.Length)
            fs.Close()

          

            Return filepath


        Catch ex As Exception



            Return String.Empty

        End Try
    End Function


   
   
    Protected Sub ddlcountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Try

            Dim dsc As SqlDataSource = FormView1.FindControl("odscountry")
            Dim ddl1 As DropDownList = FormView1.FindControl("ddlcountry")
            Dim ddl2 As DropDownList = FormView1.FindControl("ddlport")
            dsc.SelectParameters(0).DefaultValue = ddl1.SelectedValue
            ddl2.DataBind()




        Catch ex As Exception

        End Try
    End Sub

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        Try

       
            If FormView1.CurrentMode = FormViewMode.Edit Then
                Dim dv As System.Data.DataRowView = FormView1.DataItem
                Dim ddl2 As DropDownList = FormView1.FindControl("ddlport")
                Dim dsc As AccessDataSource = FormView1.FindControl("odscountry")
                Dim m As String = dv("country_id")
                dsc.SelectParameters("country_id").DefaultValue = m
                ddl2.DataBind()
                If Not IsDBNull(dv("Port_ID")) Then
                    ddl2.SelectedValue = dv("Port_ID")
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

  

    Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        Try

            Dim ddl2 As DropDownList = FormView1.FindControl("ddlport")
            e.NewValues("Port_ID") = ddl2.SelectedValue

        Catch ex As Exception

        End Try
    End Sub


End Class
