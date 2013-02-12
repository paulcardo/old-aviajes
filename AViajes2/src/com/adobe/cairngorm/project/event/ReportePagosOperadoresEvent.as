package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ReportePagosOperadoresVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ReportePagosOperadoresEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var reportePagosOperadoresVO : ReportePagosOperadoresVO;
		
		/**
		 * The constructor
		 */
		public function ReportePagosOperadoresEvent( reportePagosOperadoresVO : ReportePagosOperadoresVO ) 
		{
			super( MainControl.EVENT_REPORTEPAGOSOPERADORES );
			this.reportePagosOperadoresVO = reportePagosOperadoresVO;
		}
	}
}