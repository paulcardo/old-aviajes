package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class ReporteFacturasVO implements ValueObject
	{
		public var expAnno : String;
		public var estadoId : int;
		public var agenciaNombre : String;
		public var porFecha : Boolean;
		public var fechaDesde : String;
		public var fechaHasta : String;
		public var datagridInfo : XMLListCollection = new XMLListCollection;
		public var sumTotalDolar : String;
		public var sumTotalColones : String;
		
	}
	
}
