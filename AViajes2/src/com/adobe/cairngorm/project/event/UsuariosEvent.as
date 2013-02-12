package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.UsuariosVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class UsuariosEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var usuariosVO : UsuariosVO;
		
		/**
		 * The constructor
		 */
		public function UsuariosEvent( usuariosVO : UsuariosVO ) 
		{
			super( MainControl.EVENT_USUARIOS );
			this.usuariosVO = usuariosVO;
		}
	}
}