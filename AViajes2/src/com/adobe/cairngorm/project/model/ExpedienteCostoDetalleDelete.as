package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.ExpedienteCostoDetalleVO;
	
	public class ExpedienteCostoDetalleDelete
	{
		[Bindable]
		public var expedienteCostoDetalleVO : ExpedienteCostoDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}