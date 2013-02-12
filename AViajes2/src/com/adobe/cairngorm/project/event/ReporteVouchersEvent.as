package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ReporteVouchersVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ReporteVouchersEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var reporteVouchersVO : ReporteVouchersVO;
		
		/**
		 * The constructor
		 */
		public function ReporteVouchersEvent( reporteVouchersVO : ReporteVouchersVO ) 
		{
			super( MainControl.EVENT_REPORTEVOUCHERS );
			this.reporteVouchersVO = reporteVouchersVO;
		}
	}
}