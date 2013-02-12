package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ExpedienteCostoDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ExpedienteCostoDetalleUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ExpedienteCostoDetalleUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function expedienteCostoDetalleUpdate( expedienteCostoDetalleVO : ExpedienteCostoDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateExpedienteCostoDetalle( expedienteCostoDetalleVO.costoId, expedienteCostoDetalleVO.expAnno, expedienteCostoDetalleVO.expNum, expedienteCostoDetalleVO.opNombre, expedienteCostoDetalleVO.costo, expedienteCostoDetalleVO.chequeNum );
			token.addResponder(responder);
		}
	}
}
