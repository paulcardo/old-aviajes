package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ExpedienteFacturasDelegate;
	import com.adobe.cairngorm.project.event.ExpedienteFacturasEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class ExpedienteFacturasCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.facturas.isPending = true;
			
			var delegate : ExpedienteFacturasDelegate = new ExpedienteFacturasDelegate( this );   
			var facturasEvent : ExpedienteFacturasEvent = ExpedienteFacturasEvent( event );
			delegate.facturas( facturasEvent.facturasVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.expedienteDetalle.expedienteDetalleVO.datagridInfo.source = xmlresult.row;
			model.facturas.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.facturas.isPending = false;
		}
	}
}