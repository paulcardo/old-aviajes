package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ExpedienteCostosDelegate;
	import com.adobe.cairngorm.project.event.ExpedienteCostosEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import mx.formatters.NumberFormatter;
	import mx.formatters.NumberBaseRoundType;
	import mx.rpc.IResponder;
	
	public class ExpedienteCostosCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.expedienteCostos.isPending = true;
			
			var delegate : ExpedienteCostosDelegate = new ExpedienteCostosDelegate( this );   
			var expedienteCostosEvent : ExpedienteCostosEvent = ExpedienteCostosEvent( event );
			delegate.expedienteCostos( expedienteCostosEvent.expedienteCostosVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var numberFormatter:NumberFormatter = new NumberFormatter();
			numberFormatter.precision = 2;
			numberFormatter.useThousandsSeparator="true"
			numberFormatter.rounding = NumberBaseRoundType.NEAREST;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.expedienteCostos.expedienteCostosVO.datagridInfo.source = xmlresult.row;
			model.expedienteCostos.expedienteCostosVO.datagridFacturaCostoInfo.source = xmlresult.Costo;
			//
			model.expedienteDetalle.expedienteDetalleVO.sumTotal = numberFormatter.format(xmlresult.summatory.sumTotal);
			model.expedienteDetalle.expedienteDetalleVO.sumCosto = numberFormatter.format(xmlresult.summatory.sumCosto);
			model.expedienteDetalle.expedienteDetalleVO.utilidad = numberFormatter.format(xmlresult.summatory.Utilidad);
			model.expedienteCostos.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.expedienteCostos.isPending = false;
		}
	}
}