package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ReporteVouchersVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ReporteVouchersDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ReporteVouchersDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function reporteVouchers( reporteVouchersVO : ReporteVouchersVO ): void
		{
			var Query:String = "";

			if (reporteVouchersVO.expAnno != "Todos"){
				Query = Query + " AND E.ExpAnno = " + reporteVouchersVO.expAnno + " "
			}
			if (reporteVouchersVO.estadoId > -1 ){
				Query = Query + " AND O.estId = " + reporteVouchersVO.estadoId + " "
			}			
			if (reporteVouchersVO.operadorNombre != ""){
				Query = Query + " AND E.OpNombre like '%" + reporteVouchersVO.operadorNombre + "%' "
			}
			if (reporteVouchersVO.porFecha){
				Query = Query + " AND E.Fecha >= '" + reporteVouchersVO.fechaDesde + "'";
				Query = Query + " AND E.Fecha <= '" + reporteVouchersVO.fechaHasta + "'";
			}
			var token : AsyncToken = service.GetReporteVouchersList( Query );
			token.addResponder(responder);
		}
	}
}
