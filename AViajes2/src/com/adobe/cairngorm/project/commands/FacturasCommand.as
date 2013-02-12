package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.FacturasDelegate;
	import com.adobe.cairngorm.project.event.FacturasEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import mx.formatters.NumberFormatter;
	import mx.formatters.NumberBaseRoundType;
	import mx.rpc.IResponder;
	
	public class FacturasCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.facturas.isPending = true;
			
			var delegate : FacturasDelegate = new FacturasDelegate( this );   
			var facturasEvent : FacturasEvent = FacturasEvent( event );
			delegate.facturas( facturasEvent.facturasVO );	      
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
			
			for each ( var element:XML in xmlresult.elements() )
			{
				// Formating the elements
				element.TotalFormated = numberFormatter.format(element.Total);
			}
			model.facturas.facturasVO.datagridInfo.source = xmlresult.row;
			model.facturas.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.facturas.isPending = false;
		}
	}
}