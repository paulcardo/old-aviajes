package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ExpedienteCostosVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ExpedienteCostosDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ExpedienteCostosDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function expedienteCostos( expedienteCostosVO : ExpedienteCostosVO ): void
		{
			var token : AsyncToken = service.GetExpedienteCostosList( expedienteCostosVO.expAnno, expedienteCostosVO.expNum );
			token.addResponder(responder);
		}
	}
}
