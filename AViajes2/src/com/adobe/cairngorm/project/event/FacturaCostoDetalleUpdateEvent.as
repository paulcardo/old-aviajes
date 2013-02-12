package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.FacturaCostoDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class FacturaCostoDetalleUpdateEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var facturaCostoDetalleVO : FacturaCostoDetalleVO;
		
		/**
		 * The constructor
		 */
		public function FacturaCostoDetalleUpdateEvent( facturaCostoDetalleVO : FacturaCostoDetalleVO ) 
		{
			super( MainControl.EVENT_FACTURACOSTODETALLEUPDATE );
			this.facturaCostoDetalleVO = facturaCostoDetalleVO;
		}
	}
}