
Partial Class viewperforma
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            If Not Page.IsPostBack Then

                Dim LnkAccpt As LinkButton = Me.FormView1.FindControl("lnkaccept")
                Dim lnkRej As LinkButton = Me.FormView1.FindControl("lnkreject")
                Dim o As New membersTableAdapters.perfinvoiceTableAdapter
                Dim statusID As String = o.Get_StatusID(CInt(Request.QueryString("id")), 1)

                If statusID = "0" Then

                ElseIf statusID = "2" Then
                    LnkAccpt.Enabled = True
                    lnkRej.Enabled = False
                ElseIf statusID = "3" Then


                    LnkAccpt.Enabled = False
                    lnkRej.Enabled = False

                End If


            End If



        Catch ex As Exception

        End Try
    End Sub

    Protected Sub FormView1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.Load

    End Sub

    Protected Sub lnkaccept_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try

            Dim o As New membersTableAdapters.perfinvoiceTableAdapter
            o.Update_Status(Request.QueryString("id"), 1, 3)

            Dim LnkAccpt As LinkButton = Me.FormView1.FindControl("lnkaccept")
            Dim lnkRej As LinkButton = Me.FormView1.FindControl("lnkreject")

            lnkRej.Enabled = False
            LnkAccpt.Enabled = False


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub lnkreject_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try


            Dim o As New membersTableAdapters.perfinvoiceTableAdapter
            o.Update_Status(Request.QueryString("id"), 1, 2)

            Dim LnkAccpt As LinkButton = Me.FormView1.FindControl("lnkaccept")
            Dim lnkRej As LinkButton = Me.FormView1.FindControl("lnkreject")

            lnkRej.Enabled = False
            LnkAccpt.Enabled = False


        Catch ex As Exception

        End Try
    End Sub
End Class
