package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.ComisionesPagosVO;
	
	public class ComisionesPagos
	{
		[Bindable]
		public var comisionesPagosVO : ComisionesPagosVO;
		[Bindable]
		public var isPending : Boolean;
	}
}