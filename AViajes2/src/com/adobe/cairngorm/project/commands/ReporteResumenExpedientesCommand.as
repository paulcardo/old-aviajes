package com.adobe.cairngorm.project.commands 
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.project.business.ReporteResumenExpedientesDelegate;
	import com.adobe.cairngorm.project.event.ReporteResumenExpedientesEvent;
	import com.adobe.cairngorm.project.model.ModelLocator;
	import mx.collections.XMLListCollection;
	import mx.rpc.IResponder;
	import mx.formatters.NumberFormatter;
	import mx.formatters.NumberBaseRoundType;
	
	public class ReporteResumenExpedientesCommand extends SequenceCommand implements ICommand, IResponder
	{
		private var model : ModelLocator = ModelLocator.getInstance();
		
		public override function execute( event : CairngormEvent ) : void
		{
			model.reporteResumenExpedientes.isPending = true;
			
			var delegate : ReporteResumenExpedientesDelegate = new ReporteResumenExpedientesDelegate( this );   
			var reporteResumenExpedientesEvent : ReporteResumenExpedientesEvent = ReporteResumenExpedientesEvent( event );
			delegate.reporteResumenExpedientes( reporteResumenExpedientesEvent.reporteResumenExpedientesVO );	      
		}
		
		public function result( event : Object ) : void
		{			
			var xmlresult:XML;
			var totalXMLListCollection : XMLListCollection = new XMLListCollection;
			var expAnno : int;
			var expNum : int;
			var facNumId : int;
			
			var numberFormatter:NumberFormatter = new NumberFormatter();
			
			numberFormatter.precision = 2;
			numberFormatter.useThousandsSeparator="true"
			numberFormatter.rounding = NumberBaseRoundType.NEAREST;
			
			xmlresult = XML(event.result)
			xmlresult = xmlresult.children()[0].children()[0];
			
			// Eliminar el datos duplicados del Expediente
			// y total y tipoCambio de facturas con varios costos (valores duplicados) 
			for each ( var element:XML in xmlresult.elements() )
			{
				if ( ( expAnno == element.ExpAnno ) && ( expNum == element.ExpNum ) ){
					element.ExpAnno = ''; // blanqueo
					element.ExpNum = '';
					element.AgNombre = '';
					element.PaxNombre = '';
					element.ListaVouchers = '';
					element.Utilidad = '';
					if ( facNumId == element.FacNumId ){ // blanqueo
						element.Total = '';
						element.TipoCambio = '';
					} else {
						facNumId = element.FacNumId;
					}
				} else {
					// new group
					expAnno = element.ExpAnno;
					expNum = element.ExpNum;
					facNumId = element.FacNumId;
				}
				if ( element.FacNumId == 0 ){
					element.FacNumId = '';						
				}
				// format numbers > 0
				if ( element.Costo >= 0 ){
					element.Costo = numberFormatter.format(element.Costo);
				}
				if ( element.Utilidad != '' ){
					element.Utilidad = numberFormatter.format(element.Utilidad);
				}
				if ( ( element.TipoCambio != '' ) && ( element.TipoCambio >= 0 ) ){
					element.TipoCambio = numberFormatter.format(element.TipoCambio);
				} else {
					element.TipoCambio = '';
				}
				if ( ( element.Total != '' ) && ( element.Total >= 0 ) ){
					element.Total = numberFormatter.format(element.Total);
				} else {
					element.Total = '';
				}
				totalXMLListCollection.addItem(element);
			}
			
			model.reporteResumenExpedientes.reporteResumenExpedientesVO.datagridInfo = totalXMLListCollection;
			model.reporteResumenExpedientes.isPending = false;
		}
		
		public function fault( event : Object ) : void
		{
			model.reporteResumenExpedientes.isPending = false;
		}
	}
}