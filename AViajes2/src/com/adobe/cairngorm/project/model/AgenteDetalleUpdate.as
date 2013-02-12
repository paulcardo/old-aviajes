package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.AgenteDetalleVO;
	
	public class AgenteDetalleUpdate
	{
		[Bindable]
		public var agenteDetalleVO : AgenteDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}