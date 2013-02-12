package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class FacturaCostoDetalleVO implements ValueObject
	{
		public var costoId : int;
		public var expAnno : String;
		public var expNum : int;
		public var facNumId : String;
		public var agntNombre : String;
		public var costo : Number = 0;
		public var chequeNum : String;

	}
	
}
