Imports System
Imports System.IO
Imports System.Web

' Create our own utility for exceptions
Public NotInheritable Class ExUtility

    ' All methods are static, so this can be private
    Private Sub New()
        MyBase.New()
    End Sub

    ' Log an Exception
    Public Shared Sub LogException(ByVal exc As Exception, ByVal source As String)
        ' Include enterprise logic for logging exceptions
        ' Get the absolute path to the log file
        Dim logFile = "~/doc/ErrorLog.txt"
        logFile = HttpContext.Current.Server.MapPath(logFile)

        ' Open the log file for append and write the log
        Dim sw = New StreamWriter(logFile, True)
        sw.WriteLine("**** " & DateTime.Now & " ****")

        If exc.InnerException IsNot Nothing Then
            'sw.Write("Inner Exception Type: ")
            'sw.WriteLine(exc.InnerException.GetType.ToString)
            sw.Write("Inner Exception: ")
            sw.WriteLine(exc.InnerException)
            sw.WriteLine("Source: " & source)
            'sw.WriteLine(exc.InnerException.Source)
            'If exc.InnerException.StackTrace IsNot Nothing Then
            '    sw.WriteLine("Inner Stack Trace: ")
            '    sw.WriteLine(exc.InnerException.StackTrace)
            'End If
        End If
        'sw.Write("Exception Type: ")
        'sw.WriteLine(exc.GetType.ToString)
        sw.WriteLine("Exception: " & exc.Message)
        '  sw.WriteLine(exc.InnerException.Message.ToString)

        ' sw.WriteLine("Exception: " & exc.InnerException)
        sw.WriteLine("Source: " & source)
        'sw.WriteLine(exc.InnerException.ToString)



        'If exc.StackTrace IsNot Nothing Then
        '    sw.WriteLine("Stack Trace: ")
        '    sw.WriteLine(exc.StackTrace)
        'End If
        sw.WriteLine()
        sw.Flush()
        sw.Close()
        
    End Sub

    Public Shared Sub LogMsg(ByVal Msg As String, ByVal source As String)


        ' Include enterprise logic for logging exceptions
        ' Get the absolute path to the log file
        Dim logFile = "~/doc/ErrorLog.txt"
        logFile = HttpContext.Current.Server.MapPath(logFile)

        ' Open the log file for append and write the log
        Dim sw = New StreamWriter(logFile, True)
        sw.WriteLine("**** " & DateTime.Now & " ****")

        If Msg IsNot Nothing Then
            'sw.Write("Inner Exception Type: ")
            'sw.WriteLine(exc.InnerException.GetType.ToString)
            sw.Write("Inner Exception: ")
            sw.WriteLine(Msg)
            sw.WriteLine("Source: " & source)
            'sw.WriteLine(exc.InnerException.Source)
            'If exc.InnerException.StackTrace IsNot Nothing Then
            '    sw.WriteLine("Inner Stack Trace: ")
            '    sw.WriteLine(exc.InnerException.StackTrace)
            'End If
        End If
        'sw.Write("Exception Type: ")
        'sw.WriteLine(exc.GetType.ToString)
        sw.WriteLine("Exception: " & Msg)
        '  sw.WriteLine(exc.InnerException.Message.ToString)

        ' sw.WriteLine("Exception: " & exc.InnerException)
        sw.WriteLine("Source: " & source)
        'sw.WriteLine(exc.InnerException.ToString)



        'If exc.StackTrace IsNot Nothing Then
        '    sw.WriteLine("Stack Trace: ")
        '    sw.WriteLine(exc.StackTrace)
        'End If
        sw.WriteLine()
        sw.Flush()
        sw.Close()

    End Sub

    ' Notify System Operators about an exception
    Public Shared Sub NotifySystemOps(ByVal exc As Exception)
        ' Include code for notifying IT system operators
    End Sub
End Class
