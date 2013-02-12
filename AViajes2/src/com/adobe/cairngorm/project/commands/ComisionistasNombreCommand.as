package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ComisionistasNombreDelegate;
	import com.adobe.cairngorm.project.event.ComisionistasNombreEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class ComisionistasNombreCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.comisionistasNombre.isPending = true;
			
			var delegate : ComisionistasNombreDelegate = new ComisionistasNombreDelegate( this );   
			var comisionistasNombreEvent : ComisionistasNombreEvent = ComisionistasNombreEvent( event );
			delegate.comisionistasNombre( comisionistasNombreEvent.comisionistasNombreVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.comisionistasNombre.comisionistasNombreVO.datagridInfo.source = xmlresult.row;
			model.comisionistasNombre.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.comisionistasNombre.isPending = false;
		}
	}
}