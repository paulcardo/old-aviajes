package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.ClaveAdministradorVO;
	
	public class ClaveAdministrador
	{
		[Bindable]
		public var claveAdministradorVO : ClaveAdministradorVO;
		[Bindable]
		public var isPending : Boolean;
	}
}