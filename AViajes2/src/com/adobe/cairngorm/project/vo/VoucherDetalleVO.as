package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class VoucherDetalleVO implements ValueObject
	{
		public var vouId : String = '';
		public var expAnno : String;
		public var expNum : int;
		public var fecha : Date;
		public var fechaString : String;
		public var agente : String;
		public var direccion : String;
		public var paxNombre : String;
		public var paxNum : int = 0;
		public var confirmacionNum : String;
		public var servicios : String;
		public var estId : int = 1;
		public var opNombre : String;
		public var opIndex : int = -1;
		public var usrNombre : String;
		public var usrIndex : int = -1;
	}
	
}
