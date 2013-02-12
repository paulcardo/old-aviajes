package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.CounterExpNumDelegate;
	import com.adobe.cairngorm.project.event.CounterExpNumEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class CounterExpNumCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.counter.isPending = true;
			
			var delegate : CounterExpNumDelegate = new CounterExpNumDelegate( this );   
			var counterExpNumEvent : CounterExpNumEvent = CounterExpNumEvent( event );
			delegate.counterExpNum( counterExpNumEvent.counterExpNumVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.counter.counterVO.expNum = xmlresult.row.NextVal;
			model.counter.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.counter.isPending = false;
		}
	}
}