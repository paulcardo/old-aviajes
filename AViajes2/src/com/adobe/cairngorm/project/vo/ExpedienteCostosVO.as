package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class ExpedienteCostosVO implements ValueObject
	{
		public var expAnno : String;
		public var expNum : int;
		public var datagridInfo : XMLListCollection = new XMLListCollection;
		public var datagridFacturaCostoInfo : XMLListCollection = new XMLListCollection;
	}
	
}
