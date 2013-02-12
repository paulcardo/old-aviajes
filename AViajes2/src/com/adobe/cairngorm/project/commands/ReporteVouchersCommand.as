package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ReporteVouchersDelegate;
	import com.adobe.cairngorm.project.event.ReporteVouchersEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class ReporteVouchersCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.reporteVouchers.isPending = true;
			
			var delegate : ReporteVouchersDelegate = new ReporteVouchersDelegate( this );   
			var reporteVouchersEvent : ReporteVouchersEvent = ReporteVouchersEvent( event );
			delegate.reporteVouchers( reporteVouchersEvent.reporteVouchersVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.reporteVouchers.reporteVouchersVO.datagridInfo.source = xmlresult.row;
			model.reporteVouchers.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.reporteVouchers.isPending = false;
		}
	}
}