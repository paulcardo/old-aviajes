package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.OperadoresDelegate;
	import com.adobe.cairngorm.project.event.OperadoresEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class OperadoresCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.operadores.isPending = true;
			
			var delegate : OperadoresDelegate = new OperadoresDelegate( this );   
			var operadoresEvent : OperadoresEvent = OperadoresEvent( event );
			delegate.operadores( operadoresEvent.operadoresVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.operadores.operadoresVO.datagridInfo.source = xmlresult.row;
			model.operadores.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.operadores.isPending = false;
		}
	}
}