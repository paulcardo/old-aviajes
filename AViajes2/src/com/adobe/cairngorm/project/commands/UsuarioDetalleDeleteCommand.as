package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.UsuarioDetalleDeleteDelegate;
	import com.adobe.cairngorm.project.event.UsuarioDetalleDeleteEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class UsuarioDetalleDeleteCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.usuarioDetalleDelete.isPending = true;
			
			var delegate : UsuarioDetalleDeleteDelegate = new UsuarioDetalleDeleteDelegate( this );   
			var usuarioDetalleDeleteEvent : UsuarioDetalleDeleteEvent = UsuarioDetalleDeleteEvent( event );
			delegate.usuarioDetalleDelete( usuarioDetalleDeleteEvent.usuarioDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolDeleted:Boolean = false;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.usuarios.usuariosVO.datagridInfo.source = xmlresult.row;
			model.usuarioDetalleDelete.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.usuarioDetalleDelete.isPending = false;
		}
	}
}