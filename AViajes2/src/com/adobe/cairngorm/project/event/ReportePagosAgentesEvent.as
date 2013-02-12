package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ReportePagosAgentesVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ReportePagosAgentesEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var reportePagosAgentesVO : ReportePagosAgentesVO;
		
		/**
		 * The constructor
		 */
		public function ReportePagosAgentesEvent( reportePagosAgentesVO : ReportePagosAgentesVO ) 
		{
			super( MainControl.EVENT_REPORTEPAGOSAGENTES );
			this.reportePagosAgentesVO = reportePagosAgentesVO;
		}
	}
}