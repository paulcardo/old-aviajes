package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.CounterExpNumUpdateDelegate;
	import com.adobe.cairngorm.project.event.CounterExpNumUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class CounterExpNumUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.counter.isPending = true;
			
			var delegate : CounterExpNumUpdateDelegate = new CounterExpNumUpdateDelegate( this );   
			var counterExpNumUpdateEvent : CounterExpNumUpdateEvent = CounterExpNumUpdateEvent( event );
			delegate.counterExpNumUpdate( counterExpNumUpdateEvent.counterExpNumUpdateVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			//model.counter.counterVO.expNum = xmlresult.row.NextVal;
			model.counter.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.counter.isPending = false;
		}
	}
}