package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class OperadoreDetalleVO implements ValueObject
	{
		public var opId : int;
		public var nombre : String;
		public var direccion : String;
		public var telefono : String;
		public var telefono2 : String;
		public var fax : String;
		public var email : String;
		public var contacto : String;
	}
	
}
