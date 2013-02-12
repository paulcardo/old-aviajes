package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.AgenciaDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class AgenciaDetalleDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function AgenciaDetalleDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function agenciaDetalle( agenciaDetalleVO : AgenciaDetalleVO ): void
		{
			var token : AsyncToken = service.GetAgenciaDetalle( agenciaDetalleVO.agId );
			token.addResponder(responder);
		}
	}
}
