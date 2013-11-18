Imports System.IO

Partial Class filetransfer
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try

            Try
                ' Only get files that begin with the letter "c."
                Dim dirs As String() = Directory.GetFiles(Server.MapPath("~" & "\cars_images"))
                lblttl.Text = dirs.Length

                Dim dir As String
                For Each dir In dirs
                    ListBox1.Items.Add(dir)
                    File.Copy(dir, Server.MapPath("~" & "\cars_images2"))
                Next


            Catch ex As Exception
                lblttl.Text = e.ToString
            End Try


        Catch ex As Exception

        End Try
    End Sub
End Class
