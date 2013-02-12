package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.UsuarioDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class UsuarioDetalleUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function UsuarioDetalleUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function usuarioDetalleUpdate( usuarioDetalleVO : UsuarioDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateUsuarioDetalle( usuarioDetalleVO.usrId, usuarioDetalleVO.nombre );
			token.addResponder(responder);
		}
	}
}
