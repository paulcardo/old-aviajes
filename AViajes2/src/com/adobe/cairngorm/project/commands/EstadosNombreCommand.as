package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.EstadosNombreDelegate;
	import com.adobe.cairngorm.project.event.EstadosNombreEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class EstadosNombreCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.estadosNombre.isPending = true;
			
			var delegate : EstadosNombreDelegate = new EstadosNombreDelegate( this );   
			var estadosNombreEvent : EstadosNombreEvent = EstadosNombreEvent( event );
			delegate.estadosNombre( estadosNombreEvent.estadosNombreVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.estadosNombre.estadosNombreVO.datagridInfo.source = xmlresult.row;
			model.estadosNombre.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.estadosNombre.isPending = false;
		}
	}
}