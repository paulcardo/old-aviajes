package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.CounterVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class CounterEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var counterVO : CounterVO;
		
		/**
		 * The constructor
		 */
		public function CounterEvent( counterVO : CounterVO ) 
		{
			super( MainControl.EVENT_COUNTER );
			this.counterVO = counterVO;
		}
	}
}