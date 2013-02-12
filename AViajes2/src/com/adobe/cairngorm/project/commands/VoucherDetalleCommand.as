package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.business.VoucherDetalleDelegate;
	import com.adobe.cairngorm.project.event.VoucherDetalleEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	
	import mx.rpc.IResponder;
	
	public class VoucherDetalleCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.voucherDetalle.isPending = true;
			
			var delegate : VoucherDetalleDelegate = new VoucherDetalleDelegate( this );   
			var voucherDetalleEvent : VoucherDetalleEvent = VoucherDetalleEvent( event );
			delegate.voucherDetalle( voucherDetalleEvent.voucherDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var inList :Boolean = false;
			var i : int;
			var xmlTemp:XML;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			var strDate:String;
			strDate = xmlresult.row.FechaFlex; // first to string, before convert to date
			model.voucherDetalle.voucherDetalleVO.fecha = new Date( strDate );
			model.voucherDetalle.voucherDetalleVO.agente = xmlresult.row.Agente;
			model.voucherDetalle.voucherDetalleVO.paxNombre = xmlresult.row.PaxNombre;
			model.voucherDetalle.voucherDetalleVO.paxNum = xmlresult.row.PaxNum;
			model.voucherDetalle.voucherDetalleVO.confirmacionNum = xmlresult.row.ConfirmacionNum;
			model.voucherDetalle.voucherDetalleVO.direccion = xmlresult.row.Direccion;
			model.voucherDetalle.voucherDetalleVO.servicios = xmlresult.row.Servicios;
			model.voucherDetalle.voucherDetalleVO.estId = xmlresult.row.EstId;
			// assign Usuario
			inList = false;
			for (i = 0; i < model.usuarios.usuariosVO.datagridInfo.length; i++) {
				if ( String(model.usuarios.usuariosVO.datagridInfo[i].Nombre) == String(xmlresult.row.UsrNombre) ){
					model.voucherDetalle.voucherDetalleVO.usrIndex = i;
					inList = true
					break;
				}
			}
			if ( !inList ){
				xmlTemp = XML('<row><Nombre>' + xmlresult.row.UsrNombre + '</Nombre></row>')
				trace(xmlTemp)
				model.usuarios.usuariosVO.datagridInfo.addItem( xmlTemp );
				model.voucherDetalle.voucherDetalleVO.usrIndex = model.usuarios.usuariosVO.datagridInfo.length - 1; 
			}
			// assign Operador
			inList = false;
			for (i = 0; i < model.operadoresNombre.operadoresNombreVO.datagridInfo.length; i++) {
				if ( String(model.operadoresNombre.operadoresNombreVO.datagridInfo[i].Nombre) == String(xmlresult.row.OpNombre) ){
					model.voucherDetalle.voucherDetalleVO.opIndex = i;
					inList = true
					break;
				}
			}
			if ( !inList ){
				xmlTemp = XML('<row><Nombre>' + xmlresult.row.OpNombre + '</Nombre></row>')
				trace(xmlTemp)
				model.operadoresNombre.operadoresNombreVO.datagridInfo.addItem( xmlTemp );
				model.voucherDetalle.voucherDetalleVO.opIndex = model.operadoresNombre.operadoresNombreVO.datagridInfo.length - 1; 
			}
			model.voucherDetalle.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.voucherDetalle.isPending = false;
		}
	}
}