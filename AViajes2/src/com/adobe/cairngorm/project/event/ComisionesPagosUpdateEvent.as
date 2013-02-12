package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ComisionesPagosDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ComisionesPagosUpdateEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var comisionesPagosUpdateVO : ComisionesPagosDetalleVO;
		
		/**
		 * The constructor
		 */
		public function ComisionesPagosUpdateEvent( comisionesPagosUpdateVO : ComisionesPagosDetalleVO ) 
		{
			super( MainControl.EVENT_COMISIONESPAGOSUPDATE );
			this.comisionesPagosUpdateVO = comisionesPagosUpdateVO;
		}
	}
}