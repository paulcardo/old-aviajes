package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class ComisionesPagosDetalleVO implements ValueObject
	{
		public var expAnno : String;
		public var expNum : String;
		public var nombre : String;
		public var cuenta : String;
		public var costo : String;
		public var fechaLimite : String;
		public var concepto : String;
		// para el update
		public var comisionesPagosId : int;
		public var estado : String;
		public var observaciones : String;
	}
	
}
