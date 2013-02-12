package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.AgentesNombreVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class AgentesNombreDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function AgentesNombreDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function agentesNombre( agentesNombreVO : AgentesNombreVO ): void
		{
			var token : AsyncToken = service.GetAgentesNombreList( );
			token.addResponder(responder);
		}
	}
}
