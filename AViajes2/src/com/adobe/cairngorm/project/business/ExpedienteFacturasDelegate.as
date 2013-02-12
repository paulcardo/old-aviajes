package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.FacturasVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ExpedienteFacturasDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ExpedienteFacturasDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function facturas( facturasVO : FacturasVO ): void
		{
			var Query:String = "";
			
			if (facturasVO.expAnno != "Todos"){
				Query = Query + " AND E.ExpAnno = " + facturasVO.expAnno + " "
			}
			if (facturasVO.expNum != ""){
				Query = Query + " AND E.ExpNum = " + facturasVO.expNum + " "
			}

			var token : AsyncToken = service.GetFacturasList( Query );
			token.addResponder(responder);
		}
	}
}
