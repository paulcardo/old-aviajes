package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ComisionesPagosVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ComisionesPagosEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var comisionesPagosVO : ComisionesPagosVO;
		
		/**
		 * The constructor
		 */
		public function ComisionesPagosEvent( comisionesPagosVO : ComisionesPagosVO ) 
		{
			super( MainControl.EVENT_COMISIONESPAGOS );
			this.comisionesPagosVO = comisionesPagosVO;
		}
	}
}