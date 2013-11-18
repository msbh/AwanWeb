Imports Microsoft.VisualBasic

Public NotInheritable Class myCustomValidator
    Inherits System.Web.UI.WebControls.CustomValidator

    Public Sub New(ByVal errorMessage As String, ByVal validationGroup As String)
        MyBase.New()
        Me.ErrorMessage = errorMessage
        Me.ValidationGroup = validationGroup
        Me.IsValid = False
    End Sub

End Class