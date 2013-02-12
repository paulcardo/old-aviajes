package com.adobe.cairngorm.project.model 
{
 	import com.adobe.cairngorm.model.ModelLocator;

 	[Bindable]
	public class ModelLocator implements com.adobe.cairngorm.model.ModelLocator
	{
		private static var modelLocator : com.adobe.cairngorm.project.model.ModelLocator;
		
		public static function getInstance() : com.adobe.cairngorm.project.model.ModelLocator 
		{
			if ( modelLocator == null )
				modelLocator = new com.adobe.cairngorm.project.model.ModelLocator();
				
			return modelLocator;
	   }
	   
   	public function ModelLocator() 
   	{
   		if ( com.adobe.cairngorm.project.model.ModelLocator.modelLocator != null )
				throw new Error( "Only one ModelLocator instance should be instantiated" );	
   	}
		public var workflowState : Number;		
		public var counter : Counter = new Counter();
		public var claveAdministrador : ClaveAdministrador = new ClaveAdministrador();
		public var agenciasNombre : AgenciasNombre = new AgenciasNombre();
		public var estadosNombre : EstadosNombre = new EstadosNombre();
		public var agentesNombre : AgentesNombre = new AgentesNombre();
		public var operadoresNombre : OperadoresNombre = new OperadoresNombre();
		
		public var expedientes : Expedientes = new Expedientes();
		public var expedienteDetalle : ExpedienteDetalle = new ExpedienteDetalle();
		public var expedienteDetalleUpdate : ExpedienteDetalleUpdate = new ExpedienteDetalleUpdate();
		public var vouchers : Vouchers = new Vouchers();
		public var voucherDetalle : VoucherDetalle = new VoucherDetalle();
		public var voucherDetalleUpdate : VoucherDetalleUpdate = new VoucherDetalleUpdate();
		public var facturas : Facturas = new Facturas();
		public var facturaDetalle : FacturaDetalle = new FacturaDetalle();
		public var facturaDetalleUpdate : FacturaDetalleUpdate = new FacturaDetalleUpdate();
		public var facturaDetalleImpresoUpdate : FacturaDetalleImpresoUpdate = new FacturaDetalleImpresoUpdate();
		public var facturaCostos : FacturaCostos = new FacturaCostos();
		public var facturaCostoDetalleUpdate : FacturaCostoDetalleUpdate = new FacturaCostoDetalleUpdate();
		public var facturaCostoDetalleDelete : FacturaCostoDetalleDelete = new FacturaCostoDetalleDelete();
		public var expedienteCostos : ExpedienteCostos = new ExpedienteCostos();
		public var expedienteCostoDetalleUpdate : ExpedienteCostoDetalleUpdate = new ExpedienteCostoDetalleUpdate();
		public var expedienteCostoDetalleDelete : ExpedienteCostoDetalleDelete = new ExpedienteCostoDetalleDelete();
		
		public var operadores : Operadores = new Operadores();
		public var operadoreDetalle : OperadoreDetalle = new OperadoreDetalle();
		public var operadoreDetalleUpdate : OperadoreDetalleUpdate = new OperadoreDetalleUpdate();
		public var agencias : Agencias = new Agencias();
		public var agenciaDetalle : AgenciaDetalle = new AgenciaDetalle();
		public var agenciaDetalleUpdate : AgenciaDetalleUpdate = new AgenciaDetalleUpdate();
		public var agentes : Agentes = new Agentes();
		public var agenteDetalle : AgenteDetalle = new AgenteDetalle();
		public var agenteDetalleUpdate : AgenteDetalleUpdate = new AgenteDetalleUpdate();
		public var usuarios : Usuarios = new Usuarios();
		public var usuarioDetalle : UsuarioDetalle = new UsuarioDetalle();
		public var usuarioDetalleUpdate : UsuarioDetalleUpdate = new UsuarioDetalleUpdate();
		public var usuarioDetalleDelete : UsuarioDetalleDelete = new UsuarioDetalleDelete();
		
		public var reporteVouchers : ReporteVouchers = new ReporteVouchers();
		public var reporteFacturas : ReporteFacturas = new ReporteFacturas();
		public var reportePagosOperadores : ReportePagosOperadores = new ReportePagosOperadores();
		public var reportePagosOperadoresVouchers : ReportePagosOperadoresVouchers = new ReportePagosOperadoresVouchers();
		public var reportePagosAgentes : ReportePagosAgentes = new ReportePagosAgentes();
		public var reporteResumenExpedientes : ReporteResumenExpedientes = new ReporteResumenExpedientes();
		
		public var comisionesPagos : ComisionesPagos = new ComisionesPagos();
		public var comisionesPagosInsert : ComisionesPagosInsert = new ComisionesPagosInsert();
		public var comisionesPagosUpdate : ComisionesPagosUpdate = new ComisionesPagosUpdate();
		public var comisionistasNombre : ComisionistasNombre = new ComisionistasNombre();
	}	
}

