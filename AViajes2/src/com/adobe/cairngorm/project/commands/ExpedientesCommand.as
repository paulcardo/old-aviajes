package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ExpedientesDelegate;
	import com.adobe.cairngorm.project.event.ExpedientesEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class ExpedientesCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.expedientes.isPending = true;
			
			var delegate : ExpedientesDelegate = new ExpedientesDelegate( this );   
			var expedientesEvent : ExpedientesEvent = ExpedientesEvent( event );
			delegate.expedientes( expedientesEvent.expedientesVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.expedientes.expedientesVO.datagridInfo.source = xmlresult.row;
			model.expedientes.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.expedientes.isPending = false;
		}
	}
}