Imports System.Data
Imports System.Web.Services.WebMethodAttribute
Imports System.Data.SqlClient
Imports System.IO

Partial Class order
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            If Not Page.IsPostBack Then
                Session.Add("session_id", Session.SessionID)
            End If
           
        Catch ex As Exception

        End Try
        Dim strConnString As String = ConfigurationManager.ConnectionStrings("autoconnectionString").ConnectionString

        Dim cmd As SqlCommand = New SqlCommand("SELECT * FROM Testimonial", New SqlConnection(strConnString))
        Try
            cmd.Connection.Open()

            rptrExample.DataSource = cmd.ExecuteReader()

            rptrExample.DataBind()

            cmd.Connection.Close()
            cmd.Connection.Dispose()
        Catch ex As Exception
            ' lblStatus.Text = ex.Message
        End Try
    End Sub

    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InsertButton.Click
        Try

            Dim o As New membersTableAdapters.TEMP_quotationTableAdapter


            o.Insert(CInt(Session("user_id")), Me.ddlCountry.SelectedValue, Me.ddlport.SelectedValue, Me.RadioButtonList1.SelectedValue, _
                      1, CInt(Session("order_id")), Session.SessionID, CheckBox1.Checked, ddlshipment.SelectedValue)

            Response.Redirect("orderdetails.aspx?qid=" & Session("order_id") & "")

        Catch ex As Exception


        End Try
    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            Dim name As String = TextName.Text.ToString()
            Dim email As String = TextEmail.Text.ToString()
            Dim country As String = TextCountry.Text.ToString()
            Dim car As String = TextCar.Text.ToString()
            Dim website As String = TextWeb.Text.ToString()
            Dim comment As String = TextArea2.Text.ToString()

            Dim strFileName As String
            Dim strFilePath As String
            Dim strFolder As String


            strFolder = "\images\testimonials\"

            'Get the name of the file that is posted.
            strFileName = FileUpload1.PostedFile.FileName
            strFileName = Path.GetFileName(strFileName)

            'Create the directory if it does not exist.
            If (Not Directory.Exists(strFolder)) Then
                Directory.CreateDirectory(strFolder)
            End If

            'Save the uploaded file to the server.
            strFilePath = strFolder & strFileName

            If File.Exists(strFilePath) Then
                'lblUploadResult.Text = strFileName & " already exists on the server!"
            Else
                FileUpload1.PostedFile.SaveAs(strFilePath)
                'lblUploadResult.Text = strFileName & " has been successfully uploaded."
            End If


            ' Dim list As ArrayList = New ArrayList
            Dim strConnString As String = ConfigurationManager.ConnectionStrings("autoconnectionString").ConnectionString



            Dim strQuery As String = "Insert Into Testimonial(Name, Email,Country,Car,Website,Comment,FileImage) Values('" + name + "', '" + Email + "', '" + country + "', '" + car + "', '" + website + "', '" + comment + "', '" + strFilePath + "')"
            Dim con As SqlConnection = New SqlConnection(strConnString)
            con.Open()
            Dim cmd As SqlCommand = New SqlCommand
            cmd = New SqlCommand(strQuery, con)
            cmd.ExecuteNonQuery()
            con.Close()
            TextName.Text = ""
            TextEmail.Text = ""
            TextCountry.Text = ""
            TextCar.Text = ""
            TextWeb.Text = ""
            TextArea2.Text = ""
            '       CREATE TABLE [dbo].[Testimonial](
            '[id] [int] IDENTITY(1,1) NOT NULL,
            '[Name] [nvarchar](100) NULL,
            '[Email] [nvarchar](50) NULL,
            '[Car] [nvarchar](100) NULL,
            '[Country] [nvarchar](50) NULL,
            '[Website] [nvarchar](100) NULL,
            '[Comment] [nvarchar](1000) NULL,
            '[FileImage] [nvarchar](100) NULL,
            'CONSTRAINT [PK_Testimonial] PRIMARY KEY CLUSTERED 
            '(
            '[id](ASC) )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
            ') ON [PRIMARY]


        Catch ex As Exception


        End Try
    End Sub
End Class
