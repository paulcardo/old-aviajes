package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ReporteFacturasDelegate;
	import com.adobe.cairngorm.project.event.ReporteFacturasEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import mx.formatters.NumberFormatter;
	import mx.formatters.NumberBaseRoundType;

	import mx.rpc.IResponder;
	
	public class ReporteFacturasCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.reporteFacturas.isPending = true;
			
			var delegate : ReporteFacturasDelegate = new ReporteFacturasDelegate( this );   
			var reporteFacturasEvent : ReporteFacturasEvent = ReporteFacturasEvent( event );
			delegate.reporteFacturas( reporteFacturasEvent.reporteFacturasVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var numberFormatter:NumberFormatter = new NumberFormatter();
			var sumTotalDolar : Number = 0;
			var sumTotalColones : Number = 0;

			numberFormatter.precision = 2;
			numberFormatter.useThousandsSeparator="true"
			numberFormatter.rounding = NumberBaseRoundType.NEAREST;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			for each ( var element:XML in xmlresult.elements() )
			{
				// totals
				sumTotalDolar += Number(element.Total);
				sumTotalColones += Number(element.TotalColones);
				// Formating the elements
				element.TotalFormated = numberFormatter.format(element.Total);
				element.TotalColonesFormated = numberFormatter.format(element.TotalColones);
				element.TipoCambioFormated = numberFormatter.format(element.TipoCambio);
			}
			model.reporteFacturas.reporteFacturasVO.sumTotalDolar = numberFormatter.format(sumTotalDolar);
			model.reporteFacturas.reporteFacturasVO.sumTotalColones = numberFormatter.format(sumTotalColones);

			model.reporteFacturas.reporteFacturasVO.datagridInfo.source = xmlresult.row;
			model.reporteFacturas.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.reporteFacturas.isPending = false;
		}
	}
}