package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.ExpedientesVO;
	
	public class Expedientes
	{
		[Bindable]
		public var expedientesVO : ExpedientesVO;
		[Bindable]
		public var isPending : Boolean;
	}
}