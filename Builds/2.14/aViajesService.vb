Imports System.Data.SqlClient
'Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Xml

<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class aViajesService
    Inherits System.Web.Services.WebService

	Private conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Casino").ConnectionString)

    <WebMethod()> Public Function GetCounter(ByVal SeqName As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetCounter", SeqName )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetCounterExpNum() As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetCounterExpNum" )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateCounterExpNum(ByVal ExpNum As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateCounterExpNum", ExpNum )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetClaveAdministrador() As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetClaveAdministrador" )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateClaveAdministrador(ByVal claveAnterior As String, ByVal claveNueva As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateClaveAdministrador", claveAnterior, claveNueva )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetAgenciasNombreList() As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetAgenciasNombreList")
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetEstadosNombreList() As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetEstadosNombreList")
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetAgentesNombreList() As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetAgentesNombreList")
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetOperadoresNombreList() As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetOperadoresNombreList")
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetExpedientesList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetExpedientesList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetExpedienteDetalle(ByVal ExpAnno As Integer, ByVal ExpNum As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetExpedienteDetalle", ExpAnno, ExpNum )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateExpedienteDetalle(ByVal ExpAnno As Integer, ByVal ExpNum As Integer, ByVal paxNombre As String, ByVal paxNum As String, ByVal excursion As String, ByVal reservaNum As String, ByVal confirmacionNum As String, ByVal agenciaNombre As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateExpedienteDetalle", ExpAnno, ExpNum, paxNombre, paxNum, excursion, reservaNum, confirmacionNum, agenciaNombre )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetOperadoresList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetOperadoresList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetOperadoreDetalle(ByVal OpId As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetOperadoreDetalle", OpId )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateOperadoreDetalle(ByVal OpId As Integer, ByVal nombre As String, ByVal direccion As String, ByVal telefono As String, ByVal telefono2 As String, ByVal fax As String, ByVal email As String, ByVal contacto As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateOperadoreDetalle", OpId, nombre, direccion, telefono, telefono2, fax, email, contacto )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetAgenciasList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetAgenciasList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetAgenciaDetalle(ByVal OpId As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetAgenciaDetalle", OpId )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateAgenciaDetalle(ByVal AgId As Integer, ByVal nombre As String, ByVal direccion As String, ByVal telefono As String, ByVal telefono2 As String, ByVal fax As String, ByVal email As String, ByVal contacto As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateAgenciaDetalle", AgId, nombre, direccion, telefono, telefono2, fax, email, contacto )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetAgentesList(ByVal Nombre As String, ByVal AgNombre As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetAgentesList", Nombre, AgNombre )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetAgenteDetalle(ByVal AgntId As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetAgenteDetalle", AgntId )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateAgenteDetalle(ByVal AgntId As Integer, ByVal nombre As String, ByVal AgNombre As String, ByVal TipoPago As String, ByVal Porcentaje As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateAgenteDetalle", AgntId, nombre, AgNombre , TipoPago, Porcentaje )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetUsuariosList() As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetUsuariosList" )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetUsuarioDetalle(ByVal AgntId As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetUsuarioDetalle", AgntId )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateUsuarioDetalle(ByVal AgntId As Integer, ByVal nombre As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateUsuarioDetalle", AgntId, nombre )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetVouchersList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetVouchersList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetVoucherDetalle(ByVal VouId As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetVoucherDetalle", VouId )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateVoucherDetalle(ByVal VouId As Integer, ByVal ExpAnno As Integer, ByVal ExpNum As Integer, ByVal fecha As String, ByVal agente As String, ByVal direccion As String, ByVal paxNombre As String, ByVal paxNum As String, ByVal confirmacionNum As String, ByVal servicios As String, ByVal usrNombre As String, ByVal estId As String, ByVal opNombre As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateVoucherDetalle", VouId, ExpAnno, ExpNum, fecha, agente, direccion, paxNombre, paxNum, confirmacionNum, servicios, usrNombre, estId, opNombre)
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetFacturasList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetFacturasList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetFacturaDetalle(ByVal FacNumId As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetFacturaDetalle", FacNumId )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateFacturaDetalle(ByVal FacNumId As Integer, ByVal ExpAnno As Integer, ByVal ExpNum As Integer, ByVal fecha As String, ByVal estId As String, ByVal total As String, ByVal tipoCambio As String, ByVal agNombre As String, ByVal agntNombre As String, ByVal paxNombre As String, ByVal usrNombre As String, ByVal detalle As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateFacturaDetalle", FacNumId, ExpAnno, ExpNum, fecha, estId, total, tipoCambio, agNombre, agntNombre, paxNombre, usrNombre, detalle)
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetFacturaCostosList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetFacturaCostosList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateFacturaCostoDetalle(ByVal CostoId As Integer, ByVal ExpAnno As Integer, ByVal ExpNum As Integer, ByVal FacNumId As Integer, ByVal agntNombre As String, ByVal costo As String, ByVal chequeNum As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateFacturaCostoDetalle", CostoId, ExpAnno, ExpNum, FacNumId, agntNombre, costo, chequeNum)
        Return xmlDoc
    End Function

    <WebMethod()> Public Function DeleteFacturaCostoDetalle(ByVal CostoId As Integer, ByVal FacNumId As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_DeleteFacturaCostoDetalle", CostoId, FacNumId)
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetExpedienteCostosList(ByVal ExpAnno As Integer, ByVal ExpNum As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetExpedienteCostosList", ExpAnno, ExpNum)
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateExpedienteCostoDetalle(ByVal CostoId As Integer, ByVal ExpAnno As Integer, ByVal ExpNum As Integer, ByVal opNombre As String, ByVal costo As String, ByVal chequeNum As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateExpedienteCostoDetalle", CostoId, ExpAnno, ExpNum, opNombre, costo, chequeNum)
        Return xmlDoc
    End Function

    <WebMethod()> Public Function DeleteExpedienteCostoDetalle(ByVal CostoId As Integer, ByVal ExpAnno As Integer, ByVal ExpNum As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_DeleteExpedienteCostoDetalle", CostoId, ExpAnno, ExpNum)
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetReporteVouchersList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetReporteVouchersList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetReporteFacturasList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetReporteFacturasList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetReportePagosOperadoresList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetReportePagosOperadoresList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetReportePagosOperadoresVouchersList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetReportePagosOperadoresVouchersList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetReportePagosAgentesList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetReportePagosAgentesList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetReporteResumenExpedientesList(ByVal Query As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetReporteResumenExpedientesList", Query )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function DeleteUsuarioDetalle(ByVal UsrId As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_DeleteUsuarioDetalle", UsrId)
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetComisionesPagosList(ByVal Estado As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetComisionesPagosList", Estado)
        Return xmlDoc
    End Function

    <WebMethod()> Public Function InsertComisionPago(ByVal ExpAnno As Integer, ByVal ExpNum As Integer, ByVal Nombre As String, ByVal cuenta As String, ByVal costo As String, ByVal fechaLimite As String, ByVal concepto As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_InsertComisionPago", ExpAnno, ExpNum, Nombre, cuenta, costo, fechalimite, concepto )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function UpdateComisionPago(ByVal Id As Integer, ByVal estado As String, ByVal observaciones As String) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateComisionPago", Id, estado, observaciones )
        Return xmlDoc
    End Function

    <WebMethod()> Public Function GetComisionistasNombreList() As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_GetComisionistasNombreList")
        Return xmlDoc
    End Function

	<WebMethod()> Public Function UpdateFacturaDetalleImpreso(ByVal FacNumId As Integer, ByVal Impreso As Integer) As System.Xml.XmlDocument
        Dim xmlDoc As New XmlDocument
        xmlDoc = SqlHelper.GetXmlDocFromSP(conn, "root", "mngsp_UpdateFacturaDetalleImpreso", FacNumId, Impreso)
        Return xmlDoc
    End Function
End Class