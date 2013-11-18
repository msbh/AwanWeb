
Partial Class stocklist
    Inherits System.Web.UI.Page

   

    Protected Sub cmdsearch1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdsearch1.Click


        Response.Redirect("stocklist.aspx?lv=1" & Search_String())


    End Sub
 
    Private Function Search_String() As String
        Try
            Dim Str As String = String.Empty

            'MAKE, makemodel, color,
            'makecat, globaloc, displaytype, model, model2,
            If ddlMake.SelectedValue <> 0 Then
                Str = Str + "&make=" & ddlMake.SelectedValue
            End If
            If ddlMakeModel.SelectedValue <> 0 Then
                Str = Str + "&makemodel=" & ddlMakeModel.SelectedValue
            End If
            If ddlcolor.SelectedValue <> 0 Then
                Str = Str + "&color=" & ddlcolor.SelectedValue
            End If
            If ddlCat.SelectedValue <> 0 Then
                Str = Str + "&makecat=" & ddlCat.SelectedValue
            End If
            If ddlcountry.SelectedValue <> 0 Then
                Str = Str + "&globaloc=" & ddlcountry.SelectedValue
            End If
            'ava, trans, cost1, cost2, 

            If ddlYear.SelectedValue.ToString <> "Any" Then
                Str = Str + "&model=" & ddlYear.SelectedValue.ToString
            End If
            If ddlYear2.SelectedValue.ToString <> "Any" Then
                Str = Str + "&model2=" & ddlYear2.SelectedValue.ToString
            End If

            'If ava <> "Any" Then
            '    Str = Str + "&ava=" & ddlYear2.SelectedValue.ToString
            'End If

            If ddltransmission.SelectedValue <> "Any" Then
                Str = Str + "&trans=" & ddltransmission.SelectedValue.ToString

            End If

            If ddlcost1.SelectedValue.ToString <> "" Then
                Str = Str + "&cost1=" & ddlcost1.SelectedValue.ToString

            End If

            If ddlcost2.SelectedValue.ToString <> "" Then
                Str = Str + "&cost2=" & ddlcost2.SelectedValue.ToString

            End If

            ', , , 

            If rdfuelType.SelectedValue <> "" Then
                Str = Str + "&fuel_type=" & rdfuelType.SelectedValue.ToString
            End If

            If rdDrive.SelectedValue.ToString <> "" Then
                Str = Str + "&drive=" & rdDrive.SelectedValue.ToString
            End If


            If Me.ddldoor.SelectedValue.ToString <> "" Then
                Str = Str + "&door=" & ddldoor.SelectedValue.ToString
            End If

            If String.IsNullOrEmpty(txtchassis_no.Text) = False Then
                Str = Str + "&chassi=" & txtchassis_no.Text
            End If

            '    Str = Str.Remove(0, 1)


            Return Str


        Catch ex As Exception

            Return String.Empty

        End Try
    End Function

    Protected Sub cmdsearch2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdsearch2.Click
        Response.Redirect("stocklist.aspx?" & Search_String())

    End Sub

    Protected Sub ListView1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles ListView1.ItemDataBound

 
         Try
            Dim lblfobprice As System.Web.UI.HtmlControls.HtmlGenericControl = e.Item.FindControl("lblfobprice")
            Dim hfobprice As System.Web.UI.HtmlControls.HtmlGenericControl = e.Item.FindControl("hfobprice")
           
            Dim ddlCurr As DropDownList = e.Item.FindControl("ddlcurr")

            ddlCurr.Attributes.Add("onchange", "javascript:calcurr('" + ddlCurr.ClientID + "','" + lblfobprice.ClientID + "','" + hfobprice.ClientID + "');")


        Catch ex As Exception

        End Try

    End Sub
    Private Sub Set_Controls()
        Try
            Dim Str As String = String.Empty

         
            If Not Request.QueryString("make") Is Nothing Then
                ddlMake.SelectedValue = Request.QueryString("make")

            End If
         
            If Not Request.QueryString("makemodel") Is Nothing Then
                ddlMakeModel.SelectedValue = Request.QueryString("makemodel")
            End If
            If Not Request.QueryString("color") Is Nothing Then
                ddlcolor.SelectedValue = Request.QueryString("color")
            End If
            If Not Request.QueryString("makecat") Is Nothing Then
                ddlCat.SelectedValue = Request.QueryString("makecat")

            End If
            If Not Request.QueryString("globaloc") Is Nothing Then
                ddlcountry.SelectedValue = Request.QueryString("globaloc")
            End If


            If Not Request.QueryString("model") Is Nothing Then
                ddlYear.SelectedValue = Request.QueryString("model")
            End If


            If Not Request.QueryString("model2") Is Nothing Then
                ddlYear.SelectedValue = Request.QueryString("model2")
            End If

            If Not Request.QueryString("trans") Is Nothing Then
                ddltransmission.SelectedValue = Request.QueryString("trans")

            End If

            If Not Request.QueryString("cost1") Is Nothing Then
                ddlcost1.SelectedValue = Request.QueryString("cost1")

            End If

            If Not Request.QueryString("cost2") Is Nothing Then
                ddlcost2.SelectedValue = Request.QueryString("cost2")

            End If

            ', , , 

            If Not Request.QueryString("fuel_type") Is Nothing Then
                rdfuelType.SelectedValue = Request.QueryString("fuel_type")
            End If

            If Not Request.QueryString("drive") Is Nothing Then
                rdDrive.SelectedValue = Request.QueryString("drive")
            End If


            If Not Request.QueryString("door") Is Nothing Then
                ddldoor.SelectedValue = Request.QueryString("door")
            End If

            If Not Request.QueryString("chassi") Is Nothing Then
                txtchassis_no.Text = Request.QueryString("chassi")
            End If





        Catch ex As Exception

        End Try
    End Sub



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try



            If Not Page.IsPostBack Then

                Set_Controls()

            End If





        Catch ex As Exception

        End Try
    End Sub
End Class
