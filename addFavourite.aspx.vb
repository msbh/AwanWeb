Imports System.Data


Partial Class addFavourite
    Inherits System.Web.UI.Page

    'Protected Sub btnaddfavourite_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnaddfavourite.Click
    '    Try

    '        Dim o As New dsServicesTableAdapters.favouriteTableAdapter
    '        o.Insert(CInt(Session("user_id")), ddlMake.SelectedValue, _
    '                 ddlMakeDesc.SelectedValue, chkAutomatic.Checked, chkCVT.Checked, chkF1.Checked, _
    '                 chkGX.Checked, chkManual.Checked, chkTriptonic.Checked, chkUNSPECIFIED.Checked, _
    '                  ddlYearfrom.SelectedValue, ddlYearTo.SelectedValue, 1)







    '    Catch ex As Exception

    '    End Try
    'End Sub

    'Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlYearTo.SelectedIndexChanged

    'End Sub

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    Try

    '        If Not Page.IsPostBack Then

    '            If Not Request.QueryString("eid") Is Nothing Then







    '            End If



    '        End If




    '    Catch ex As Exception

    '    End Try
    'End Sub

    'Private Sub Load_Favourite_ByID(ByVal Favourite_ID As Integer)

    '    Try

    '        Dim dt As New DataTable
    '        Dim o As New dsServicesTableAdapters.Select_favourite_byIDTableAdapter
    '        dt.Merge(o.GetData(Favourite_ID))

    '        With dt.Rows(0)

    '            ddlMake.SelectedValue = .Item("make_id").ToString
    '            ddlMakeDesc.SelectedValue = .Item("make_modeldesc_id").ToString
    '            ddlYearfrom.SelectedValue = .Item("model_year_from").ToString
    '            ddlYearTo.SelectedValue = .Item("model_year_to").ToString
    '            chkAutomatic




    '        End With




    '    Catch ex As Exception

    '    End Try


    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            If Not Request.QueryString("eid") Is Nothing Then

                Me.FormView1.DefaultMode = FormViewMode.Edit
            Else
                Me.FormView1.DefaultMode = FormViewMode.Insert




            End If



        Catch ex As Exception

        End Try
    End Sub
End Class
