package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.VoucherDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class VoucherDetalleDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function VoucherDetalleDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function voucherDetalle( voucherDetalleVO : VoucherDetalleVO ): void
		{
			var token : AsyncToken = service.GetVoucherDetalle( voucherDetalleVO.vouId );
			token.addResponder(responder);
		}
	}
}
