package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ReporteFacturasVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ReporteFacturasDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ReporteFacturasDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function reporteFacturas( reporteFacturasVO : ReporteFacturasVO ): void
		{
			var Query:String = "";

			if (reporteFacturasVO.expAnno != "Todos"){
				Query = Query + " AND E.ExpAnno = " + reporteFacturasVO.expAnno + " "
			}
			if (reporteFacturasVO.estadoId > -1 ){
				Query = Query + " AND O.estId = " + reporteFacturasVO.estadoId + " "
			}			
			if (reporteFacturasVO.agenciaNombre != ""){
				Query = Query + " AND E.AgNombre like '%" + reporteFacturasVO.agenciaNombre + "%' "
			}
			if (reporteFacturasVO.porFecha){
				Query = Query + " AND E.Fecha >= '" + reporteFacturasVO.fechaDesde + "'";
				Query = Query + " AND E.Fecha <= '" + reporteFacturasVO.fechaHasta + "'";
			}
			var token : AsyncToken = service.GetReporteFacturasList( Query );
			token.addResponder(responder);
		}
	}
}
