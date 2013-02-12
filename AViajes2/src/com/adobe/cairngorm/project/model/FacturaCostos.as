package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.FacturaCostosVO;
	
	public class FacturaCostos
	{
		[Bindable]
		public var facturaCostosVO : FacturaCostosVO;
		[Bindable]
		public var isPending : Boolean;
	}
}