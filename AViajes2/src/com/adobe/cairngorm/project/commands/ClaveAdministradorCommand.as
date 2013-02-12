package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ClaveAdministradorDelegate;
	import com.adobe.cairngorm.project.event.ClaveAdministradorEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class ClaveAdministradorCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.claveAdministrador.isPending = true;
			
			var delegate : ClaveAdministradorDelegate = new ClaveAdministradorDelegate( this );   
			var claveAdministradorEvent : ClaveAdministradorEvent = ClaveAdministradorEvent( event );
			delegate.claveAdministrador( claveAdministradorEvent.claveAdministradorVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.claveAdministrador.claveAdministradorVO.claveActual = xmlresult.row.Clave;
			model.claveAdministrador.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.claveAdministrador.isPending = false;
		}
	}
}