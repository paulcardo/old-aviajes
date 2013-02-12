package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.FacturaDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class FacturaDetalleEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var facturaDetalleVO : FacturaDetalleVO;
		
		/**
		 * The constructor
		 */
		public function FacturaDetalleEvent( facturaDetalleVO : FacturaDetalleVO ) 
		{
			super( MainControl.EVENT_FACTURADETALLE );
			this.facturaDetalleVO = facturaDetalleVO;
		}
	}
}