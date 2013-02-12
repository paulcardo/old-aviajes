package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.AgenteDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class AgenteDetalleEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var agenteDetalleVO : AgenteDetalleVO;
		
		/**
		 * The constructor
		 */
		public function AgenteDetalleEvent( agenteDetalleVO : AgenteDetalleVO ) 
		{
			super( MainControl.EVENT_AGENTEDETALLE );
			this.agenteDetalleVO = agenteDetalleVO;
		}
	}
}