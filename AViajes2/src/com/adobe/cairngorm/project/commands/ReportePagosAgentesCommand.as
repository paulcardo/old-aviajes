package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.business.ReportePagosAgentesDelegate;
	import com.adobe.cairngorm.project.event.ReportePagosAgentesEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import mx.collections.XMLListCollection;
	import mx.rpc.IResponder;
	import mx.formatters.NumberFormatter;
	import mx.formatters.NumberBaseRoundType;
	
	public class ReportePagosAgentesCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.reportePagosAgentes.isPending = true;
			
			var delegate : ReportePagosAgentesDelegate = new ReportePagosAgentesDelegate( this );   
			var reportePagosAgentesEvent : ReportePagosAgentesEvent = ReportePagosAgentesEvent( event );
			delegate.reportePagosAgentes( reportePagosAgentesEvent.reportePagosAgentesVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var totalXMLListCollection : XMLListCollection = new XMLListCollection;
			var totalCosto : Number = 0;
			var totalCostoColones : Number = 0;
			var agntNombre : String;
			var numberFormatter:NumberFormatter = new NumberFormatter();
			
			numberFormatter.precision = 2;
			numberFormatter.useThousandsSeparator="true"
			numberFormatter.rounding = NumberBaseRoundType.NEAREST;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			// Eliminar el nombre dulpicado del Operador
			// Agregar Total al final de cada Operador
			for each ( var element:XML in xmlresult.elements() )
			{
				if ( agntNombre != element.AgntNombre ){
					// print total
					if ( totalCosto != 0 ){
						totalXMLListCollection.addItem( XML( '<row><ExpNum>Total</ExpNum><Costo>' + numberFormatter.format(totalCosto) + '</Costo><CostoColones>' + numberFormatter.format(totalCostoColones) + '</CostoColones></row>' ) );
					}
					// new group
					agntNombre = element.AgntNombre;
					totalCosto = 0;
					totalCostoColones = 0;
					totalXMLListCollection.addItem( XML( '<row><AgntNombre>' + agntNombre + '</AgntNombre></row>' ) );
				}
				// totals
				totalCosto += Number(element.Costo);
				totalCostoColones += Number(element.CostoColones);
				element.CostoColones = numberFormatter.format(element.CostoColones);
				element.Costo = numberFormatter.format(element.Costo);
				element.TipoCambio = numberFormatter.format(element.TipoCambio);
				element.AgntNombre = '';
				totalXMLListCollection.addItem(element);
			}
			// print last total
			if ( totalCosto != 0 ){
				totalXMLListCollection.addItem( XML( '<row><ExpNum>Total</ExpNum><Costo>' + numberFormatter.format(totalCosto) + '</Costo><CostoColones>' + numberFormatter.format(totalCostoColones) + '</CostoColones></row>' ) );
			}
			
			model.reportePagosAgentes.reportePagosAgentesVO.datagridInfo = totalXMLListCollection;
			model.reportePagosAgentes.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.reportePagosAgentes.isPending = false;
		}
	}
}