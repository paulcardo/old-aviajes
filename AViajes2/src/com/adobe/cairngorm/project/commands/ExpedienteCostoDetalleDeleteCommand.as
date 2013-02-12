package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ExpedienteCostoDetalleDeleteDelegate;
	import com.adobe.cairngorm.project.event.ExpedienteCostoDetalleDeleteEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import mx.rpc.IResponder;
	import mx.formatters.NumberFormatter;
	import mx.formatters.NumberBaseRoundType;
	
	public class ExpedienteCostoDetalleDeleteCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.expedienteCostoDetalleDelete.isPending = true;
			
			var delegate : ExpedienteCostoDetalleDeleteDelegate = new ExpedienteCostoDetalleDeleteDelegate( this );   
			var expedienteCostoDetalleDeleteEvent : ExpedienteCostoDetalleDeleteEvent = ExpedienteCostoDetalleDeleteEvent( event );
			delegate.expedienteCostoDetalleDelete( expedienteCostoDetalleDeleteEvent.expedienteCostoDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolDeleted:Boolean = false;
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

			model.expedienteCostoDetalleDelete.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.expedienteCostoDetalleDelete.isPending = false;
		}
	}
}