package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.FacturaCostoDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class FacturaCostoDetalleUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function FacturaCostoDetalleUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function facturaCostoDetalleUpdate( facturaCostoDetalleVO : FacturaCostoDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateFacturaCostoDetalle( facturaCostoDetalleVO.costoId, facturaCostoDetalleVO.expAnno, facturaCostoDetalleVO.expNum, facturaCostoDetalleVO.facNumId, facturaCostoDetalleVO.agntNombre, facturaCostoDetalleVO.costo, facturaCostoDetalleVO.chequeNum );
			token.addResponder(responder);
		}
	}
}
