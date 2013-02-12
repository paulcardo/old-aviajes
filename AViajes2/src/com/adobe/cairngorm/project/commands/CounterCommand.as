package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.CounterDelegate;
	import com.adobe.cairngorm.project.event.CounterEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class CounterCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.counter.isPending = true;
			
			var delegate : CounterDelegate = new CounterDelegate( this );   
			var counterEvent : CounterEvent = CounterEvent( event );
			delegate.counter( counterEvent.counterVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			switch ( model.counter.counterVO.SeqName ){
				case 'Expediente':
					model.expedienteDetalle.expedienteDetalleVO.expNum = xmlresult.row;
					break;
				case 'Voucher':
					model.voucherDetalle.voucherDetalleVO.vouId = xmlresult.row;
					break;
			}
			model.counter.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.counter.isPending = false;
		}
	}
}