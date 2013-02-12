package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ReporteFacturasVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ReporteFacturasEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var reporteFacturasVO : ReporteFacturasVO;
		
		/**
		 * The constructor
		 */
		public function ReporteFacturasEvent( reporteFacturasVO : ReporteFacturasVO ) 
		{
			super( MainControl.EVENT_REPORTEFACTURAS );
			this.reporteFacturasVO = reporteFacturasVO;
		}
	}
}