package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.UsuariosDelegate;
	import com.adobe.cairngorm.project.event.UsuariosEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class UsuariosCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.usuarios.isPending = true;
			
			var delegate : UsuariosDelegate = new UsuariosDelegate( this );   
			var usuariosEvent : UsuariosEvent = UsuariosEvent( event );
			delegate.usuarios( usuariosEvent.usuariosVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.usuarios.usuariosVO.datagridInfo.source = xmlresult.row;
			model.usuarios.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.usuarios.isPending = false;
		}
	}
}