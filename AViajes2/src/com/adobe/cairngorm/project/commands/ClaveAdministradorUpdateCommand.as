package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ClaveAdministradorUpdateDelegate;
	import com.adobe.cairngorm.project.event.ClaveAdministradorUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import mx.rpc.IResponder;
	import mx.controls.Alert;
	
	public class ClaveAdministradorUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.counter.isPending = true;
			
			var delegate : ClaveAdministradorUpdateDelegate = new ClaveAdministradorUpdateDelegate( this );   
			var claveAdministradorUpdateEvent : ClaveAdministradorUpdateEvent = ClaveAdministradorUpdateEvent( event );
			delegate.claveAdministradorUpdate( claveAdministradorUpdateEvent.claveAdministradorUpdateVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			if ( xmlresult.row.Clave.toString() == xmlresult.row.ClaveEnviada.toString() ){
				Alert.show("Clave actualizada", "Información", Alert.OK);
			} else {
				Alert.show("La Clave Actual es incorrecta, no se actualizó la Clave", "Alerta", Alert.OK);
			}
			// update clave en momeria
			model.claveAdministrador.claveAdministradorVO.claveActual = xmlresult.row.Clave;
			model.counter.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.counter.isPending = false;
		}
	}
}