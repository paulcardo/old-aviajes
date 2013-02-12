package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ExpedientesVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ExpedientesDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ExpedientesDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function expedientes( expedientesVO : ExpedientesVO ): void
		{
			var Query:String = "";

			if (expedientesVO.expAnno != "Todos"){
				Query = Query + " AND E.ExpAnno = " + expedientesVO.expAnno + " "
			}
			if (expedientesVO.expNum != ""){
				Query = Query + " AND E.ExpNum =" + expedientesVO.expNum + " "
			}
			if (expedientesVO.paxNombre != ""){
				Query = Query + " AND E.PaxNombre like '%" + expedientesVO.paxNombre + "%' "
			}
			if (expedientesVO.agenciaNombre != ""){
				Query = Query + " AND E.AgNombre like '%" + expedientesVO.agenciaNombre + "%' "
			}
			if (expedientesVO.operadorNombre != ""){
				Query = Query + " AND O.OpNombre like '%" + expedientesVO.operadorNombre + "%' "
			}

			var token : AsyncToken = service.GetExpedientesList( Query );
			token.addResponder(responder);
		}
	}
}
