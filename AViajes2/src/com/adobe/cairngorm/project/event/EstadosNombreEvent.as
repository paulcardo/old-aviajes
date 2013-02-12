package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.EstadosNombreVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class EstadosNombreEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var estadosNombreVO : EstadosNombreVO;
		
		/**
		 * The constructor
		 */
		public function EstadosNombreEvent( estadosNombreVO : EstadosNombreVO ) 
		{
			super( MainControl.EVENT_ESTADOSNOMBRE );
			this.estadosNombreVO = estadosNombreVO;
		}
	}
}