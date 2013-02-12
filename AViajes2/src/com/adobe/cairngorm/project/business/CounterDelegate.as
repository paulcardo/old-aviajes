package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.CounterVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class CounterDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function CounterDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function counter( counterVO : CounterVO ): void
		{
			var token : AsyncToken = service.GetCounter( counterVO.SeqName );
			token.addResponder(responder);
		}
	}
}
