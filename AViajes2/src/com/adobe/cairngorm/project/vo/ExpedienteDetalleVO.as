package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class ExpedienteDetalleVO implements ValueObject
	{
		public var expAnno : String;
		public var expNum : int;
		public var paxNombre : String;
		public var paxNum : int = 0;
		public var excursion : String;
		public var reservaNum : String;
		public var confirmacionNum : String;
		public var agenciaNombre : String;
		public var listaVouchers : String;
		public var sumTotal : String;
		public var sumCosto : String;
		public var utilidad : String;
		//lista de facturas
		public var datagridInfo : XMLListCollection = new XMLListCollection;
	}
	
}
