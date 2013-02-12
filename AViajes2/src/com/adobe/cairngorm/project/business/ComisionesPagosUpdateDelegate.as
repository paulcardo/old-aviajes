package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ComisionesPagosDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ComisionesPagosUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ComisionesPagosUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function comisionesPagosUpdate( comisionesPagosUpdateVO : ComisionesPagosDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateComisionPago( comisionesPagosUpdateVO.comisionesPagosId, comisionesPagosUpdateVO.estado, comisionesPagosUpdateVO.observaciones );
			token.addResponder(responder);
		}
	}
}
