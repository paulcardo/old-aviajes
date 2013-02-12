package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.AgentesNombreDelegate;
	import com.adobe.cairngorm.project.event.AgentesNombreEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class AgentesNombreCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.agentesNombre.isPending = true;
			
			var delegate : AgentesNombreDelegate = new AgentesNombreDelegate( this );   
			var agentesNombreEvent : AgentesNombreEvent = AgentesNombreEvent( event );
			delegate.agentesNombre( agentesNombreEvent.agentesNombreVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.agentesNombre.agentesNombreVO.datagridInfo.source = xmlresult.row;
			model.agentesNombre.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.agentesNombre.isPending = false;
		}
	}
}