package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ComisionesPagosDetalleVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ComisionesPagosInsertDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ComisionesPagosInsertDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function comisionesPagosInsert( comisionesPagosInsertVO : ComisionesPagosDetalleVO ): void
		{
			var token : AsyncToken = service.InsertComisionPago( comisionesPagosInsertVO.expAnno, comisionesPagosInsertVO.expNum, comisionesPagosInsertVO.nombre, comisionesPagosInsertVO.cuenta, comisionesPagosInsertVO.costo, comisionesPagosInsertVO.fechaLimite, comisionesPagosInsertVO.concepto );
			token.addResponder(responder);
		}
	}
}
