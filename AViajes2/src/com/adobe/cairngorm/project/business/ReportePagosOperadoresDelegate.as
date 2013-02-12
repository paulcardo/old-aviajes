package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ReportePagosOperadoresVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ReportePagosOperadoresDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ReportePagosOperadoresDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function reportePagosOperadores( reportePagosOperadoresVO : ReportePagosOperadoresVO ): void
		{
			var Query:String = "";

			if (reportePagosOperadoresVO.expAnno != "Todos"){
				Query = Query + " AND ExpAnno = " + reportePagosOperadoresVO.expAnno + " "
			}
			if (reportePagosOperadoresVO.estadoId == 1 ){ // adeudados
				Query = Query + " AND ChequeNum  = '' "
			} else if (reportePagosOperadoresVO.estadoId == 2 ){ // pagados
				Query = Query + " AND ChequeNum  > '' "
			}
			if (reportePagosOperadoresVO.operadorNombre != ""){
				Query = Query + " AND OpNombre like '%" + reportePagosOperadoresVO.operadorNombre + "%' "
			}
			var token : AsyncToken = service.GetReportePagosOperadoresList( Query );
			token.addResponder(responder);
		}
	}
}
