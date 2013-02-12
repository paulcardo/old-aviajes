package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ExpedienteCostosVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ExpedienteCostosEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var expedienteCostosVO : ExpedienteCostosVO;
		
		/**
		 * The constructor
		 */
		public function ExpedienteCostosEvent( expedienteCostosVO : ExpedienteCostosVO ) 
		{
			super( MainControl.EVENT_EXPEDIENTECOSTOS );
			this.expedienteCostosVO = expedienteCostosVO;
		}
	}
}