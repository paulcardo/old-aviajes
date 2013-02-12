package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ExpedienteDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ExpedienteDetalleUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ExpedienteDetalleUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function expedienteDetalleUpdate( expedienteDetalleVO : ExpedienteDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateExpedienteDetalle( expedienteDetalleVO.expAnno, expedienteDetalleVO.expNum, expedienteDetalleVO.paxNombre, expedienteDetalleVO.paxNum, expedienteDetalleVO.excursion, expedienteDetalleVO.reservaNum, expedienteDetalleVO.confirmacionNum, expedienteDetalleVO.agenciaNombre );
			token.addResponder(responder);
		}
	}
}
