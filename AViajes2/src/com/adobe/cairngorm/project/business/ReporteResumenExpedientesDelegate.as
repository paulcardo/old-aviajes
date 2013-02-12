package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ReporteResumenExpedientesVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ReporteResumenExpedientesDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ReporteResumenExpedientesDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function reporteResumenExpedientes( reporteResumenExpedientesVO : ReporteResumenExpedientesVO ): void
		{
			var token : AsyncToken = service.GetReporteResumenExpedientesList( reporteResumenExpedientesVO.expAnno );
			token.addResponder(responder);
		}
	}
}
