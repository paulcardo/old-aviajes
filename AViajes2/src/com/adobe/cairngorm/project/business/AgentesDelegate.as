package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.AgentesVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class AgentesDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function AgentesDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function agentes( agentesVO : AgentesVO ): void
		{
			var token : AsyncToken = service.GetAgentesList( agentesVO.nombre, agentesVO.agenciaNombre );
			token.addResponder(responder);
		}
	}
}
