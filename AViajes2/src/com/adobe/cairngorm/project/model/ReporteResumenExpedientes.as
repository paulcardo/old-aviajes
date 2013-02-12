package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.ReporteResumenExpedientesVO;
	
	public class ReporteResumenExpedientes
	{
		[Bindable]
		public var reporteResumenExpedientesVO : ReporteResumenExpedientesVO;
		[Bindable]
		public var isPending : Boolean;
	}
}