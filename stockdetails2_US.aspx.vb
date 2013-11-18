
Partial Class stockdetails2
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



            End If




        Catch ex As Exception

        End Try
    End Sub
End Class
