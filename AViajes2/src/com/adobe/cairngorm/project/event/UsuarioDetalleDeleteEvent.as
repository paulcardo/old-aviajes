package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.UsuarioDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class UsuarioDetalleDeleteEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var usuarioDetalleVO : UsuarioDetalleVO;
		
		/**
		 * The constructor
		 */
		public function UsuarioDetalleDeleteEvent( usuarioDetalleVO : UsuarioDetalleVO ) 
		{
			super( MainControl.EVENT_USUARIODETALLEDELETE );
			this.usuarioDetalleVO = usuarioDetalleVO;
		}
	}
}