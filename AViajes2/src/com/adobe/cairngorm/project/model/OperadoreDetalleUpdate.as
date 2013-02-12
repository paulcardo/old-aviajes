package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.OperadoreDetalleVO;
	
	public class OperadoreDetalleUpdate
	{
		[Bindable]
		public var operadoreDetalleVO : OperadoreDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}