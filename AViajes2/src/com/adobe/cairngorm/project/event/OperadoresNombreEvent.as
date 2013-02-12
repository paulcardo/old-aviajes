package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.OperadoresNombreVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class OperadoresNombreEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var operadoresNombreVO : OperadoresNombreVO;
		
		/**
		 * The constructor
		 */
		public function OperadoresNombreEvent( operadoresNombreVO : OperadoresNombreVO ) 
		{
			super( MainControl.EVENT_OPERADORESNOMBRE );
			this.operadoresNombreVO = operadoresNombreVO;
		}
	}
}