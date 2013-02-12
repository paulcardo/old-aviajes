package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.FacturaCostoDetalleVO;
	
	public class FacturaCostoDetalleUpdate
	{
		[Bindable]
		public var facturaCostoDetalleVO : FacturaCostoDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}