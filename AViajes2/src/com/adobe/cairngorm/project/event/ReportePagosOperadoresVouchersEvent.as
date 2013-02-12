package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ReportePagosOperadoresVouchersVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ReportePagosOperadoresVouchersEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var reportePagosOperadoresVouchersVO : ReportePagosOperadoresVouchersVO;
		
		/**
		 * The constructor
		 */
		public function ReportePagosOperadoresVouchersEvent( reportePagosOperadoresVouchersVO : ReportePagosOperadoresVouchersVO ) 
		{
			super( MainControl.EVENT_REPORTEPAGOSOPERADORESVOUCHERS );
			this.reportePagosOperadoresVouchersVO = reportePagosOperadoresVouchersVO;
		}
	}
}