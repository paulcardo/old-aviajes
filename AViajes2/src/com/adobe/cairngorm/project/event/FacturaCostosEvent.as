package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.FacturaCostosVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class FacturaCostosEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var facturaCostosVO : FacturaCostosVO;
		
		/**
		 * The constructor
		 */
		public function FacturaCostosEvent( facturaCostosVO : FacturaCostosVO ) 
		{
			super( MainControl.EVENT_FACTURACOSTOS );
			this.facturaCostosVO = facturaCostosVO;
		}
	}
}