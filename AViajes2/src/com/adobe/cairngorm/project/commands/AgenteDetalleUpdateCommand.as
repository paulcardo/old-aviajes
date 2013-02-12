package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.business.AgenteDetalleUpdateDelegate;
	import com.adobe.cairngorm.project.event.AgenteDetalleUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	
	import mx.rpc.IResponder;
	
	public class AgenteDetalleUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.agenteDetalleUpdate.isPending = true;
			
			var delegate : AgenteDetalleUpdateDelegate = new AgenteDetalleUpdateDelegate( this );   
			var agenteDetalleUpdateEvent : AgenteDetalleUpdateEvent = AgenteDetalleUpdateEvent( event );
			delegate.agenteDetalleUpdate( agenteDetalleUpdateEvent.agenteDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolUpdated:Boolean = false;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			for (i = 0; i < model.agentes.agentesVO.datagridInfo.length; i++) {
				if ( model.agentes.agentesVO.datagridInfo[i].AgntId == xmlresult.row.AgntId ){
					model.agentes.agentesVO.datagridInfo[i].Nombre = xmlresult.row.Nombre;
					model.agentes.agentesVO.datagridInfo[i].AgNombre = xmlresult.row.AgNombre;
					model.agentes.agentesVO.datagridInfo[i].TipoPago = xmlresult.row.TipoPago;
					model.agentes.agentesVO.datagridInfo[i].Porcentaje = xmlresult.row.Porcentaje;
					boolUpdated = true;
					break;
				} 
			}	
			if ( !boolUpdated ){
				model.agentes.agentesVO.datagridInfo.addItemAt( xmlresult.row, 0 );				
			}
			model.agenteDetalleUpdate.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.agenteDetalleUpdate.isPending = false;
		}
	}
}