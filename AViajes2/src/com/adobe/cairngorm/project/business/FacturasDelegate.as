package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.FacturasVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class FacturasDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function FacturasDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function facturas( facturasVO : FacturasVO ): void
		{
			var Query:String = "";

			if (facturasVO.facNumId != ""){
				Query = Query + " AND E.facNumId = " + facturasVO.facNumId + " "
			}
			if (facturasVO.expAnno != "Todos"){
				Query = Query + " AND E.ExpAnno = " + facturasVO.expAnno + " "
			}
			if (facturasVO.expNum != ""){
				Query = Query + " AND E.ExpNum =" + facturasVO.expNum + " "
			}
			if (facturasVO.paxNombre != ""){
				Query = Query + " AND E.PaxNombre like '%" + facturasVO.paxNombre + "%' "
			}
			if (facturasVO.agenciaNombre != ""){
				Query = Query + " AND E.AgNombre like '%" + facturasVO.agenciaNombre + "%' "
			}

			var token : AsyncToken = service.GetFacturasList( Query );
			token.addResponder(responder);
		}
	}
}
