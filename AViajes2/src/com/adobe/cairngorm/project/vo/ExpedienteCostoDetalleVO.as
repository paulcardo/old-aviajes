package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class ExpedienteCostoDetalleVO implements ValueObject
	{
		public var costoId : int;
		public var expAnno : String;
		public var expNum : int;
		public var opNombre : String;
		public var costo : Number = 0;
		public var chequeNum : String;

	}
	
}
