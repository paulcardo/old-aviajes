package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ClaveAdministradorVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ClaveAdministradorDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ClaveAdministradorDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function claveAdministrador( claveAdministradorVO : ClaveAdministradorVO ): void
		{
			var token : AsyncToken = service.GetClaveAdministrador( );
			token.addResponder(responder);
		}
	}
}
