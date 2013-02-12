package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ComisionistasNombreVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ComisionistasNombreDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ComisionistasNombreDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function comisionistasNombre( comisionistasNombreVO : ComisionistasNombreVO ): void
		{
			var token : AsyncToken = service.GetComisionistasNombreList( );
			token.addResponder(responder);
		}
	}
}
