package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.VoucherDetalleUpdateDelegate;
	import com.adobe.cairngorm.project.event.VoucherDetalleUpdateEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	public class VoucherDetalleUpdateCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.voucherDetalleUpdate.isPending = true;
			
			var delegate : VoucherDetalleUpdateDelegate = new VoucherDetalleUpdateDelegate( this );   
			var voucherDetalleUpdateEvent : VoucherDetalleUpdateEvent = VoucherDetalleUpdateEvent( event );
			delegate.voucherDetalleUpdate( voucherDetalleUpdateEvent.voucherDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var boolUpdated:Boolean = false;
			var i:int;
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			for (i = 0; i < model.vouchers.vouchersVO.datagridInfo.length; i++) {
				if ( model.vouchers.vouchersVO.datagridInfo[i].VouId == xmlresult.row.VouId ){
					model.vouchers.vouchersVO.datagridInfo[i].ExpAnno = xmlresult.row.ExpAnno;
					model.vouchers.vouchersVO.datagridInfo[i].ExpNum = xmlresult.row.ExpNum;
					model.vouchers.vouchersVO.datagridInfo[i].Estado = xmlresult.row.Estado;
					model.vouchers.vouchersVO.datagridInfo[i].FechaString = xmlresult.row.FechaString;
					model.vouchers.vouchersVO.datagridInfo[i].OpNombre = xmlresult.row.OpNombre;
					model.vouchers.vouchersVO.datagridInfo[i].PaxNombre = xmlresult.row.PaxNombre;
					boolUpdated = true;
					break;
				} 
			}	
			if ( !boolUpdated ){
				model.vouchers.vouchersVO.datagridInfo.addItemAt( xmlresult.row, 0 );	
				model.voucherDetalle.voucherDetalleVO.vouId = xmlresult.row.VouId;
			}
			model.voucherDetalleUpdate.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.voucherDetalleUpdate.isPending = false;
		}
	}
}