package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ExpedienteCostoDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ExpedienteCostoDetalleUpdateEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var expedienteCostoDetalleVO : ExpedienteCostoDetalleVO;
		
		/**
		 * The constructor
		 */
		public function ExpedienteCostoDetalleUpdateEvent( expedienteCostoDetalleVO : ExpedienteCostoDetalleVO ) 
		{
			super( MainControl.EVENT_EXPEDIENTECOSTODETALLEUPDATE );
			this.expedienteCostoDetalleVO = expedienteCostoDetalleVO;
		}
	}
}