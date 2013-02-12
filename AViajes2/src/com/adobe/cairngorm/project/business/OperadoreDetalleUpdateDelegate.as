package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.OperadoreDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class OperadoreDetalleUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function OperadoreDetalleUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function operadoreDetalleUpdate( operadoreDetalleVO : OperadoreDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateOperadoreDetalle( operadoreDetalleVO.opId, operadoreDetalleVO.nombre, operadoreDetalleVO.direccion, operadoreDetalleVO.telefono, operadoreDetalleVO.telefono2, operadoreDetalleVO.fax, operadoreDetalleVO.email, operadoreDetalleVO.contacto );
			token.addResponder(responder);
		}
	}
}
