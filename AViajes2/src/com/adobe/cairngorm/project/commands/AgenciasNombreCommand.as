package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.AgenciasNombreDelegate;
	import com.adobe.cairngorm.project.event.AgenciasNombreEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class AgenciasNombreCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.agenciasNombre.isPending = true;
			
			var delegate : AgenciasNombreDelegate = new AgenciasNombreDelegate( this );   
			var agenciasNombreEvent : AgenciasNombreEvent = AgenciasNombreEvent( event );
			delegate.agenciasNombre( agenciasNombreEvent.agenciasNombreVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.agenciasNombre.agenciasNombreVO.datagridInfo.source = xmlresult.row;
			model.agenciasNombre.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.agenciasNombre.isPending = false;
		}
	}
}