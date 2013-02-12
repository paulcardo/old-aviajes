package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ComisionesPagosUpdateDelegate;
	import com.adobe.cairngorm.project.event.ComisionesPagosUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class ComisionesPagosUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.comisionesPagosUpdate.isPending = true;
			
			var delegate : ComisionesPagosUpdateDelegate = new ComisionesPagosUpdateDelegate( this );   
			var comisionesPagosUpdateEvent : ComisionesPagosUpdateEvent = ComisionesPagosUpdateEvent( event );
			delegate.comisionesPagosUpdate( comisionesPagosUpdateEvent.comisionesPagosUpdateVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			for (i = 0; i < model.comisionesPagos.comisionesPagosVO.datagridInfo.length; i++) {
				if ( model.comisionesPagos.comisionesPagosVO.datagridInfo[i].ComisionesPagosId == xmlresult.row.ComisionesPagosId ){
					model.comisionesPagos.comisionesPagosVO.datagridInfo[i].Estado = xmlresult.row.Estado;
					model.comisionesPagos.comisionesPagosVO.datagridInfo[i].Observaciones = xmlresult.row.Observaciones;
					break;
				} 
			}	
			
			model.comisionesPagosUpdate.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.comisionesPagosUpdate.isPending = false;
		}
	}
}