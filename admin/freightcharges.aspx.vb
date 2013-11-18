
Partial Class admin_freightcharges
    Inherits System.Web.UI.Page

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        Try


            If FormView1.CurrentMode = FormViewMode.Insert Then
                Dim dv As System.Data.DataRowView = FormView1.DataItem
                Dim ddl2 As DropDownList = FormView1.FindControl("ddlport")
                Dim dsc As ObjectDataSource = FormView1.FindControl("odscountry")
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

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted

        Dim i As Integer = e.AffectedRows



        'Dim a As String = e.Exception.InnerException.ToString



        If i = -1 Then

            Me.lblmessage.Text = "Saved Successfully!"
        Else

            Me.lblmessage.Text = "Not saved!"


        End If

    End Sub



  
   



   
    Protected Sub ddlCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Try

            Dim dsc As ObjectDataSource = FormView1.FindControl("odscountry")
            Dim ddl1 As DropDownList = FormView1.FindControl("ddlcountry")
            Dim ddl2 As DropDownList = FormView1.FindControl("ddlport")
            dsc.SelectParameters(0).DefaultValue = ddl1.SelectedValue
            ddl2.DataBind()




        Catch ex As Exception

        End Try
       

    End Sub

  
    Protected Sub FormView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView1.ItemInserting
        Try

            Dim ddl2 As DropDownList = FormView1.FindControl("ddlport")
            e.Values("port_ID") = ddl2.SelectedValue

          



        Catch ex As Exception

        End Try
    End Sub

    Protected Sub odsTransstatus_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles odsTransstatus.Inserting
        Try

            Dim str As String = String.Empty

            For i As Integer = 0 To 5

                str = str + "," + e.InputParameters(i).ToString


            Next



        Catch ex As Exception

        End Try
    End Sub



    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim lkbtn As LinkButton = e.Row.Cells(0).FindControl("lnkdelete")
                lkbtn.Attributes.Add("onclick", "return ConfirmOnDelete('" + e.Row.Cells(3).Text + "');")

            End If

        Catch ex As Exception

        End Try
    End Sub





End Class
