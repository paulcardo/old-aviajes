package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class FacturaDetalleVO implements ValueObject
	{
		public var facNumId : String = '';
		public var expAnno : String;
		public var expNum : int;
		public var fecha : Date;
		public var fechaString : String;
		public var detalle : String;
		public var paxNombre : String;
		public var total : Number = 0;
		public var tipoCambio : Number = 0;
		public var estId : int;
		public var agNombre : String;
		public var agIndex : int = -1;
		public var agntNombre : String;
		public var agntIndex : int = -1;
		public var usrNombre : String;
		public var usrIndex : int = -1;
		public var impreso : Boolean = false;
	}
	
}
