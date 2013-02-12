package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.project.business.ExpedienteDetalleDelegate;
	import com.adobe.cairngorm.project.event.ExpedienteDetalleEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import mx.formatters.NumberFormatter;
	import mx.formatters.NumberBaseRoundType;
	
	import mx.rpc.IResponder;
	
	public class ExpedienteDetalleCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.expedienteDetalle.isPending = true;
			
			var delegate : ExpedienteDetalleDelegate = new ExpedienteDetalleDelegate( this );   
			var expedienteDetalleEvent : ExpedienteDetalleEvent = ExpedienteDetalleEvent( event );
			delegate.expedienteDetalle( expedienteDetalleEvent.expedienteDetalleVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var numberFormatter:NumberFormatter = new NumberFormatter();
			numberFormatter.precision = 2;
			numberFormatter.useThousandsSeparator="true"
			numberFormatter.rounding = NumberBaseRoundType.NEAREST;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			model.expedienteDetalle.expedienteDetalleVO.paxNombre = xmlresult.row.PaxNombre;
			model.expedienteDetalle.expedienteDetalleVO.paxNum = xmlresult.row.PaxNum;
			model.expedienteDetalle.expedienteDetalleVO.excursion = xmlresult.row.Excursion;
			model.expedienteDetalle.expedienteDetalleVO.reservaNum = xmlresult.row.ReservaNum;
			model.expedienteDetalle.expedienteDetalleVO.confirmacionNum = xmlresult.row.ConfirmacionNum;
			model.expedienteDetalle.expedienteDetalleVO.agenciaNombre = xmlresult.row.agNombre;
			model.expedienteDetalle.expedienteDetalleVO.listaVouchers = xmlresult.row.ListaVouchers;
			
			model.expedienteDetalle.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.expedienteDetalle.isPending = false;
		}
	}
}