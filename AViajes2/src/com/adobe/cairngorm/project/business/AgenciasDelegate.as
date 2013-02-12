package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.AgenciasVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class AgenciasDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function AgenciasDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function agencias( agenciasVO : AgenciasVO ): void
		{
			var token : AsyncToken = service.GetAgenciasList( agenciasVO.nombre );
			token.addResponder(responder);
		}
	}
}
