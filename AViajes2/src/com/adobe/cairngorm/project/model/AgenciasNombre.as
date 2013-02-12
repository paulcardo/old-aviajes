package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.AgenciasNombreVO;
	
	public class AgenciasNombre
	{
		[Bindable]
		public var agenciasNombreVO : AgenciasNombreVO;
		[Bindable]
		public var isPending : Boolean;
	}
}