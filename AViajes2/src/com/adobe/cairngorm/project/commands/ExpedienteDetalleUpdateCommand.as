package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ExpedienteDetalleUpdateDelegate;
	import com.adobe.cairngorm.project.event.ExpedienteDetalleUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class ExpedienteDetalleUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.expedienteDetalleUpdate.isPending = true;
			
			var delegate : ExpedienteDetalleUpdateDelegate = new ExpedienteDetalleUpdateDelegate( this );   
			var expedienteDetalleUpdateEvent : ExpedienteDetalleUpdateEvent = ExpedienteDetalleUpdateEvent( event );
			delegate.expedienteDetalleUpdate( expedienteDetalleUpdateEvent.expedienteDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolUpdated:Boolean = false;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			for (i = 0; i < model.expedientes.expedientesVO.datagridInfo.length; i++) {
				if ( ( model.expedientes.expedientesVO.datagridInfo[i].ExpAnno == xmlresult.row.ExpAnno )
					&& ( model.expedientes.expedientesVO.datagridInfo[i].ExpNum == xmlresult.row.ExpNum ) ){
					model.expedientes.expedientesVO.datagridInfo[i].AgNombre = xmlresult.row.AgNombre;
					model.expedientes.expedientesVO.datagridInfo[i].PaxNombre = xmlresult.row.PaxNombre;
					boolUpdated = true;
					break;
				} 
			}	
			if ( !boolUpdated ){
				model.expedientes.expedientesVO.datagridInfo.addItemAt( xmlresult.row, 0 );		
				model.expedienteDetalle.expedienteDetalleVO.expNum = xmlresult.row.ExpNum; 
			}
			model.expedienteDetalleUpdate.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.expedienteDetalleUpdate.isPending = false;
		}
	}
}