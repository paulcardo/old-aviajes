package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.OperadoreDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class OperadoreDetalleDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function OperadoreDetalleDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function operadoreDetalle( operadoreDetalleVO : OperadoreDetalleVO ): void
		{
			var token : AsyncToken = service.GetOperadoreDetalle( operadoreDetalleVO.opId );
			token.addResponder(responder);
		}
	}
}
