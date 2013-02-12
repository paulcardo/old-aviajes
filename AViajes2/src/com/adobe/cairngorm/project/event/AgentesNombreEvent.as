package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.AgentesNombreVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class AgentesNombreEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var agentesNombreVO : AgentesNombreVO;
		
		/**
		 * The constructor
		 */
		public function AgentesNombreEvent( agentesNombreVO : AgentesNombreVO ) 
		{
			super( MainControl.EVENT_AGENTESNOMBRE );
			this.agentesNombreVO = agentesNombreVO;
		}
	}
}