package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.UsuarioDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class UsuarioDetalleDeleteDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function UsuarioDetalleDeleteDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function usuarioDetalleDelete( usuarioDetalleVO : UsuarioDetalleVO ): void
		{
			var token : AsyncToken = service.DeleteUsuarioDetalle( usuarioDetalleVO.usrId);
			token.addResponder(responder);
		}
	}
}
