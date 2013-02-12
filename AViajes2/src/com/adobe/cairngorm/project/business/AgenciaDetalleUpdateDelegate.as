package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.AgenciaDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class AgenciaDetalleUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function AgenciaDetalleUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function agenciaDetalleUpdate( agenciaDetalleVO : AgenciaDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateAgenciaDetalle( agenciaDetalleVO.agId, agenciaDetalleVO.nombre, agenciaDetalleVO.direccion, agenciaDetalleVO.telefono, agenciaDetalleVO.telefono2, agenciaDetalleVO.fax, agenciaDetalleVO.email, agenciaDetalleVO.contacto );
			token.addResponder(responder);
		}
	}
}
