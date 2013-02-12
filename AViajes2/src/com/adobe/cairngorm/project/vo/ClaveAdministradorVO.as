package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class ClaveAdministradorVO implements ValueObject
	{
		public var claveActual : String;
		public var claveNueva : String;
		public var claveYaIngresada : Boolean = false;
	}
	
}
