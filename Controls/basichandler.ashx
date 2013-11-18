<%@ WebHandler Language="VB" Class="basichandler" %>

Imports System
Imports System.Web
Imports masterdataTableAdapters
Imports System.Net.Mail
Imports System.IO

Public Class basichandler : Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        context.Response.ContentType = "text/plain"
        Dim strMethodName As String = String.Empty
        Dim strmake_id As String = String.Empty
        Dim strFunc As String = String.Empty
        
        
        If Not String.IsNullOrEmpty(context.Request.Form("make_id")) Then
            strmake_id = Convert.ToString(context.Request.Form("make_id"))
        End If
        
        If Not String.IsNullOrEmpty(context.Request.QueryString("func")) Then
            strFunc = Convert.ToString(context.Request.QueryString("func"))
            
            If strFunc.ToLower = "co" Then
              
                Dim strID As String = Convert.ToString(context.Request.QueryString("cid"))
                Dim o As New dsServicesTableAdapters.transChargesTableAdapter
                Dim txt As String = o.get_charges(strID)
                
                
                context.Response.Write(txt)
                
            ElseIf strFunc.ToLower = "curr" Then
                
               
                
                
                Dim cID As String = Convert.ToString(context.Request.QueryString("cid"))
                Dim b As String = Convert.ToString(context.Request.QueryString("b"))
                Dim c As String = Convert.ToString(context.Request.QueryString("c"))
                             
                Dim o As New masterdataTableAdapters.Select_AllCurrencyTableAdapter
                Dim rate As String = o.Get_CurrencyRate(cID)
              
                
                Dim retVal As String = rate + "@" + b + "@" + c 
                
                context.Response.Write("" + retVal + "")
               
                
                
            End If
            
        End If
        
        
        If Not String.IsNullOrEmpty(context.Request.QueryString("StrMethodName")) Then
            strMethodName = Convert.ToString(context.Request.QueryString("StrMethodName"))
        End If
     
        If strMethodName.Length > 0 AndAlso strMethodName.ToUpper().Equals("GETMAKES") Then
            context.Response.Write(GetMake())
        End If
        
      
        
        If strMethodName.Length > 0 AndAlso strMethodName.ToUpper().Equals("GETMAKEDESC") Then
            context.Response.Write(GetMakeDetails(strmake_id))
        End If
        
        
        
    End Sub
    
    
   
    
    Private Function GetMake() As String
       
        
        Dim make As New ArrayList
        Dim obj As New make_nocountTableAdapter
        Dim dt As New Data.DataTable
        dt.Merge(obj.GetData)
                
         
        
        Dim strBldOptions As New StringBuilder()
        
        For iCtr As Integer = 0 To dt.Rows.Count - 1

            strBldOptions.Append("<option opText=\" + dt.Rows(iCtr).Item("make").ToString + " \  value=" + dt.Rows(iCtr).Item("makeid").ToString + " \ >" + dt.Rows(iCtr).Item("make").ToString + "</option>")
            
        Next
        
        Return strBldOptions.ToString
        
        
        
    End Function
    
    
    
    Private Function GetMakeDetails(ByVal Make_ID As String) As String
       
        
        Dim make As New ArrayList
        Dim obj As New tblmake_detailsTableAdapter
        Dim dt As New Data.DataTable
        dt.Merge(obj.GetData(Make_ID))
                
         
        
        Dim strBldOptions As New StringBuilder()
        
        For iCtr As Integer = 0 To dt.Rows.Count - 1

            strBldOptions.Append("<option opText=\" + dt.Rows(iCtr).Item("model_description").ToString + " \  value=" + dt.Rows(iCtr).Item("id").ToString + " \ >" + dt.Rows(iCtr).Item("model_description").ToString + "</option>")
            
        Next
        
        Return strBldOptions.ToString
        
        
        
    End Function
    
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class