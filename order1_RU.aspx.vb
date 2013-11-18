
Partial Class order1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try


            If Not Session("user_id") Is Nothing And Session("validmember") = "555" Then


            Else

                Response.Redirect("loginpage.aspx?id=" & Request.QueryString("id") & "&i=" & Request.QueryString("i"))

            End If



            If Not Request.QueryString("id") Is Nothing Then
                Dim Stock_ID As Integer = CInt(Request.QueryString("id"))
                Dim i As Integer = CInt(Request.QueryString("i"))
                If i = 1 Then
                    Dim obj As New membersTableAdapters.CustomerOrderTableAdapter
                    Dim Order_ID As Integer = obj.insert_CO_returnID(CInt(Session("user_id")), Stock_ID, Session.SessionID)
                    Session.Add("order_id", Order_ID)
                    H_OrderID.Value = Order_ID

                End If
            End If




        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound
        Try

            Dim lblfobprice As Label = e.Item.FindControl("lblfobprice")
            Dim hfobprice As HiddenField = e.Item.FindControl("hfobprice")

            Dim ddlCurr As DropDownList = e.Item.FindControl("ddlCurr")

            ddlCurr.Attributes.Add("onchange", "javascript:calcurr('" + ddlCurr.ClientID + "','" + lblfobprice.ClientID + "','" + hfobprice.ClientID + "');")



        Catch ex As Exception

        End Try
    End Sub
End Class
