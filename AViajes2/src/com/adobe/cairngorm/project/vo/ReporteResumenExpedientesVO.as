package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class ReporteResumenExpedientesVO implements ValueObject
	{
		public var expAnno : String;
		public var datagridInfo : XMLListCollection = new XMLListCollection;
	}
	
}
