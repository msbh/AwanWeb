
Partial Class LoginPage
    Inherits System.Web.UI.Page

   

    Private Sub AddErrorMessage(ByVal errorMessage As String)
        Me.Page.Validators.Add( _
                     New MyCustomValidator(errorMessage, ""))
    End Sub

   
    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Try


            If Login1.UserName.ToString <> String.Empty And Login1.Password.ToString <> String.Empty Then

                Dim dt As New Data.DataTable
                Dim obj As New membersTableAdapters.IsValid_MembersTableAdapter
                dt.Merge(obj.IsValidMember(Login1.UserName.ToString))

                If dt.Rows.Count > 0 Then




                    Session.Add("user_id", dt.Rows(0).Item("customer_ID").ToString)
                    Session.Add("username", dt.Rows(0).Item("firstName").ToString)
                    Session.Add("validmember", 555)

                    If Not Request.QueryString("id") Is Nothing Then
                        Dim Stock_ID As Integer = CInt(Request.QueryString("id"))
                        Dim i As Integer = CInt(Request.QueryString("i"))
                        Response.Redirect("order1.aspx?id=" & Stock_ID & "&i=1")

                    Else
                        Response.Redirect("stocklist.aspx?lv=1")

                    End If




                Else

                    AddErrorMessage("Invalid UserName or Password!")

                End If




            End If






        Catch ex As Exception

        End Try
    End Sub
End Class
