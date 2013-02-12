package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class FacturaCostosVO implements ValueObject
	{
		public var facNumId : String;
		public var datagridInfo : XMLListCollection = new XMLListCollection;
	}
	
}
