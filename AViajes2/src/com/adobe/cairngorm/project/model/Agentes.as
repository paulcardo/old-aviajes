package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.AgentesVO;
	
	public class Agentes
	{
		[Bindable]
		public var agentesVO : AgentesVO;
		[Bindable]
		public var isPending : Boolean;
	}
}