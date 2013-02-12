package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.FacturaCostosVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class FacturaCostosDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function FacturaCostosDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function facturaCostos( facturaCostosVO : FacturaCostosVO ): void
		{
			var token : AsyncToken = service.GetFacturaCostosList( facturaCostosVO.facNumId );
			token.addResponder(responder);
		}
	}
}
