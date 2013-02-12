package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.business.ReportePagosOperadoresDelegate;
	import com.adobe.cairngorm.project.event.ReportePagosOperadoresEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import mx.collections.XMLListCollection;
	import mx.rpc.IResponder;
	import mx.formatters.NumberFormatter;
	import mx.formatters.NumberBaseRoundType;
	
	public class ReportePagosOperadoresCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.reportePagosOperadores.isPending = true;
			
			var delegate : ReportePagosOperadoresDelegate = new ReportePagosOperadoresDelegate( this );   
			var reportePagosOperadoresEvent : ReportePagosOperadoresEvent = ReportePagosOperadoresEvent( event );
			delegate.reportePagosOperadores( reportePagosOperadoresEvent.reportePagosOperadoresVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var totalXMLListCollection : XMLListCollection = new XMLListCollection;
			var totalCosto : Number = 0;
			var opNombre : String;
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
				if ( opNombre != element.OpNombre ){
					// print total
					if ( totalCosto != 0 ){
						totalXMLListCollection.addItem( XML( '<row><ExpNum>Total</ExpNum><Costo>' + numberFormatter.format(totalCosto) + '</Costo></row>' ) );
					}
					// new group
					opNombre = element.OpNombre;
					totalCosto = 0;
					totalXMLListCollection.addItem( XML( '<row><OpNombre>' + opNombre + '</OpNombre></row>' ) );
				}
				// totals
				totalCosto += Number(element.Costo);
				element.Costo = numberFormatter.format(element.Costo);
				element.OpNombre = '';
				totalXMLListCollection.addItem(element);
			}
			// print last total
			if ( totalCosto != 0 ){
				totalXMLListCollection.addItem( XML( '<row><ExpNum>Total</ExpNum><Costo>' + numberFormatter.format(totalCosto) + '</Costo></row>' ) );
			}

			model.reportePagosOperadores.reportePagosOperadoresVO.datagridInfo = totalXMLListCollection;
			model.reportePagosOperadores.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.reportePagosOperadores.isPending = false;
		}
	}
}