package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.FacturasVO;
	
	public class Facturas
	{
		[Bindable]
		public var facturasVO : FacturasVO;
		[Bindable]
		public var isPending : Boolean;
		[Bindable]
		public var esNuevo : Boolean = false;
	}
}