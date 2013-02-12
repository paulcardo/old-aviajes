package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.OperadoresVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class OperadoresDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function OperadoresDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function operadores( operadoresVO : OperadoresVO ): void
		{
			var token : AsyncToken = service.GetOperadoresList( operadoresVO.nombre );
			token.addResponder(responder);
		}
	}
}
