Imports System.Data
Imports System.Data.SqlClient

Partial Class admin_stockEmaillist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try


            If Not Page.IsPostBack Then

                Hsession_ID.Value = Session.SessionID

                Dim o As New dsStockTableAdapters.StockToEmailTableAdapter
                o.Delete(Session.SessionID, 0, 0)




            End If


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging


        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()

    End Sub
    <System.Web.Services.WebMethod()> _
 Public Shared Function get_MakeNames(ByVal MakeID As Integer) As ArrayList
        Try
            Dim list As ArrayList = New ArrayList
            Dim strConnString As String = ConfigurationManager.ConnectionStrings("autoConnectionString").ConnectionString
            Dim strQuery As String = "select ID, model_description from tblmake_details where make_ID=@make_ID"
            Dim con As SqlConnection = New SqlConnection(strConnString)
            Dim cmd As SqlCommand = New SqlCommand
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@make_ID", MakeID)
            cmd.CommandText = strQuery
            cmd.Connection = con
            con.Open()
            Dim sdr As SqlDataReader = cmd.ExecuteReader
            While sdr.Read
                list.Add(New ListItem(sdr("model_description").ToString, sdr("ID").ToString))
            End While
            con.Close()
            Return list


        Catch ex As Exception
            Return Nothing

        End Try

    End Function

  
    Protected Sub cmdAddStock_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdAddStock.Click
        Try


            Dim o As New dsStockTableAdapters.StockToEmailTableAdapter


            For i As Integer = 0 To Me.GridView1.Rows.Count - 1

                Dim chk As CheckBox = Me.GridView1.Rows(i).Cells(0).FindControl("chkselect")

                If chk.Checked = True Then
                    o.Insert(Me.GridView1.Rows(i).Cells(9).Text, Session.SessionID)
                End If


            Next

            Me.GridView2.DataBind()

        Catch ex As Exception

        End Try
    End Sub

  
    Protected Sub cmdEmailStock_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdEmailStock.Click
        Try


            Response.Redirect("sendstockemail.aspx?sid=" & Hsession_ID.Value, False)



        Catch ex As Exception

        End Try
    End Sub
End Class
