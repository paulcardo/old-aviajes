package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class VouchersVO implements ValueObject
	{
		public var vouId : String;
		public var expAnno : String;
		public var expNum : String;
		public var operadorNombre : String;
		public var paxNombre : String;
		public var datagridInfo : XMLListCollection = new XMLListCollection;
		public var expAnnoIndex : int;
	}
	
}
