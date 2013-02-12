package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ClaveAdministradorVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ClaveAdministradorUpdateEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var claveAdministradorUpdateVO : ClaveAdministradorVO;
		
		/**
		 * The constructor
		 */
		public function ClaveAdministradorUpdateEvent( claveAdministradorUpdateVO : ClaveAdministradorVO ) 
		{
			super( MainControl.EVENT_CLAVEADMINISTRADORUPDATE );
			this.claveAdministradorUpdateVO = claveAdministradorUpdateVO;
		}
	}
}