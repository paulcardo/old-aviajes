package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.FacturaDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class FacturaDetalleImpresoUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function FacturaDetalleImpresoUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function facturaDetalleImpresoUpdate( facturaDetalleVO : FacturaDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateFacturaDetalleImpreso(facturaDetalleVO.facNumId);
			token.addResponder(responder);
		}
	}
}
