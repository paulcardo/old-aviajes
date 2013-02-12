package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.AgenteDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class AgenteDetalleDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function AgenteDetalleDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function agenteDetalle( agenteDetalleVO : AgenteDetalleVO ): void
		{
			var token : AsyncToken = service.GetAgenteDetalle( agenteDetalleVO.agntId );
			token.addResponder(responder);
		}
	}
}
