package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.CounterVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class CounterExpNumUpdateEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var counterExpNumUpdateVO : CounterVO;
		
		/**
		 * The constructor
		 */
		public function CounterExpNumUpdateEvent( counterExpNumUpdateVO : CounterVO ) 
		{
			super( MainControl.EVENT_COUNTEREXPNUMUPDATE );
			this.counterExpNumUpdateVO = counterExpNumUpdateVO;
		}
	}
}