package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class ComisionesPagosVO implements ValueObject
	{
		public var estado : String;
		public var datagridInfo : XMLListCollection = new XMLListCollection;
	}
	
}
