Imports Microsoft.VisualBasic
Imports System.Xml

Public Class Utilities
    Public Shared Function HandleException(ByVal ex As Exception, ByVal theFunction As String) As XmlDocument
        Dim errorMsg As String = "Error In " & theFunction & ": " & vbCrLf & ex.ToString()
        My.Log.WriteEntry(errorMsg)
        'Debug.WriteLine(errorMsg)
        Dim xmlReturn As New XmlDocument()
        xmlReturn.LoadXml("<Casino><ErrorMsg ErrorMessage=" & ex.Message & "/></Casino>")
        Return xmlReturn
    End Function
End Class

