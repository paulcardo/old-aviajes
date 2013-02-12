package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.AgenciasDelegate;
	import com.adobe.cairngorm.project.event.AgenciasEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class AgenciasCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.agencias.isPending = true;
			
			var delegate : AgenciasDelegate = new AgenciasDelegate( this );   
			var agenciasEvent : AgenciasEvent = AgenciasEvent( event );
			delegate.agencias( agenciasEvent.agenciasVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.agencias.agenciasVO.datagridInfo.source = xmlresult.row;
			model.agencias.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.agencias.isPending = false;
		}
	}
}