package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.AgenciaDetalleVO;
	
	public class AgenciaDetalleUpdate
	{
		[Bindable]
		public var agenciaDetalleVO : AgenciaDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}