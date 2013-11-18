Imports System
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

' Create our own utility for exceptions
Public NotInheritable Class Dataaccess

    ' All methods are static, so this can be private
    Private Sub New()
        MyBase.New()
    End Sub
    Public Shared Function fillDataset(ByVal sql As String, ByVal TableName As String) As DataSet

        Dim ds As New DataSet
        Try

            Dim conn As String = ConfigurationManager.ConnectionStrings("autoConnectionString").ConnectionString
            Dim connDB As SqlConnection
            Dim cmdDB As SqlCommand
            connDB = New SqlConnection(conn)

            cmdDB = New SqlCommand
            cmdDB.CommandText = sql
            cmdDB.Connection = connDB

            connDB.Open()

            Dim oradap As New SqlDataAdapter
            oradap.SelectCommand = cmdDB
            oradap.Fill(ds, TableName)


            connDB.Close()
            Return ds

        Catch ex As Exception

            ExUtility.LogException(ex, "dataaccess.fillDataset")
            Return Nothing


        End Try


    End Function


    Public Shared Function fill_datatable(ByVal sql As String, ByVal tablename As String) As DataTable

        Dim dt As New DataTable
        Try

            Dim conn As String = ConfigurationManager.ConnectionStrings("autoConnectionString").ConnectionString
            Dim connDB As SqlConnection
            Dim cmdDB As SqlCommand
            connDB = New SqlClient.SqlConnection(conn)

            cmdDB = New SqlClient.SqlCommand

            cmdDB.CommandText = sql

            cmdDB.Connection = connDB
            connDB.Open()

            Dim oradap As New SqlClient.SqlDataAdapter
            oradap.SelectCommand = cmdDB
            oradap.Fill(dt)
            dt.TableName = tablename

            connDB.Close()

            Return dt

        Catch ex As Exception


            ExUtility.LogException(ex, "dataaccess.filldatatable")


            Return Nothing


        End Try


    End Function


End Class
