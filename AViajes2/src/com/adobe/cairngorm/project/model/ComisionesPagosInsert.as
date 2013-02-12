package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.ComisionesPagosDetalleVO;
	
	public class ComisionesPagosInsert
	{
		[Bindable]
		public var comisionesPagosInsertVO : ComisionesPagosDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}