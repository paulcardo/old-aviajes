package com.adobe.cairngorm.project.control 
{
	import com.adobe.cairngorm.project.commands.*;
	import com.adobe.cairngorm.control.FrontController;
	
	public class MainControl extends FrontController
	{
		public function MainControl()
		{
			addCommand( MainControl.EVENT_COUNTER, CounterCommand );
			addCommand( MainControl.EVENT_COUNTEREXPNUM, CounterExpNumCommand );
			addCommand( MainControl.EVENT_COUNTEREXPNUMUPDATE, CounterExpNumUpdateCommand );
			addCommand( MainControl.EVENT_CLAVEADMINISTRADOR, ClaveAdministradorCommand );
			addCommand( MainControl.EVENT_CLAVEADMINISTRADORUPDATE, ClaveAdministradorUpdateCommand );
			addCommand( MainControl.EVENT_AGENCIASNOMBRE, AgenciasNombreCommand );
			addCommand( MainControl.EVENT_ESTADOSNOMBRE, EstadosNombreCommand );
			addCommand( MainControl.EVENT_AGENTESNOMBRE, AgentesNombreCommand );
			addCommand( MainControl.EVENT_OPERADORESNOMBRE, OperadoresNombreCommand );
			
			addCommand( MainControl.EVENT_EXPEDIENTES, ExpedientesCommand );
			addCommand( MainControl.EVENT_EXPEDIENTEDETALLE, ExpedienteDetalleCommand );
			addCommand( MainControl.EVENT_EXPEDIENTEDETALLEUPDATE, ExpedienteDetalleUpdateCommand );
			addCommand( MainControl.EVENT_EXPEDIENTEFACTURAS, ExpedienteFacturasCommand );
			addCommand( MainControl.EVENT_VOUCHERS, VouchersCommand );
			addCommand( MainControl.EVENT_VOUCHERDETALLE, VoucherDetalleCommand );
			addCommand( MainControl.EVENT_VOUCHERDETALLEUPDATE, VoucherDetalleUpdateCommand );
			addCommand( MainControl.EVENT_FACTURAS, FacturasCommand );
			addCommand( MainControl.EVENT_FACTURADETALLE, FacturaDetalleCommand );
			addCommand( MainControl.EVENT_FACTURADETALLEUPDATE, FacturaDetalleUpdateCommand );
			addCommand( MainControl.EVENT_FACTURADETALLEIMPRESOUPDATE, FacturaDetalleImpresoUpdateCommand );
			addCommand( MainControl.EVENT_FACTURACOSTOS, FacturaCostosCommand );
			addCommand( MainControl.EVENT_FACTURACOSTODETALLEUPDATE, FacturaCostoDetalleUpdateCommand );
			addCommand( MainControl.EVENT_FACTURACOSTODETALLEDELETE, FacturaCostoDetalleDeleteCommand );
			addCommand( MainControl.EVENT_EXPEDIENTECOSTOS, ExpedienteCostosCommand );
			addCommand( MainControl.EVENT_EXPEDIENTECOSTODETALLEUPDATE, ExpedienteCostoDetalleUpdateCommand );
			addCommand( MainControl.EVENT_EXPEDIENTECOSTODETALLEDELETE, ExpedienteCostoDetalleDeleteCommand );
		
			addCommand( MainControl.EVENT_OPERADORES, OperadoresCommand );
			addCommand( MainControl.EVENT_OPERADOREDETALLE, OperadoreDetalleCommand );
			addCommand( MainControl.EVENT_OPERADOREDETALLEUPDATE, OperadoreDetalleUpdateCommand );
			addCommand( MainControl.EVENT_AGENCIAS, AgenciasCommand );
			addCommand( MainControl.EVENT_AGENCIADETALLE, AgenciaDetalleCommand );
			addCommand( MainControl.EVENT_AGENCIADETALLEUPDATE, AgenciaDetalleUpdateCommand );
			addCommand( MainControl.EVENT_AGENTES, AgentesCommand );
			addCommand( MainControl.EVENT_AGENTEDETALLE, AgenteDetalleCommand );
			addCommand( MainControl.EVENT_AGENTEDETALLEUPDATE, AgenteDetalleUpdateCommand );
			addCommand( MainControl.EVENT_USUARIOS, UsuariosCommand );
			addCommand( MainControl.EVENT_USUARIODETALLE, UsuarioDetalleCommand );
			addCommand( MainControl.EVENT_USUARIODETALLEUPDATE, UsuarioDetalleUpdateCommand );
			addCommand( MainControl.EVENT_USUARIODETALLEDELETE, UsuarioDetalleDeleteCommand );
			
			addCommand( MainControl.EVENT_REPORTEVOUCHERS, ReporteVouchersCommand );
			addCommand( MainControl.EVENT_REPORTEFACTURAS, ReporteFacturasCommand );
			addCommand( MainControl.EVENT_REPORTEPAGOSOPERADORES, ReportePagosOperadoresCommand );
			addCommand( MainControl.EVENT_REPORTEPAGOSOPERADORESVOUCHERS, ReportePagosOperadoresVouchersCommand );
			addCommand( MainControl.EVENT_REPORTEPAGOSAGENTES, ReportePagosAgentesCommand );
			addCommand( MainControl.EVENT_REPORTERESUMENEXPEDIENTES, ReporteResumenExpedientesCommand );
			
			addCommand( MainControl.EVENT_COMISIONESPAGOS, ComisionesPagosCommand );
			addCommand( MainControl.EVENT_COMISIONESPAGOSINSERT, ComisionesPagosInsertCommand );
			addCommand( MainControl.EVENT_COMISIONESPAGOSUPDATE, ComisionesPagosUpdateCommand );
			addCommand( MainControl.EVENT_COMISIONISTASNOMBRE, ComisionistasNombreCommand );
		}
		
		public static const EVENT_COUNTER : String = "counter";
		public static const EVENT_COUNTEREXPNUM : String = "counterExpNum";
		public static const EVENT_COUNTEREXPNUMUPDATE : String = "counterExpNumUpdate";
		public static const EVENT_CLAVEADMINISTRADOR : String = "claveAdministrador";
		public static const EVENT_CLAVEADMINISTRADORUPDATE : String = "claveAdministradorUpdate";
		public static const EVENT_AGENCIASNOMBRE : String = "agenciasNombre";
		public static const EVENT_ESTADOSNOMBRE : String = "estadosNombre";
		public static const EVENT_AGENTESNOMBRE : String = "agentesNombre";
		public static const EVENT_OPERADORESNOMBRE : String = "operadoresNombre";
		
		public static const EVENT_EXPEDIENTES : String = "expedientes";
		public static const EVENT_EXPEDIENTEDETALLE : String = "expedienteDetalle";
		public static const EVENT_EXPEDIENTEDETALLEUPDATE : String = "expedienteDetalleUpdate";
		public static const EVENT_EXPEDIENTEFACTURAS : String = "expedienteFacturas";
		public static const EVENT_VOUCHERS : String = "vouchers";
		public static const EVENT_VOUCHERDETALLE : String = "voucherDetalle";
		public static const EVENT_VOUCHERDETALLEUPDATE : String = "voucherDetalleUpdate";
		public static const EVENT_FACTURAS : String = "facturas";
		public static const EVENT_FACTURADETALLE : String = "facturaDetalle";
		public static const EVENT_FACTURADETALLEUPDATE : String = "facturaDetalleUpdate";
		public static const EVENT_FACTURADETALLEIMPRESOUPDATE : String = "facturaDetalleImpresoUpdate";
		public static const EVENT_FACTURACOSTOS : String = "facturasCosto";
		public static const EVENT_FACTURACOSTODETALLEUPDATE : String = "facturaCostoDetalleUpdate";
		public static const EVENT_FACTURACOSTODETALLEDELETE : String = "facturaCostoDetalleDelete";
		public static const EVENT_EXPEDIENTECOSTOS : String = "expedientesCosto";
		public static const EVENT_EXPEDIENTECOSTODETALLEUPDATE : String = "expedienteCostoDetalleUpdate";
		public static const EVENT_EXPEDIENTECOSTODETALLEDELETE : String = "expedienteCostoDetalleDelete";
		
		public static const EVENT_OPERADORES : String = "operadores";
		public static const EVENT_OPERADOREDETALLE : String = "operadoreDetalle";
		public static const EVENT_OPERADOREDETALLEUPDATE : String = "operadoreDetalleUpdate";
		public static const EVENT_AGENCIAS : String = "agencias";
		public static const EVENT_AGENCIADETALLE : String = "agenciaDetalle";
		public static const EVENT_AGENCIADETALLEUPDATE : String = "agenciaDetalleUpdate";
		public static const EVENT_AGENTES : String = "agentes";
		public static const EVENT_AGENTEDETALLE : String = "agenteDetalle";
		public static const EVENT_AGENTEDETALLEUPDATE : String = "agenteDetalleUpdate";
		public static const EVENT_USUARIOS : String = "usuarios";
		public static const EVENT_USUARIODETALLE : String = "usuarioDetalle";
		public static const EVENT_USUARIODETALLEUPDATE : String = "usuarioDetalleUpdate";
		public static const EVENT_USUARIODETALLEDELETE : String = "usuarioDetalleDelete";
		
		public static const EVENT_REPORTEVOUCHERS : String = "reporteVouchers";
		public static const EVENT_REPORTEFACTURAS : String = "reporteFacturas";
		public static const EVENT_REPORTEPAGOSOPERADORES : String = "reportePagosOperadores";
		public static const EVENT_REPORTEPAGOSOPERADORESVOUCHERS : String = "reportePagosOperadoresVouchers";
		public static const EVENT_REPORTEPAGOSAGENTES : String = "reportePagosAgentes";
		public static const EVENT_REPORTERESUMENEXPEDIENTES : String = "reporteResumenExpedientes";
		
		public static const EVENT_COMISIONESPAGOS : String = "comisionesPagos";
		public static const EVENT_COMISIONESPAGOSINSERT : String = "comisionesPagosInsert";
		public static const EVENT_COMISIONESPAGOSUPDATE : String = "comisionesPagosUpdate";
		public static const EVENT_COMISIONISTASNOMBRE : String = "comisionistasNombre";
	}
}