package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.AgenteDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class AgenteDetalleUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function AgenteDetalleUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function agenteDetalleUpdate( agenteDetalleVO : AgenteDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateAgenteDetalle( agenteDetalleVO.agntId, agenteDetalleVO.nombre, agenteDetalleVO.agenciaNombre, agenteDetalleVO.tipoPago, agenteDetalleVO.porcentaje );
			token.addResponder(responder);
		}
	}
}
