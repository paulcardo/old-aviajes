package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.AgenciasNombreVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class AgenciasNombreDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function AgenciasNombreDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function agenciasNombre( agenciasNombreVO : AgenciasNombreVO ): void
		{
			var token : AsyncToken = service.GetAgenciasNombreList( );
			token.addResponder(responder);
		}
	}
}
