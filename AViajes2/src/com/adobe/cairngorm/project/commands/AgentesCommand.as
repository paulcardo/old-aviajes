package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.AgentesDelegate;
	import com.adobe.cairngorm.project.event.AgentesEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class AgentesCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.agentes.isPending = true;
			
			var delegate : AgentesDelegate = new AgentesDelegate( this );   
			var agentesEvent : AgentesEvent = AgentesEvent( event );
			delegate.agentes( agentesEvent.agentesVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.agentes.agentesVO.datagridInfo.source = xmlresult.row;
			model.agentes.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.agentes.isPending = false;
		}
	}
}