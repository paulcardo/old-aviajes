package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.UsuariosVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class UsuariosDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function UsuariosDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function usuarios( usuariosVO : UsuariosVO ): void
		{
			var token : AsyncToken = service.GetUsuariosList( );
			token.addResponder(responder);
		}
	}
}
