package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class ReportePagosOperadoresVouchersVO implements ValueObject
	{
		public var expAnno : String;
		public var estadoId : int;
		public var operadorNombre : String;
		public var datagridInfo : XMLListCollection = new XMLListCollection;
	}
	
}
