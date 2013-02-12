package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.EstadosNombreVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class EstadosNombreDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function EstadosNombreDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function estadosNombre( estadosNombreVO : EstadosNombreVO ): void
		{
			var token : AsyncToken = service.GetEstadosNombreList( );
			token.addResponder(responder);
		}
	}
}
