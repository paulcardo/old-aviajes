package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.FacturaCostoDetalleVO;
	
	public class FacturaCostoDetalleDelete
	{
		[Bindable]
		public var facturaCostoDetalleVO : FacturaCostoDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}