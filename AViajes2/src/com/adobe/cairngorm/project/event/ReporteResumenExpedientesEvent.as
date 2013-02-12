package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ReporteResumenExpedientesVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ReporteResumenExpedientesEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var reporteResumenExpedientesVO : ReporteResumenExpedientesVO;
		
		/**
		 * The constructor
		 */
		public function ReporteResumenExpedientesEvent( reporteResumenExpedientesVO : ReporteResumenExpedientesVO ) 
		{
			super( MainControl.EVENT_REPORTERESUMENEXPEDIENTES );
			this.reporteResumenExpedientesVO = reporteResumenExpedientesVO;
		}
	}
}