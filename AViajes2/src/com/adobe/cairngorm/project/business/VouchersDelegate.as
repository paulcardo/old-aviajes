package com.adobe.cairngorm.project.business 
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.project.vo.VouchersVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class VouchersDelegate
	{
		private var responder : IResponder;
		private var service : Object;
		
		public function VouchersDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService( "ManagementWS" );
			this.responder = responder;
		}
		
		public function vouchers( vouchersVO : VouchersVO ): void
		{
			var Query:String = "";

			if (vouchersVO.vouId != ""){
				Query = Query + " AND E.vouId = " + vouchersVO.vouId + " "
			}
			if (vouchersVO.expAnno != "Todos"){
				Query = Query + " AND E.ExpAnno = " + vouchersVO.expAnno + " "
			}
			if (vouchersVO.expNum != ""){
				Query = Query + " AND E.ExpNum =" + vouchersVO.expNum + " "
			}
			if (vouchersVO.paxNombre != ""){
				Query = Query + " AND E.PaxNombre like '%" + vouchersVO.paxNombre + "%' "
			}
			if (vouchersVO.operadorNombre != ""){
				Query = Query + " AND E.OpNombre like '%" + vouchersVO.operadorNombre + "%' "
			}

			var token : AsyncToken = service.GetVouchersList( Query );
			token.addResponder(responder);
		}
	}
}
