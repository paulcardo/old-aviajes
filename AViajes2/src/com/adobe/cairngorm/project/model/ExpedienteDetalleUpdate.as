package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.ExpedienteDetalleVO;
	
	public class ExpedienteDetalleUpdate
	{
		[Bindable]
		public var expedienteDetalleVO : ExpedienteDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}