package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.VoucherDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class VoucherDetalleUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function VoucherDetalleUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function voucherDetalleUpdate( voucherDetalleVO : VoucherDetalleVO ): void
		{
			var token : AsyncToken = service.UpdateVoucherDetalle( voucherDetalleVO.vouId, voucherDetalleVO.expAnno, voucherDetalleVO.expNum, voucherDetalleVO.fechaString, voucherDetalleVO.agente, voucherDetalleVO.direccion, voucherDetalleVO.paxNombre, voucherDetalleVO.paxNum, voucherDetalleVO.confirmacionNum, voucherDetalleVO.servicios, voucherDetalleVO.usrNombre, voucherDetalleVO.estId, voucherDetalleVO.opNombre );
			token.addResponder(responder);
		}
	}
}
