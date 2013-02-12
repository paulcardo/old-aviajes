package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.ReporteFacturasVO;
	
	public class ReporteFacturas
	{
		[Bindable]
		public var reporteFacturasVO : ReporteFacturasVO;
		[Bindable]
		public var isPending : Boolean;
	}
}