package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.FacturaDetalleUpdateDelegate;
	import com.adobe.cairngorm.project.event.FacturaDetalleUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class FacturaDetalleUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.facturaDetalleUpdate.isPending = true;
			
			var delegate : FacturaDetalleUpdateDelegate = new FacturaDetalleUpdateDelegate( this );   
			var facturaDetalleUpdateEvent : FacturaDetalleUpdateEvent = FacturaDetalleUpdateEvent( event );
			delegate.facturaDetalleUpdate( facturaDetalleUpdateEvent.facturaDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolUpdated:Boolean = false;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			for (i = 0; i < model.facturas.facturasVO.datagridInfo.length; i++) {
				if ( model.facturas.facturasVO.datagridInfo[i].FacNumId == xmlresult.row.FacNumId ){
					model.facturas.facturasVO.datagridInfo[i].ExpAnno = xmlresult.row.ExpAnno;
					model.facturas.facturasVO.datagridInfo[i].ExpNum = xmlresult.row.ExpNum;
					model.facturas.facturasVO.datagridInfo[i].Estado = xmlresult.row.Estado;
					model.facturas.facturasVO.datagridInfo[i].FechaString = xmlresult.row.FechaString;
					model.facturas.facturasVO.datagridInfo[i].PaxNombre = xmlresult.row.PaxNombre;
					model.facturas.facturasVO.datagridInfo[i].AgNombre = xmlresult.row.AgNombre;
					model.facturas.facturasVO.datagridInfo[i].Total = xmlresult.row.Total;
					boolUpdated = true;
					break;
				} 
			}	
			if ( !boolUpdated ){
				model.facturas.facturasVO.datagridInfo.addItemAt( xmlresult.row, 0 );
				model.facturaDetalle.facturaDetalleVO.facNumId = xmlresult.row.FacNumId;
			}
			model.facturaDetalleUpdate.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.facturaDetalleUpdate.isPending = false;
		}
	}
}