package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.FacturaCostosDelegate;
	import com.adobe.cairngorm.project.event.FacturaCostosEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class FacturaCostosCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.facturaCostos.isPending = true;
			
			var delegate : FacturaCostosDelegate = new FacturaCostosDelegate( this );   
			var facturaCostosEvent : FacturaCostosEvent = FacturaCostosEvent( event );
			delegate.facturaCostos( facturaCostosEvent.facturaCostosVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.facturaCostos.facturaCostosVO.datagridInfo.source = xmlresult.row;
			model.facturaCostos.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.facturaCostos.isPending = false;
		}
	}
}