package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.business.FacturaCostoDetalleUpdateDelegate;
	import com.adobe.cairngorm.project.event.FacturaCostoDetalleUpdateEvent;
	import com.adobe.cairngorm.project.event.ExpedienteCostosEvent;
	import com.adobe.cairngorm.project.model.ExpedienteDetalle;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.project.vo.*;
	import mx.rpc.IResponder;
	
	public class FacturaCostoDetalleUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.facturaCostoDetalleUpdate.isPending = true;
			
			var delegate : FacturaCostoDetalleUpdateDelegate = new FacturaCostoDetalleUpdateDelegate( this );   
			var facturaCostoDetalleUpdateEvent : FacturaCostoDetalleUpdateEvent = FacturaCostoDetalleUpdateEvent( event );
			delegate.facturaCostoDetalleUpdate( facturaCostoDetalleUpdateEvent.facturaCostoDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolUpdated:Boolean = false;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.facturaCostos.facturaCostosVO.datagridInfo.source = xmlresult.row;
			model.facturaCostoDetalleUpdate.isPending = false;
			
			if (model.expedienteDetalle.expedienteDetalleVO != null){
				trace("f " + model.facturaCostoDetalleUpdate.facturaCostoDetalleVO.expAnno + " " + model.facturaCostoDetalleUpdate.facturaCostoDetalleVO.expNum)
				trace("e " + model.expedienteDetalle.expedienteDetalleVO.expAnno + " " + model.expedienteDetalle.expedienteDetalleVO.expNum)
				if ( (model.facturaCostoDetalleUpdate.facturaCostoDetalleVO.expAnno == model.expedienteDetalle.expedienteDetalleVO.expAnno) &&
					 (model.facturaCostoDetalleUpdate.facturaCostoDetalleVO.expNum == model.expedienteDetalle.expedienteDetalleVO.expNum) ){
					executeNextCommandGetMenu();
				}
			}
		}
	
		public function executeNextCommandGetMenu() : void
		{
			// Create the "next" event.
			// get Costos
			var expedienteCostosVO : ExpedienteCostosVO = new ExpedienteCostosVO();
			expedienteCostosVO.expAnno = model.expedienteDetalle.expedienteDetalleVO.expAnno;
			expedienteCostosVO.expNum = model.expedienteDetalle.expedienteDetalleVO.expNum;
			model.expedienteCostos.expedienteCostosVO = expedienteCostosVO;
	
			var eventTwo : ExpedienteCostosEvent = new ExpedienteCostosEvent( expedienteCostosVO );
			// Dispatch the event.
			nextEvent = eventTwo;
			super.executeNextCommand();
			// Clear the event.
			nextEvent = null;
		}
		
		public function fault( event : Object ) : void
		{
			model.facturaCostoDetalleUpdate.isPending = false;
		}
	}
}