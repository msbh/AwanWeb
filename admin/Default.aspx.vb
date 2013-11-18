
Partial Class login_Default
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click

        Try


            'Verify username and password
            Dim obj As New dsAdminTableAdapters.ValidAdminTableAdapter

            Dim isValid As Integer = obj.validate_user(txtUsername.Text, txtpassword.Text).ToString

            If isValid = 1 Then

                ''If verified, get the details of the user
                ''Dim m As master.tblmake_detailsRow
                Session.Clear()
                Session.Add("userid", Me.txtUsername.Text)

                Dim user_keyID As Integer = obj.get_userKeyID(txtUsername.Text)

                Session.Add("user_keyid", user_keyID)



                'Dim UserInfo As InsureCentral.USERSRow
                'UserInfo = BLLUsers.GetSingleUser(txtUsername.Text)
                ''If details have been retrieved successfully, store in session
                'If Not UserInfo Is Nothing Then
                '    Session.Clear()
                '    Session.Add("myid", UserInfo.USERID)
                '    Session.Add("fullname", UserInfo.USERFULLNAME)
                '    Session.Add("username", UserInfo.USERNAME)
                '    Session.Add("email", UserInfo.USEREMAIL)
                '    Session.Add("loggedon", Now())

                '    Dim AIBCinfo As InsureCentral.AIBCRow = BLLUsers.GetSingleAIBC(CInt(UserInfo.AIBCID))

                '    Session.Add("aibcsystemid", AIBCinfo.AIBCID)
                '    Session.Add("aibcGIScode", AIBCinfo.AIBCCODE)
                '    Session.Add("aibcname", AIBCinfo.AIBCNAME)

                '    BLLAudit.AddAuditEntry("Login", "Logged in", Session("username"))

                '    Dim Authorizations As InsureCentral.AuthorizationsDataTable
                '    Authorizations = BLLUsers.GetAuthorizationsByUsername(UserInfo.USERNAME)

                '    For Each a As InsureCentral.AuthorizationsRow In Authorizations.Rows
                '        Session.Add(LCase(a.ROLENAME), "yes")
                '    Next

                '    Session.Timeout = 60


                '    'UnComment this line to enable return to previous page
                '    Response.Redirect("~/Dashboard.aspx", False)

                '    Dim URLString As String
                '    URLString = Request.QueryString("ref")

                '    If URLString <> "" Then
                '        Response.Redirect(URLString, False)
                '    Else
                '        URLString = Request.UrlReferrer.AbsoluteUri
                '        If URLString <> "" And (Not URLString.ToLower.Contains("login")) Then
                '            Response.Redirect(URLString, False)
                '        Else
                '            Response.Redirect("~/Dashboard.aspx", False)
                '        End If
                '    End If

                'End If
                Response.Redirect("enquirylist.aspx", False)
            Else

                lblstatus.Text = "Invalid username or password"
            End If


        Catch ex As Exception
            lblstatus.Text = "Invalid username or password"

            ExUtility.LogException(ex, "Login_btn")

        End Try


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("loggedon") Is Nothing Then
            Response.Redirect("~/Dashboard.aspx", False)
        End If
    End Sub


   
End Class
