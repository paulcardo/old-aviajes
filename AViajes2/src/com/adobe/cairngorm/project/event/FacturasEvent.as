package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.FacturasVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class FacturasEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var facturasVO : FacturasVO;
		
		/**
		 * The constructor
		 */
		public function FacturasEvent( facturasVO : FacturasVO ) 
		{
			super( MainControl.EVENT_FACTURAS );
			this.facturasVO = facturasVO;
		}
	}
}