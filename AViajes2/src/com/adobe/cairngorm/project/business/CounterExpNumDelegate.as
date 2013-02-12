package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.CounterVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class CounterExpNumDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function CounterExpNumDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function counterExpNum( counterExpNumVO : CounterVO ): void
		{
			var token : AsyncToken = service.GetCounterExpNum( counterExpNumVO.SeqName );
			token.addResponder(responder);
		}
	}
}
