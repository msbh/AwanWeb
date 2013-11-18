Imports System.Data

Partial Class admin_quoteadmindetail
    Inherits System.Web.UI.Page

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try



            Dim o As New membersTableAdapters.perfinvoiceTableAdapter
            Dim iPerforma As Integer = o.Insert_perfinvoice(CInt(Request.QueryString("id")))

            
            Response.Redirect("perfInvoicedetail.aspx?id=" & CStr(iPerforma), False)




        Catch ex As Exception

        End Try
    End Sub


   
    Protected Sub odsquote_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles odsquote.Updating
        Try

            For i As Integer = 0 To e.InputParameters.Count - 1



            Next


        Catch ex As Exception

        End Try
    End Sub
End Class
