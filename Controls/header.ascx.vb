Imports System
Imports System.Globalization
Imports System.Threading

Partial Class Controls_header
    Inherits System.Web.UI.UserControl

    'Protected Sub ddlLanguage_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlLanguage.SelectedIndexChanged
    '    Try

    '        Dim lang As String = String.Empty
    '        If Session("language") Is Nothing Then
    '            Session.Add("language", Me.ddlLanguage.SelectedValue)

    '            lang = Session("language")



    '            Thread.CurrentThread.CurrentCulture = New CultureInfo(lang)
    '            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang)

    '        Else

    '            Session("language") = Me.ddlLanguage.SelectedValue

    '            lang = Session("language")


    '            Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
    '            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)




    '        End If




    '    Catch ex As Exception

    '    End Try
    'End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            If Not Page.IsPostBack Then

                Dim Lang As String = String.Empty

                If Session("language") Is Nothing Then

                    Session.Add("language", "en-US")

                    Lang = Session("language")
                    Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
                    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)


                Else

                    Lang = Session("language")


                    Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
                    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)



                End If


            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub imgARABIC_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgARABIC.Click
        Try

            Dim Lang As String = String.Empty

            If Session("language") Is Nothing Then

                Session.Add("language", "ar-AE")
                Lang = Session("language")
                Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)


            Else

                Session("language") = "ar-AE"
                Lang = Session("language")


                Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)



            End If


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub imgENGLISH_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgENGLISH.Click
        Try

            Dim Lang As String = String.Empty

            If Session("language") Is Nothing Then

                Session.Add("language", "en-US")
                Lang = Session("language")
                Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)


            Else
                Session("language") = "en-US"

                Lang = Session("language")


                Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)



            End If


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub imgRUSSIA_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgRUSSIA.Click
        Try

            Dim Lang As String = String.Empty

            If Session("language") Is Nothing Then

                Session.Add("language", "ru-RU")
                Lang = Session("language")
                Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)


            Else
                Session("language") = "ru-RU"

                Lang = Session("language")


                Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)



            End If


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub imgFRANCE_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgFRANCE.Click
        Try

            Dim Lang As String = String.Empty

            If Session("language") Is Nothing Then

                Session.Add("language", "fr-FR")
                Lang = Session("language")
                Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)


            Else
                Session("language") = "fr-FR"

                Lang = Session("language")


                Thread.CurrentThread.CurrentCulture = New CultureInfo(Lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang)



            End If


        Catch ex As Exception

        End Try
    End Sub
End Class
