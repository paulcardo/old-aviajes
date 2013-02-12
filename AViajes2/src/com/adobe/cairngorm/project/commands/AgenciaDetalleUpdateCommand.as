package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.business.AgenciaDetalleUpdateDelegate;
	import com.adobe.cairngorm.project.event.AgenciaDetalleUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	
	import mx.rpc.IResponder;
	
	public class AgenciaDetalleUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.agenciaDetalleUpdate.isPending = true;
			
			var delegate : AgenciaDetalleUpdateDelegate = new AgenciaDetalleUpdateDelegate( this );   
			var agenciaDetalleUpdateEvent : AgenciaDetalleUpdateEvent = AgenciaDetalleUpdateEvent( event );
			delegate.agenciaDetalleUpdate( agenciaDetalleUpdateEvent.agenciaDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolUpdated:Boolean = false;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			for (i = 0; i < model.agencias.agenciasVO.datagridInfo.length; i++) {
				if ( model.agencias.agenciasVO.datagridInfo[i].AgId == xmlresult.row.AgId ){
					model.agencias.agenciasVO.datagridInfo[i].Nombre = xmlresult.row.Nombre;
					model.agencias.agenciasVO.datagridInfo[i].Telefono = xmlresult.row.Telefono;
					model.agencias.agenciasVO.datagridInfo[i].Telefono2 = xmlresult.row.Telefono2;
					model.agencias.agenciasVO.datagridInfo[i].Fax = xmlresult.row.Fax;
					model.agencias.agenciasVO.datagridInfo[i].Email = xmlresult.row.Email;
					boolUpdated = true;
					break;
				} 
			}	
			if ( !boolUpdated ){
				model.agencias.agenciasVO.datagridInfo.addItemAt( xmlresult.row, 0 );				
			}
			model.agenciaDetalleUpdate.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.agenciaDetalleUpdate.isPending = false;
		}
	}
}