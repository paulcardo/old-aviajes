package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.OperadoresNombreDelegate;
	import com.adobe.cairngorm.project.event.OperadoresNombreEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class OperadoresNombreCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.operadoresNombre.isPending = true;
			
			var delegate : OperadoresNombreDelegate = new OperadoresNombreDelegate( this );   
			var operadoresNombreEvent : OperadoresNombreEvent = OperadoresNombreEvent( event );
			delegate.operadoresNombre( operadoresNombreEvent.operadoresNombreVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.operadoresNombre.operadoresNombreVO.datagridInfo.source = xmlresult.row;
			model.operadoresNombre.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.operadoresNombre.isPending = false;
		}
	}
}