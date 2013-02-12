package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.ReportePagosOperadoresVouchersVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class ReportePagosOperadoresVouchersDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function ReportePagosOperadoresVouchersDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function reportePagosOperadoresVouchers( reportePagosOperadoresVouchersVO : ReportePagosOperadoresVouchersVO ): void
		{
			var Query:String = "";

			if (reportePagosOperadoresVouchersVO.expAnno != "Todos"){
				Query = Query + " AND C.ExpAnno = " + reportePagosOperadoresVouchersVO.expAnno + " "
			}
			if (reportePagosOperadoresVouchersVO.estadoId == 1 ){ // adeudados
				Query = Query + " AND C.ChequeNum  = '' "
			} else if (reportePagosOperadoresVouchersVO.estadoId == 2 ){ // pagados
				Query = Query + " AND C.ChequeNum  > '' "
			}
			if (reportePagosOperadoresVouchersVO.operadorNombre != ""){
				Query = Query + " AND C.OpNombre like '%" + reportePagosOperadoresVouchersVO.operadorNombre + "%' "
			}
			var token : AsyncToken = service.GetReportePagosOperadoresVouchersList( Query );
			token.addResponder(responder);
		}
	}
}
