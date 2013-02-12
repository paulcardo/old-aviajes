package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class AgenteDetalleVO implements ValueObject
	{
		public var agntId : int;
		public var nombre : String;
		public var agenciaNombre : String;
		public var tipoPago : String;
		public var porcentaje : Number = 0;
	}
	
}
