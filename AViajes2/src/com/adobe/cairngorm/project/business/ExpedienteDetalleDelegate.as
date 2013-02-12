package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ExpedienteDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ExpedienteDetalleDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ExpedienteDetalleDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function expedienteDetalle( expedienteDetalleVO : ExpedienteDetalleVO ): void
		{
			var token : AsyncToken = service.GetExpedienteDetalle( expedienteDetalleVO.expAnno, expedienteDetalleVO.expNum );
			token.addResponder(responder);
		}
	}
}
