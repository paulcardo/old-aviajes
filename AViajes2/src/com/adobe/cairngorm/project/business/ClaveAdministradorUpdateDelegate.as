package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ClaveAdministradorVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ClaveAdministradorUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ClaveAdministradorUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function claveAdministradorUpdate( claveAdministradorUpdateVO : ClaveAdministradorVO ): void
		{
			var token : AsyncToken = service.UpdateClaveAdministrador( claveAdministradorUpdateVO.claveActual, claveAdministradorUpdateVO.claveNueva );
			token.addResponder(responder);
		}
	}
}
