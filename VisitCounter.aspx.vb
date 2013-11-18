Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging
Imports dsAdminTableAdapters



Partial Class Samples_VisitCounter
    Inherits System.Web.UI.Page

    Dim o As New dsAdminTableAdapters.webcounterTableAdapter
    Const VISITOR_COOKIE As String = "WEBVISITOR"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Clear()
        Response.Cache.SetNoStore()
        Response.ContentType = "image/jpeg"
        'Response.AddHeader("Content-Disposition", "attachment;filename=123.jpg")
        Dim length As Integer = 9
        Dim fontSize As Integer = 16
        Dim letterWidth As Integer = 15
        Dim letterHeight As Integer = 18
        Dim letterOffsetX As Integer = 2
        Dim backgroundColor As Color = Color.Black

        Dim number As Integer = GetCounter()
        Dim sNum As String = number.ToString.PadLeft(length, "0")

        Dim bmp As New Bitmap(letterWidth * length + 2, letterHeight + 2)
        Dim gr As Graphics = Graphics.FromImage(bmp)
        gr.CompositingQuality = CompositingQuality.HighQuality
        gr.PixelOffsetMode = PixelOffsetMode.HighQuality
        gr.InterpolationMode = InterpolationMode.HighQualityBicubic
        gr.SmoothingMode = SmoothingMode.HighQuality

        Dim bgBrush As New SolidBrush(backgroundColor)
        gr.FillRegion(bgBrush, New Region(New Rectangle(0, 0, bmp.Width, bmp.Height)))
        Dim font As New Font("Arial", fontSize, FontStyle.Bold, GraphicsUnit.Pixel)

        For i As Integer = 0 To length - 1
            gr.DrawRectangle(Pens.LightGray, New Rectangle(i * letterWidth + 1, 1, letterWidth, letterHeight))
            gr.DrawString(sNum.Chars(i).ToString, font, Brushes.White, i * letterWidth + letterOffsetX, 1)
        Next

        gr.DrawRectangle(Pens.Gray, New Rectangle(0, 0, letterWidth * length + 2, letterHeight + 2))



        bmp.Save(Response.OutputStream, Imaging.ImageFormat.Jpeg)
        Response.End()
    End Sub

    Public Function GetCounter() As Integer
        Dim newVisitorId As String

        If Request.Cookies(VISITOR_COOKIE) Is Nothing Then
            newVisitorId = Guid.NewGuid.ToString
            'Execute the SQL command to increment the counter value in the Database table

            o.UpdateWebCounter()
            Dim ipString As String = String.Empty
            If Not Context.Request.ServerVariables("HTTP_VIA") Is DBNull.Value Then

                Try
                    ipString = Context.Request.ServerVariables("HTTP_X_FORWARDED_FOR").ToString
                Catch ex As Exception

                End Try

            Else
                ipString = Context.Request.ServerVariables("REMOTE_ADDR").ToString()
            End If
            o.Insert_Visitor(ipString, newVisitorId)

        Else
            newVisitorId = Request.Cookies(VISITOR_COOKIE).Values("Id")
        End If




        Dim ckVisitor As New HttpCookie(VISITOR_COOKIE)
        newVisitorId = newVisitorId
        ckVisitor.Values.Add("Id", newVisitorId)
        ckVisitor.Expires = Now.AddHours(6)
        Response.Cookies.Add(ckVisitor)

        Dim counter As Integer = o.getVisitors

        Return counter
    End Function

End Class
