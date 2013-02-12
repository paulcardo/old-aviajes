package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.VouchersDelegate;
	import com.adobe.cairngorm.project.event.VouchersEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class VouchersCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.vouchers.isPending = true;
			
			var delegate : VouchersDelegate = new VouchersDelegate( this );   
			var vouchersEvent : VouchersEvent = VouchersEvent( event );
			delegate.vouchers( vouchersEvent.vouchersVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.vouchers.vouchersVO.datagridInfo.source = xmlresult.row;
			model.vouchers.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.vouchers.isPending = false;
		}
	}
}