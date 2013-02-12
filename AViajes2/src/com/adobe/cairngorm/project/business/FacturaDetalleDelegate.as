package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.FacturaDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class FacturaDetalleDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function FacturaDetalleDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function facturaDetalle( facturaDetalleVO : FacturaDetalleVO ): void
		{
			var token : AsyncToken = service.GetFacturaDetalle( facturaDetalleVO.facNumId );
			token.addResponder(responder);
		}
	}
}
