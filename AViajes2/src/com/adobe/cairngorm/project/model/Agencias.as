package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.AgenciasVO;
	
	public class Agencias
	{
		[Bindable]
		public var agenciasVO : AgenciasVO;
		[Bindable]
		public var isPending : Boolean;
	}
}