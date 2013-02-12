package com.adobe.cairngorm.project.event 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.control.MainControl;
	import com.adobe.cairngorm.project.vo.AgentesVO;
	
	/**
	 * The Cairngorm event broadcast when the user attempts event
	 */
	public class AgentesEvent extends CairngormEvent 
	{
		/**
		 * The login details for the user
		 */
		public var agentesVO : AgentesVO;
		
		/**
		 * The constructor
		 */
		public function AgentesEvent( agentesVO : AgentesVO ) 
		{
			super( MainControl.EVENT_AGENTES );
			this.agentesVO = agentesVO;
		}
	}
}