package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.AgenciaDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class AgenciaDetalleEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var agenciaDetalleVO : AgenciaDetalleVO;
		
		/**
		 * The constructor
		 */
		public function AgenciaDetalleEvent( agenciaDetalleVO : AgenciaDetalleVO ) 
		{
			super( MainControl.EVENT_AGENCIADETALLE );
			this.agenciaDetalleVO = agenciaDetalleVO;
		}
	}
}