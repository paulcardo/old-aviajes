package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ExpedienteDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ExpedienteDetalleEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var expedienteDetalleVO : ExpedienteDetalleVO;
		
		/**
		 * The constructor
		 */
		public function ExpedienteDetalleEvent( expedienteDetalleVO : ExpedienteDetalleVO ) 
		{
			super( MainControl.EVENT_EXPEDIENTEDETALLE );
			this.expedienteDetalleVO = expedienteDetalleVO;
		}
	}
}