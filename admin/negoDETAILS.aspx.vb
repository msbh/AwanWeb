Imports System.Data

Partial Class admin_negoDETAILS
    Inherits System.Web.UI.Page

    

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)

        If e.CommandName.ToString.ToLower = "email" Then

            Dim I As Integer = e.CommandArgument


            If Not Request.QueryString("ID") Is Nothing Then
                SendEmail(I)
            End If

        End If

    End Sub

    Private Sub SendEmail(ByVal Ref_ID As Integer)
        Try

            Dim obj As New dsServicesTableAdapters.Select_NegoEmailDetailsTableAdapter
            Dim dt As New DataTable
            dt.Merge(obj.GetData(Ref_ID, 1))

            Dim HTML_para(12), HTML_para_value(12) As String
            HTML_para(0) = "@@@Client_Name@@@"
            HTML_para(1) = "@@@Client_Email@@@"
            HTML_para(2) = "@@@Client_Phone@@@"
            HTML_para(3) = "@@@Client_Comments@@@"
            HTML_para(4) = "@@@FILE_REF@@@"
            HTML_para(5) = "@@@CHASSIS_NO@@@"
            HTML_para(6) = "@@@client_FOB_Price@@@"
            HTML_para(7) = "@@@Client_FrieghtPrice@@@"
            HTML_para(8) = "@@@Client_Vanning_Price@@@"
            HTML_para(9) = "@@@Client_Inspection_Price@@@"
            HTML_para(10) = "@@@Client_Total_Cost@@@"
            HTML_para(11) = "@@@currency_short_name@@@"
            HTML_para(12) = "@@@negtiation_ID@@@"


            HTML_para_value(0) = dt.Rows(0).Item("Client_Name").ToString
            HTML_para_value(1) = dt.Rows(0).Item("Client_Email").ToString
            HTML_para_value(2) = dt.Rows(0).Item("Client_Phone").ToString
            HTML_para_value(3) = dt.Rows(0).Item("Client_Comments").ToString
            HTML_para_value(4) = dt.Rows(0).Item("FILE_REF").ToString
            HTML_para_value(5) = dt.Rows(0).Item("CHASSIS_NO").ToString
            HTML_para_value(6) = dt.Rows(0).Item("client_FOB_Price").ToString
            HTML_para_value(7) = dt.Rows(0).Item("Client_FrieghtPrice").ToString
            HTML_para_value(8) = dt.Rows(0).Item("Client_Inspection_Price").ToString
            HTML_para_value(9) = dt.Rows(0).Item("Client_Vanning_Price").ToString
            HTML_para_value(10) = dt.Rows(0).Item("Client_Total_Cost").ToString
            HTML_para_value(11) = dt.Rows(0).Item("currency_short_name").ToString
            HTML_para_value(12) = dt.Rows(0).Item("negtiation_ID").ToString



            Dim o As New Email

            o.SendEmail(dt.Rows(0).Item("Client_Email").ToString, _
                        "Negotiation reply ref " + dt.Rows(0).Item("negtiation_ID").ToString, _
                        "~\email_templates\clientnegoEmail.htm", HTML_para, HTML_para_value)



        Catch ex As Exception

        End Try
    End Sub
End Class
