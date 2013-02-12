package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.business.UsuarioDetalleUpdateDelegate;
	import com.adobe.cairngorm.project.event.UsuarioDetalleUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	
	import mx.rpc.IResponder;
	
	public class UsuarioDetalleUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.usuarioDetalleUpdate.isPending = true;
			
			var delegate : UsuarioDetalleUpdateDelegate = new UsuarioDetalleUpdateDelegate( this );   
			var usuarioDetalleUpdateEvent : UsuarioDetalleUpdateEvent = UsuarioDetalleUpdateEvent( event );
			delegate.usuarioDetalleUpdate( usuarioDetalleUpdateEvent.usuarioDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolUpdated:Boolean = false;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			for (i = 0; i < model.usuarios.usuariosVO.datagridInfo.length; i++) {
				if ( model.usuarios.usuariosVO.datagridInfo[i].OpId == xmlresult.row.OpId ){
					model.usuarios.usuariosVO.datagridInfo[i].Nombre = xmlresult.row.Nombre;
					model.usuarios.usuariosVO.datagridInfo[i].Telefono = xmlresult.row.Telefono;
					model.usuarios.usuariosVO.datagridInfo[i].Telefono2 = xmlresult.row.Telefono2;
					model.usuarios.usuariosVO.datagridInfo[i].Fax = xmlresult.row.Fax;
					model.usuarios.usuariosVO.datagridInfo[i].Email = xmlresult.row.Email;
					boolUpdated = true;
					break;
				} 
			}	
			if ( !boolUpdated ){
				model.usuarios.usuariosVO.datagridInfo.addItemAt( xmlresult.row, 0 );				
			}
			model.usuarioDetalleUpdate.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.usuarioDetalleUpdate.isPending = false;
		}
	}
}