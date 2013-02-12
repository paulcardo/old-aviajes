package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.VoucherDetalleVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class VoucherDetalleUpdateEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var voucherDetalleVO : VoucherDetalleVO;
		
		/**
		 * The constructor
		 */
		public function VoucherDetalleUpdateEvent( voucherDetalleVO : VoucherDetalleVO ) 
		{
			super( MainControl.EVENT_VOUCHERDETALLEUPDATE );
			this.voucherDetalleVO = voucherDetalleVO;
		}
	}
}