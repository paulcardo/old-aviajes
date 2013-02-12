package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.OperadoreDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class OperadoreDetalleEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var operadoreDetalleVO : OperadoreDetalleVO;
		
		/**
		 * The constructor
		 */
		public function OperadoreDetalleEvent( operadoreDetalleVO : OperadoreDetalleVO ) 
		{
			super( MainControl.EVENT_OPERADOREDETALLE );
			this.operadoreDetalleVO = operadoreDetalleVO;
		}
	}
}