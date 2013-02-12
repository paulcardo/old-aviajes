package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class ExpedientesVO implements ValueObject
	{
		public var expAnno : String;
		public var expNum : String;
		public var paxNombre : String;
		public var agenciaNombre : String;
		public var operadorNombre : String;
		public var datagridInfo : XMLListCollection = new XMLListCollection;
	}
	
}
