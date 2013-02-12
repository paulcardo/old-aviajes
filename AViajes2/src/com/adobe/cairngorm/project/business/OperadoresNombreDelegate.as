package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.OperadoresNombreVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class OperadoresNombreDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function OperadoresNombreDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function operadoresNombre( operadoresNombreVO : OperadoresNombreVO ): void
		{
			var token : AsyncToken = service.GetOperadoresNombreList( );
			token.addResponder(responder);
		}
	}
}
