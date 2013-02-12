package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class CounterVO implements ValueObject
	{
		public var SeqName : String;
		//public var counter : String; no usado, se asigna directo a las otras variables
		public var expNum : int;
	}
	
}
