package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.AgenteDetalleDelegate;
	import com.adobe.cairngorm.project.event.AgenteDetalleEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class AgenteDetalleCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.agenteDetalle.isPending = true;
			
			var delegate : AgenteDetalleDelegate = new AgenteDetalleDelegate( this );   
			var agenteDetalleEvent : AgenteDetalleEvent = AgenteDetalleEvent( event );
			delegate.agenteDetalle( agenteDetalleEvent.agenteDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.agenteDetalle.agenteDetalleVO.agntId = xmlresult.row.AgntId;
			model.agenteDetalle.agenteDetalleVO.nombre = xmlresult.row.Nombre;
			model.agenteDetalle.agenteDetalleVO.agenciaNombre = xmlresult.row.AgNombre;
			model.agenteDetalle.agenteDetalleVO.tipoPago = xmlresult.row.TipoPago;
			model.agenteDetalle.agenteDetalleVO.porcentaje = xmlresult.row.Porcentaje;
			model.agenteDetalle.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.agenteDetalle.isPending = false;
		}
	}
}