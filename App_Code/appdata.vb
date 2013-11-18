Imports Microsoft.VisualBasic
Imports System.Resources
Imports System.Globalization
Imports System.Threading
Imports dsAdminTableAdapters
Imports System
Imports System.Configuration
Imports dsStockTableAdapters


Public Module appdata

    Dim rm As New ResourceManager("Resources.strings2", System.Reflection.Assembly.Load("App_GlobalResources"))
    Dim ci As CultureInfo

    Private _counter As webcounterTableAdapter = Nothing
    Private _Images As select_imagesTableAdapter = Nothing

    ReadOnly Property Images() As select_imagesTableAdapter
        Get
            If _Images Is Nothing Then
                _Images = New select_imagesTableAdapter()
            End If

            Return _Images
        End Get
    End Property

    Public Function New_Image_ID() As String
        Return Images.New_Image_ID
    End Function



    ReadOnly Property counter() As webcounterTableAdapter
        Get
            If _counter Is Nothing Then
                _counter = New webcounterTableAdapter()
            End If

            Return _counter
        End Get
    End Property
    ReadOnly Property GetLanguageString(ByVal key As String) As String
        Get
            Try
                '   Thread.CurrentThread.CurrentCulture = New CultureInfo("en-US")
                ci = Thread.CurrentThread.CurrentCulture

                Return rm.GetString(key, ci)
            Catch ex As Exception
                Return String.Empty
            End Try
        End Get

    End Property

    'Private ReadOnly Property Resource() As ResourceManager
    '    Get
    '        If HttpContext.Current.Session("ResourceManager") Is Nothing Then
    '            HttpContext.Current.Session("ResourceManager") = New ResourceManager("DCAA.English", GetType([Global]).Module.Assembly)
    '        End If
    '        Dim rManager As ResourceManager = CType(HttpContext.Current.Session("ResourceManager"), ResourceManager)
    '        rManager.IgnoreCase = True
    '        Return rManager
    '    End Get
    'End Property


    Public Function UpdateWeBCounter() As String

        Return counter.UpdateWebCounter


    End Function

    Public Function getVisitors() As String

        Return counter.getVisitors


    End Function


    ReadOnly Property Stock_Pref_L() As String
        Get
            Return ConfigurationManager.AppSettings.Get("Stock.Pref_L")
        End Get
    End Property

    ReadOnly Property Stock_Pref_R() As String
        Get
            Return ConfigurationManager.AppSettings.Get("Stock.Pref_R")
        End Get
    End Property

End Module

