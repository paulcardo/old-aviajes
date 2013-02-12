package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ComisionesPagosDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ComisionesPagosInsertEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var comisionesPagosInsertVO : ComisionesPagosDetalleVO;
		
		/**
		 * The constructor
		 */
		public function ComisionesPagosInsertEvent( comisionesPagosInsertVO : ComisionesPagosDetalleVO ) 
		{
			super( MainControl.EVENT_COMISIONESPAGOSINSERT );
			this.comisionesPagosInsertVO = comisionesPagosInsertVO;
		}
	}
}