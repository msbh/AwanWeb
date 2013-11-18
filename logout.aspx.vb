
Partial Class logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            Session.Clear()
            Session("validmember") = Nothing
            Session("user_id") = Nothing
            Session("username") = Nothing
           
            Response.Redirect("default.aspx")




        Catch ex As Exception

        End Try
    End Sub
End Class
