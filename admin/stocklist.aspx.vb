Imports System.Data
Imports System.Data.SqlClient

Partial Class admin_stocklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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
 
End Class
