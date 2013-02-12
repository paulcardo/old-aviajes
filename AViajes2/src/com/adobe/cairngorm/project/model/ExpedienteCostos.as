package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.ExpedienteCostosVO;
	
	public class ExpedienteCostos
	{
		[Bindable]
		public var expedienteCostosVO : ExpedienteCostosVO;
		[Bindable]
		public var isPending : Boolean;
	}
}