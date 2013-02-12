package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ComisionesPagosDelegate;
	import com.adobe.cairngorm.project.event.ComisionesPagosEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import mx.formatters.NumberFormatter;
	import mx.formatters.NumberBaseRoundType;
	import mx.rpc.IResponder;
	
	public class ComisionesPagosCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.comisionesPagos.isPending = true;
			
			var delegate : ComisionesPagosDelegate = new ComisionesPagosDelegate( this );   
			var comisionesPagosEvent : ComisionesPagosEvent = ComisionesPagosEvent( event );
			delegate.comisionesPagos( comisionesPagosEvent.comisionesPagosVO );	      
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
				element.CostoFormated = numberFormatter.format(element.Costo);
			}
			model.comisionesPagos.comisionesPagosVO.datagridInfo.source = xmlresult.row;
			model.comisionesPagos.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.comisionesPagos.isPending = false;
		}
	}
}