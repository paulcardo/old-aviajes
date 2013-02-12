package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ComisionesPagosVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ComisionesPagosDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ComisionesPagosDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function comisionesPagos( comisionesPagosVO : ComisionesPagosVO ): void
		{
			var token : AsyncToken = service.GetComisionesPagosList( comisionesPagosVO.estado );
			token.addResponder(responder);
		}
	}
}
