Imports System.Data
Imports System.IO


Partial Class admin_membershipDetails
    Inherits System.Web.UI.Page



    'Private Sub Display_Data(ByVal ID As Integer)
    '    Try
    '        Dim obj As New Load_MembershipDetailsTableAdapter

    '        Dim dt As New DataTable
    '        dt.Merge(obj.GetData(ID))


    '        With Me
    '            .txtfirstname.Text = dt.Rows(0).Item("FirstName").ToString


    '            .txtLastName.Text = dt.Rows(0).Item("LastName").ToString
    '            .txtcompanyname.Text = dt.Rows(0).Item("companyname").ToString
    '            .txtemail.Text = dt.Rows(0).Item("email").ToString
    '            .ddlcountry.SelectedValue = dt.Rows(0).Item("country").ToString
    '            .txtmobileno.Text = dt.Rows(0).Item("mobileno").ToString
    '            .txtphoneno.Text = dt.Rows(0).Item("phoneno").ToString

    '            .ddlrole.SelectedValue = dt.Rows(0).Item("roleid").ToString




    '        End With

















    '    Catch ex As Exception

    '    End Try
    'End Sub

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    If Not IsPostBack Then


    '        Dim ID As String = Request.QueryString("ID")
    '        Display_Data(ID)





    '    End If

    'End Sub

    'Protected Sub cmdApproved_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdApproved.Click
    '    Try

    '        Dim msgResult As Integer = 0
    '        Dim obj As New DataSet1TableAdapters.membershipTableAdapter
    '        Dim dt As New DataTable

    '        msgResult = obj.Update_Status(Now, Session("userid"), 1, ddlrole.SelectedValue, Request.QueryString("id"))
    '        If msgResult > 0 Then

    '            Dim obj2 As New DataSet1TableAdapters.getUserIDpasswordTableAdapter


    '            dt.Merge(obj2.GetData(Request.QueryString("ID")))


    '            Dim HTML_para(2), HTML_para_value(2) As String
    '            HTML_para(0) = "@@@userid@@@"
    '            HTML_para(1) = "@@@password@@@"
    '            HTML_para(2) = "@@@customername@@@"

    '            HTML_para_value(0) = dt.Rows(0).Item("userid").ToString
    '            HTML_para_value(1) = dt.Rows(0).Item("password").ToString
    '            HTML_para_value(2) = txtfirstname.Text


    '            Dim eObj As New Email
    '            If eObj.Send("customercare@awan.co.jp", txtemail.Text, "", "Awan International K.K - Membership Approved", get_HTMLmessageFormat("~\email_templates\membership_approved_customer.htm", HTML_para, HTML_para_value)) = "ok" Then

    '                Me.lblmessage.Text = "Membership approved, and email is transmitted."


    '            End If

    '        Else

    '        End If


    '    Catch ex As Exception

    '        ExUtility.LogException(ex, "admin_membership")

    '    End Try

    'End Sub

    'Protected Sub cmdReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdReject.Click
    '    Try
    '        Dim msgResult As Integer = 0
    '        Dim obj As New DataSet1TableAdapters.membershipTableAdapter

    '        msgResult = obj.Update_Status(Now, Session("userid"), 2, ddlrole.SelectedValue, Request.QueryString("id"))
    '        If msgResult > 0 Then

    '            Me.lblmessage.Text = "Membership rejected."

    '        End If


    '    Catch ex As Exception

    '    End Try

    'End Sub

    'Protected Sub cmdClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdClose.Click

    '    Me.Response.Redirect("membershipList.aspx")

    'End Sub


    'Private Function get_HTMLmessageFormat(ByVal HTML_filename As String, ByVal HTML_para() As String, ByVal HTML_para_value() As String) As String
    '    Dim HTML_text As String = String.Empty
    '    'Dim dt As New Data.DataTable
    '    'Dim HTML_base() As String = Nothing
    '    Dim HTML_main As String = String.Empty
    '    Dim HTML_return As String = String.Empty

    '    'Dim obj As New myDATA
    '    'Dim strSQL As String = "SELECT MAKE,MODEL_DESCRIPTION,MODEL,COLOR,DRIVE,TRANSMISSION,ENGINE_POWER,FUEL_TYPE,"
    '    'strSQL += "s_p,door,ID from tblauto where id in (" & strID & ")"
    '    Try
    '        Dim re As StreamReader

    '        'obj.initialize()
    '        'dt.Merge(obj.Populate_Data(strSQL, Me.SqlDataSource2))
    '        re = File.OpenText(Server.MapPath(HTML_filename))
    '        If Not re Is Nothing Then

    '            'HTML_base = re.ReadToEnd.Split("@@@")

    '        End If

    '        HTML_text = re.ReadToEnd
    '        Dim cnt As Integer = HTML_para.Length

    '        For i As Integer = 0 To cnt - 1
    '            HTML_text = HTML_text.Replace(HTML_para(i), HTML_para_value(i))
    '        Next






    '        'If dt.Rows.Count > 0 Then
    '        '    For i As Integer = 0 To dt.Rows.Count - 1

    '        '        HTML = HTML_base(3)

    '        '        HTML = HTML.Replace("[lblmake]", dt.Rows(i).Item("make").ToString)
    '        '        HTML = HTML.Replace("[lblmodel_description]", dt.Rows(i).Item("model_description").ToString)
    '        '        HTML = HTML.Replace("[lblcolor]", dt.Rows(i).Item("color").ToString)
    '        '        HTML = HTML.Replace("[lbldrive]", dt.Rows(i).Item("drive").ToString)
    '        '        HTML = HTML.Replace("[lbltransmission]", dt.Rows(i).Item("transmission").ToString)
    '        '        HTML = HTML.Replace("[lblmodel]", dt.Rows(i).Item("model").ToString)
    '        '        HTML = HTML.Replace("[lblengine_power]", dt.Rows(i).Item("engine_power").ToString)
    '        '        HTML = HTML.Replace("[lblfuel_type]", dt.Rows(i).Item("fuel_type").ToString)
    '        '        HTML = HTML.Replace("[lblsp]", dt.Rows(i).Item("s_p").ToString)
    '        '        HTML = HTML.Replace("[lbldoor]", dt.Rows(i).Item("door").ToString)

    '        '        HTML_main = HTML_main + HTML


    '        '    Next



    '        'End If

    '        'HTML_return = HTML_base(0) + HTML_main + HTML_base(6)

    '        'dt.Dispose()


    '        Return HTML_text


    '    Catch ex As Exception

    '        '  Write_log(ex.Message, " HTMLstr", "stockListAdmin") '
    '        Return String.Empty



    '    End Try
    'End Function




End Class
