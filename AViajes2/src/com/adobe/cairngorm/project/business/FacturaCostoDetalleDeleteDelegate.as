package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.FacturaCostoDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class FacturaCostoDetalleDeleteDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function FacturaCostoDetalleDeleteDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function facturaCostoDetalleDelete( facturaCostoDetalleVO : FacturaCostoDetalleVO ): void
		{
			var token : AsyncToken = service.DeleteFacturaCostoDetalle( facturaCostoDetalleVO.costoId, facturaCostoDetalleVO.facNumId );
			token.addResponder(responder);
		}
	}
}
