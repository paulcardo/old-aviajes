package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.OperadoreDetalleDelegate;
	import com.adobe.cairngorm.project.event.OperadoreDetalleEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class OperadoreDetalleCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.operadoreDetalle.isPending = true;
			
			var delegate : OperadoreDetalleDelegate = new OperadoreDetalleDelegate( this );   
			var operadoreDetalleEvent : OperadoreDetalleEvent = OperadoreDetalleEvent( event );
			delegate.operadoreDetalle( operadoreDetalleEvent.operadoreDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.operadoreDetalle.operadoreDetalleVO.opId = xmlresult.row.OpId;
			model.operadoreDetalle.operadoreDetalleVO.nombre = xmlresult.row.Nombre;
			model.operadoreDetalle.operadoreDetalleVO.direccion = xmlresult.row.Direccion;
			model.operadoreDetalle.operadoreDetalleVO.telefono = xmlresult.row.Telefono;
			model.operadoreDetalle.operadoreDetalleVO.telefono2 = xmlresult.row.Telefono2;
			model.operadoreDetalle.operadoreDetalleVO.fax = xmlresult.row.Fax;
			model.operadoreDetalle.operadoreDetalleVO.email = xmlresult.row.Email;
			model.operadoreDetalle.operadoreDetalleVO.contacto = xmlresult.row.Contacto;
			model.operadoreDetalle.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.operadoreDetalle.isPending = false;
		}
	}
}