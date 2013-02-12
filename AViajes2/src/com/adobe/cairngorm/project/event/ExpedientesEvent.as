package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ExpedientesVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ExpedientesEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var expedientesVO : ExpedientesVO;
		
		/**
		 * The constructor
		 */
		public function ExpedientesEvent( expedientesVO : ExpedientesVO ) 
		{
			super( MainControl.EVENT_EXPEDIENTES );
			this.expedientesVO = expedientesVO;
		}
	}
}