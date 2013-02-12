package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.business.FacturaDetalleDelegate;
	import com.adobe.cairngorm.project.event.FacturaDetalleEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	
	import mx.rpc.IResponder;
	
	public class FacturaDetalleCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.facturaDetalle.isPending = true;
			
			var delegate : FacturaDetalleDelegate = new FacturaDetalleDelegate( this );   
			var facturaDetalleEvent : FacturaDetalleEvent = FacturaDetalleEvent( event );
			delegate.facturaDetalle( facturaDetalleEvent.facturaDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var inList :Boolean;
			var i : int;
			var xmlTemp:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			var strDate:String;
			strDate = xmlresult.row.FechaFlex; // first to string, before convert to date
			model.facturaDetalle.facturaDetalleVO.fecha = new Date( strDate );
			model.facturaDetalle.facturaDetalleVO.detalle = xmlresult.row.Descripcion;
			model.facturaDetalle.facturaDetalleVO.paxNombre = xmlresult.row.PaxNombre;
			model.facturaDetalle.facturaDetalleVO.total = xmlresult.row.Total;
			model.facturaDetalle.facturaDetalleVO.tipoCambio = xmlresult.row.TipoCambio;
			model.facturaDetalle.facturaDetalleVO.estId = xmlresult.row.EstId;
			// assign Usuario
			inList = false;
			for (i = 0; i < model.usuarios.usuariosVO.datagridInfo.length; i++) {
				if ( String(model.usuarios.usuariosVO.datagridInfo[i].Nombre) == String(xmlresult.row.UsrNombre) ){
					model.facturaDetalle.facturaDetalleVO.usrIndex = i;
					inList = true
					break;
				}
			}
			if ( !inList ){
				xmlTemp = XML('<row><Nombre>' + xmlresult.row.UsrNombre + '</Nombre></row>')
				trace(xmlTemp)
				model.usuarios.usuariosVO.datagridInfo.addItem( xmlTemp );
				model.facturaDetalle.facturaDetalleVO.usrIndex = model.usuarios.usuariosVO.datagridInfo.length - 1; 
			}
			// assign agente
			inList = false;
			for (i = 0; i < model.agentesNombre.agentesNombreVO.datagridInfo.length; i++) {
				if ( String(model.agentesNombre.agentesNombreVO.datagridInfo[i].Nombre) == String(xmlresult.row.AgntNombre) ){
					model.facturaDetalle.facturaDetalleVO.agntIndex = i;
					inList = true
					break;
				}
			}
			if ( !inList ){
				xmlTemp = XML('<row><Nombre>' + xmlresult.row.AgntNombre + '</Nombre></row>')
				trace(xmlTemp)
				model.agentesNombre.agentesNombreVO.datagridInfo.addItem( xmlTemp );
				model.facturaDetalle.facturaDetalleVO.agntIndex = model.agentesNombre.agentesNombreVO.datagridInfo.length - 1; 
			}
			// assign agencia
			inList = false;
			for (i = 0; i < model.agenciasNombre.agenciasNombreVO.datagridInfo.length; i++) {
				if ( String(model.agenciasNombre.agenciasNombreVO.datagridInfo[i].Nombre) == String(xmlresult.row.AgNombre) ){
					model.facturaDetalle.facturaDetalleVO.agIndex = i;
					inList = true
					break;
				}
			}
			if ( !inList ){
				xmlTemp = XML('<row><Nombre>' + xmlresult.row.AgNombre + '</Nombre></row>')
				trace(xmlTemp)
				model.agenciasNombre.agenciasNombreVO.datagridInfo.addItem( xmlTemp );
				model.facturaDetalle.facturaDetalleVO.agIndex = model.agenciasNombre.agenciasNombreVO.datagridInfo.length - 1; 
			}
			model.facturaDetalle.facturaDetalleVO.impreso = (xmlresult.row.Impreso == 1);
			model.facturaDetalle.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.facturaDetalle.isPending = false;
		}
	}
}