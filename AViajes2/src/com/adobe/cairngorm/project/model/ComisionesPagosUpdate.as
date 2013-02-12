package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.ComisionesPagosDetalleVO;
	
	public class ComisionesPagosUpdate
	{
		[Bindable]
		public var comisionesPagosUpdateVO : ComisionesPagosDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}