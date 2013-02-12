package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.FacturaDetalleImpresoUpdateDelegate;
	import com.adobe.cairngorm.project.event.FacturaDetalleImpresoUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class FacturaDetalleImpresoUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.facturaDetalleImpresoUpdate.isPending = true;
			
			var delegate : FacturaDetalleImpresoUpdateDelegate = new FacturaDetalleImpresoUpdateDelegate( this );   
			var facturaDetalleImpresoUpdateEvent : FacturaDetalleImpresoUpdateEvent = FacturaDetalleImpresoUpdateEvent( event );
			delegate.facturaDetalleImpresoUpdate( facturaDetalleImpresoUpdateEvent.facturaDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			model.facturaDetalleImpresoUpdate.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.facturaDetalleImpresoUpdate.isPending = false;
		}
	}
}