package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.OperadoresVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class OperadoresEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var operadoresVO : OperadoresVO;
		
		/**
		 * The constructor
		 */
		public function OperadoresEvent( operadoresVO : OperadoresVO ) 
		{
			super( MainControl.EVENT_OPERADORES );
			this.operadoresVO = operadoresVO;
		}
	}
}