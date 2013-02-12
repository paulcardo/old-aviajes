package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.business.OperadoreDetalleUpdateDelegate;
	import com.adobe.cairngorm.project.event.OperadoreDetalleUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	
	import mx.rpc.IResponder;
	
	public class OperadoreDetalleUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.operadoreDetalleUpdate.isPending = true;
			
			var delegate : OperadoreDetalleUpdateDelegate = new OperadoreDetalleUpdateDelegate( this );   
			var operadoreDetalleUpdateEvent : OperadoreDetalleUpdateEvent = OperadoreDetalleUpdateEvent( event );
			delegate.operadoreDetalleUpdate( operadoreDetalleUpdateEvent.operadoreDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolUpdated:Boolean = false;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			for (i = 0; i < model.operadores.operadoresVO.datagridInfo.length; i++) {
				if ( model.operadores.operadoresVO.datagridInfo[i].OpId == xmlresult.row.OpId ){
					model.operadores.operadoresVO.datagridInfo[i].Nombre = xmlresult.row.Nombre;
					model.operadores.operadoresVO.datagridInfo[i].Telefono = xmlresult.row.Telefono;
					model.operadores.operadoresVO.datagridInfo[i].Telefono2 = xmlresult.row.Telefono2;
					model.operadores.operadoresVO.datagridInfo[i].Fax = xmlresult.row.Fax;
					model.operadores.operadoresVO.datagridInfo[i].Email = xmlresult.row.Email;
					boolUpdated = true;
					break;
				} 
			}	
			if ( !boolUpdated ){
				model.operadores.operadoresVO.datagridInfo.addItemAt( xmlresult.row, 0 );				
			}
			model.operadoreDetalleUpdate.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.operadoreDetalleUpdate.isPending = false;
		}
	}
}