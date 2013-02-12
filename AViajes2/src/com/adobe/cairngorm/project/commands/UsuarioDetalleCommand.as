package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.UsuarioDetalleDelegate;
	import com.adobe.cairngorm.project.event.UsuarioDetalleEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class UsuarioDetalleCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.usuarioDetalle.isPending = true;
			
			var delegate : UsuarioDetalleDelegate = new UsuarioDetalleDelegate( this );   
			var usuarioDetalleEvent : UsuarioDetalleEvent = UsuarioDetalleEvent( event );
			delegate.usuarioDetalle( usuarioDetalleEvent.usuarioDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.usuarioDetalle.usuarioDetalleVO.usrId = xmlresult.row.UsrId;
			model.usuarioDetalle.usuarioDetalleVO.nombre = xmlresult.row.Nombre;
			model.usuarioDetalle.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.usuarioDetalle.isPending = false;
		}
	}
}