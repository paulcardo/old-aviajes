package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.CounterVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class CounterExpNumUpdateDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function CounterExpNumUpdateDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function counterExpNumUpdate( counterExpNumUpdateVO : CounterVO ): void
		{
			var token : AsyncToken = service.UpdateCounterExpNum( counterExpNumUpdateVO.expNum );
			token.addResponder(responder);
		}
	}
}
