package com.adobe.cairngorm.project.vo
{
	import com.adobe.cairngorm.vo.ValueObject;
	
	import mx.collections.XMLListCollection;
	
	[Bindable]
	public class UsuarioDetalleVO implements ValueObject
	{
		public var usrId : int;
		public var nombre : String;
	}
	
}
