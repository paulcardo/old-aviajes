package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.CounterVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class CounterExpNumEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var counterExpNumVO : CounterVO;
		
		/**
		 * The constructor
		 */
		public function CounterExpNumEvent( counterExpNumVO : CounterVO ) 
		{
			super( MainControl.EVENT_COUNTEREXPNUM );
			this.counterExpNumVO = counterExpNumVO;
		}
	}
}