package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ComisionesPagosInsertDelegate;
	import com.adobe.cairngorm.project.event.ComisionesPagosInsertEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class ComisionesPagosInsertCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.comisionesPagosInsert.isPending = true;
			
			var delegate : ComisionesPagosInsertDelegate = new ComisionesPagosInsertDelegate( this );   
			var comisionesPagosInsertEvent : ComisionesPagosInsertEvent = ComisionesPagosInsertEvent( event );
			delegate.comisionesPagosInsert( comisionesPagosInsertEvent.comisionesPagosInsertVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.comisionesPagos.comisionesPagosVO.datagridInfo.addItemAt( xmlresult.row, 0 );
			model.comisionesPagosInsert.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.comisionesPagosInsert.isPending = false;
		}
	}
}