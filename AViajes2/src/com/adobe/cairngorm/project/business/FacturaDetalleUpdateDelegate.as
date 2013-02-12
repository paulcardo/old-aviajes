package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.FacturaDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class FacturaDetalleUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function FacturaDetalleUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function facturaDetalleUpdate( facturaDetalleVO : FacturaDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateFacturaDetalle( facturaDetalleVO.facNumId, facturaDetalleVO.expAnno, facturaDetalleVO.expNum, facturaDetalleVO.fechaString, facturaDetalleVO.estId, facturaDetalleVO.total, facturaDetalleVO.tipoCambio, facturaDetalleVO.agNombre, facturaDetalleVO.agntNombre, facturaDetalleVO.paxNombre, facturaDetalleVO.usrNombre, facturaDetalleVO.detalle );
			token.addResponder(responder);
		}
	}
}
