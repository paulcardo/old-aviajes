package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.FacturaCostoDetalleDeleteDelegate;
	import com.adobe.cairngorm.project.event.FacturaCostoDetalleDeleteEvent;
	import com.adobe.cairngorm.project.event.ExpedienteCostosEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.vo.*;
	import mx.rpc.IResponder;
	
	public class FacturaCostoDetalleDeleteCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.facturaCostoDetalleDelete.isPending = true;
			
			var delegate : FacturaCostoDetalleDeleteDelegate = new FacturaCostoDetalleDeleteDelegate( this );   
			var facturaCostoDetalleDeleteEvent : FacturaCostoDetalleDeleteEvent = FacturaCostoDetalleDeleteEvent( event );
			delegate.facturaCostoDetalleDelete( facturaCostoDetalleDeleteEvent.facturaCostoDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolDeleted:Boolean = false;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.facturaCostos.facturaCostosVO.datagridInfo.source = xmlresult.row;
			model.facturaCostoDetalleDelete.isPending = false;
			
			if (model.expedienteDetalle.expedienteDetalleVO != null){
				trace("fac: " + model.facturaCostoDetalleUpdate.facturaCostoDetalleVO.expAnno + " " + model.facturaCostoDetalleUpdate.facturaCostoDetalleVO.expNum)
				trace("exp: " + model.expedienteDetalle.expedienteDetalleVO.expAnno + " " + model.expedienteDetalle.expedienteDetalleVO.expNum)
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
			model.facturaCostoDetalleDelete.isPending = false;
		}
	}
}