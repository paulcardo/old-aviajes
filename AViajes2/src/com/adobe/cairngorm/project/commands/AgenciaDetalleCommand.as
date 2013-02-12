package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.AgenciaDetalleDelegate;
	import com.adobe.cairngorm.project.event.AgenciaDetalleEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class AgenciaDetalleCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.agenciaDetalle.isPending = true;
			
			var delegate : AgenciaDetalleDelegate = new AgenciaDetalleDelegate( this );   
			var agenciaDetalleEvent : AgenciaDetalleEvent = AgenciaDetalleEvent( event );
			delegate.agenciaDetalle( agenciaDetalleEvent.agenciaDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.agenciaDetalle.agenciaDetalleVO.agId = xmlresult.row.AgId;
			model.agenciaDetalle.agenciaDetalleVO.nombre = xmlresult.row.Nombre;
			model.agenciaDetalle.agenciaDetalleVO.direccion = xmlresult.row.Direccion;
			model.agenciaDetalle.agenciaDetalleVO.telefono = xmlresult.row.Telefono;
			model.agenciaDetalle.agenciaDetalleVO.telefono2 = xmlresult.row.Telefono2;
			model.agenciaDetalle.agenciaDetalleVO.fax = xmlresult.row.Fax;
			model.agenciaDetalle.agenciaDetalleVO.email = xmlresult.row.Email;
			model.agenciaDetalle.agenciaDetalleVO.contacto = xmlresult.row.Contacto;
			model.agenciaDetalle.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.agenciaDetalle.isPending = false;
		}
	}
}