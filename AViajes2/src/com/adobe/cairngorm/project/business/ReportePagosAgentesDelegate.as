package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ReportePagosAgentesVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ReportePagosAgentesDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ReportePagosAgentesDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function reportePagosAgentes( reportePagosAgentesVO : ReportePagosAgentesVO ): void
		{
			var Query:String = "";

			if (reportePagosAgentesVO.expAnno != "Todos"){
				Query = Query + " AND C.ExpAnno = " + reportePagosAgentesVO.expAnno + " "
			}
			if (reportePagosAgentesVO.estadoId == 1 ){ // adeudados
				Query = Query + " AND C.ChequeNum  = '' "
			} else if (reportePagosAgentesVO.estadoId == 2 ){ // pagados
				Query = Query + " AND C.ChequeNum  > '' "
			}
			if (reportePagosAgentesVO.agenteNombre != ""){
				Query = Query + " AND C.AgntNombre like '%" + reportePagosAgentesVO.agenteNombre + "%' "
			}
			var token : AsyncToken = service.GetReportePagosAgentesList( Query );
			token.addResponder(responder);
		}
	}
}
