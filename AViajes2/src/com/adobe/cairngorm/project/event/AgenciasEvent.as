package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.AgenciasVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class AgenciasEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var agenciasVO : AgenciasVO;
		
		/**
		 * The constructor
		 */
		public function AgenciasEvent( agenciasVO : AgenciasVO ) 
		{
			super( MainControl.EVENT_AGENCIAS );
			this.agenciasVO = agenciasVO;
		}
	}
}