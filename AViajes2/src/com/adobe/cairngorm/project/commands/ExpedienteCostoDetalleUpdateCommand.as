package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ExpedienteCostoDetalleUpdateDelegate;
	import com.adobe.cairngorm.project.event.ExpedienteCostoDetalleUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import mx.rpc.IResponder;
	import mx.formatters.NumberFormatter;
	import mx.formatters.NumberBaseRoundType;
	
	public class ExpedienteCostoDetalleUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.expedienteCostoDetalleUpdate.isPending = true;
			
			var delegate : ExpedienteCostoDetalleUpdateDelegate = new ExpedienteCostoDetalleUpdateDelegate( this );   
			var expedienteCostoDetalleUpdateEvent : ExpedienteCostoDetalleUpdateEvent = ExpedienteCostoDetalleUpdateEvent( event );
			delegate.expedienteCostoDetalleUpdate( expedienteCostoDetalleUpdateEvent.expedienteCostoDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolUpdated:Boolean = false;
			var i:int;
			var numberFormatter:NumberFormatter = new NumberFormatter();
			numberFormatter.precision = 2;
			numberFormatter.useThousandsSeparator="true"
			numberFormatter.rounding = NumberBaseRoundType.NEAREST;

			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.expedienteCostos.expedienteCostosVO.datagridInfo.source = xmlresult.row;
			// update costo and utilidad
			model.expedienteDetalle.expedienteDetalleVO.sumTotal = numberFormatter.format(xmlresult.summatory.sumTotal);
			model.expedienteDetalle.expedienteDetalleVO.sumCosto = numberFormatter.format(xmlresult.summatory.sumCosto);
			model.expedienteDetalle.expedienteDetalleVO.utilidad = numberFormatter.format(xmlresult.summatory.Utilidad);
			
			model.expedienteCostoDetalleUpdate.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.expedienteCostoDetalleUpdate.isPending = false;
		}
	}
}