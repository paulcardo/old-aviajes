package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.AgenciasNombreVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class AgenciasNombreEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var agenciasNombreVO : AgenciasNombreVO;
		
		/**
		 * The constructor
		 */
		public function AgenciasNombreEvent( agenciasNombreVO : AgenciasNombreVO ) 
		{
			super( MainControl.EVENT_AGENCIASNOMBRE );
			this.agenciasNombreVO = agenciasNombreVO;
		}
	}
}