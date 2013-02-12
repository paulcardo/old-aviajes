package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ClaveAdministradorVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ClaveAdministradorEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var claveAdministradorVO : ClaveAdministradorVO;
		
		/**
		 * The constructor
		 */
		public function ClaveAdministradorEvent( claveAdministradorVO : ClaveAdministradorVO ) 
		{
			super( MainControl.EVENT_CLAVEADMINISTRADOR );
			this.claveAdministradorVO = claveAdministradorVO;
		}
	}
}