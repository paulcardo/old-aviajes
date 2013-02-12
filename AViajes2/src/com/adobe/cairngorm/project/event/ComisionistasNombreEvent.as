package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.ComisionistasNombreVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class ComisionistasNombreEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var comisionistasNombreVO : ComisionistasNombreVO;
		
		/**
		 * The constructor
		 */
		public function ComisionistasNombreEvent( comisionistasNombreVO : ComisionistasNombreVO ) 
		{
			super( MainControl.EVENT_COMISIONISTASNOMBRE );
			this.comisionistasNombreVO = comisionistasNombreVO;
		}
	}
}