package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.VouchersVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class VouchersEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var vouchersVO : VouchersVO;
		
		/**
		 * The constructor
		 */
		public function VouchersEvent( vouchersVO : VouchersVO ) 
		{
			super( MainControl.EVENT_VOUCHERS );
			this.vouchersVO = vouchersVO;
		}
	}
}