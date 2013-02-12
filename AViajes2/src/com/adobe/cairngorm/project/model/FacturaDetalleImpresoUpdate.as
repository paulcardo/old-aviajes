package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.FacturaDetalleVO;
	
	public class FacturaDetalleImpresoUpdate
	{
		[Bindable]
		public var facturaDetalleVO : FacturaDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}