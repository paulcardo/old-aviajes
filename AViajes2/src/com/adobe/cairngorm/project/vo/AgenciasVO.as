package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class AgenciasVO implements ValueObject
	{
		public var nombre : String;
		public var datagridInfo : XMLListCollection = new XMLListCollection;
	}
	
}
