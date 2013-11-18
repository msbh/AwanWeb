Imports System.Data

Partial Class nego2
    Inherits System.Web.UI.Page
    Private Function display_att() As String
        Try
            Dim obj As New dsStockTableAdapters.veh_attributesTableAdapter
            Dim dt As New Data.DataTable
            dt.Merge(obj.GetData(Request.QueryString("ID")))
            Dim strFLDs As String = String.Empty

            Dim cnt As Integer = obj.GetData(Request.QueryString("ID")).Columns.Count
            For i As Integer = 0 To cnt - 1
                If dt.Rows(0).Item(i) = True Then
                    strFLDs = "'" & dt.Columns(i).ColumnName & "'" + "," + strFLDs
                End If
            Next

            strFLDs = strFLDs.Remove(strFLDs.Length - 1, 1)


            Return strFLDs

        Catch ex As Exception
            Return Nothing

        End Try



    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            If Not Page.IsPostBack Then


                Dim strFields As String = display_att()
                Dim dl As DataList = Me.FormView1.FindControl("datalist1")
                dl.DataSource = Dataaccess.fill_datatable("select att_name from att_names where att_id in (" & strFields & ")", "att_names")
                dl.DataBind()



                If Not Session("user_id") Is Nothing And Session("validmember") = "555" Then



                    Dim o As New membersTableAdapters.Select_MemberAddressTableAdapter
                    Dim dt As New Data.DataTable
                    dt.Merge(o.Select_MemberAddress(CInt(Session("user_id"))))

                    If dt.Rows.Count > 0 Then

                        Dim txtFirstName As TextBox = Me.FormView1.FindControl("txtcustomername")
                        txtFirstName.Text = dt.Rows(0).Item("firstname").ToString

                        Dim txtEmail As TextBox = Me.FormView1.FindControl("txtcustomerEmail")
                        txtEmail.Text = dt.Rows(0).Item("email").ToString

                        Dim txtPhone As TextBox = Me.FormView1.FindControl("txtcustomer_phone")
                        txtPhone.Text = dt.Rows(0).Item("phoneno").ToString
                 
                    

                    End If

                Else

                    Session.Add("user_id", 0)



                End If




            End If




        Catch ex As Exception

        End Try
    End Sub

   



    Private Sub SendEmail(ByVal Ref_ID As Integer)
        Try

            Dim obj As New dsServicesTableAdapters.Select_NegoEmailDetailsTableAdapter
            Dim dt As New DataTable
            dt.Merge(obj.GetData(Ref_ID, 0))

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
      
            o.SendEmail("info@awan.co.jp", _
                        "Client Negotiation ref " + dt.Rows(0).Item("negtiation_ID").ToString, _
                        "~\email_templates\negoEmail.htm", HTML_para, HTML_para_value)



        Catch ex As Exception

        End Try
    End Sub

    Protected Sub odsnegotiate_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles odsnegotiate.Updated
        Try

            If e.ReturnValue > 0 Then


                lblmessage.Visible = True

                Dim lnkUpdate As LinkButton = Me.FormView1.FindControl("Update")
                lnkUpdate.Enabled = False


                SendEmail(e.ReturnValue)




            End If


        Catch ex As Exception

        End Try
    End Sub
End Class
