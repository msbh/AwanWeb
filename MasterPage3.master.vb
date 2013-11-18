Imports System
Imports System.Globalization
Imports System.Threading

Partial Class MasterPage3
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try


            'If Not Page.IsPostBack Then

            '    If Session("language") Is Nothing Then
            '        Session.Add("language", "en-US")
            '        Thread.CurrentThread.CurrentCulture = New CultureInfo("en-US")
            '    Else
            '        Dim Lang As String = Session("language")
            '        Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
            '    End If



            'End If

        Catch ex As Exception

        End Try
    End Sub

End Class

