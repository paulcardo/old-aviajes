package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ExpedienteCostoDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ExpedienteCostoDetalleDeleteDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ExpedienteCostoDetalleDeleteDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function expedienteCostoDetalleDelete( expedienteCostoDetalleVO : ExpedienteCostoDetalleVO ): void
		{
			var token : AsyncToken = service.DeleteExpedienteCostoDetalle( expedienteCostoDetalleVO.costoId, expedienteCostoDetalleVO.expAnno, expedienteCostoDetalleVO.expNum );
			token.addResponder(responder);
		}
	}
}
