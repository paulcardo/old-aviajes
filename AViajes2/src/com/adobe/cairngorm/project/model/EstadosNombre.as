package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.EstadosNombreVO;
	
	public class EstadosNombre
	{
		[Bindable]
		public var estadosNombreVO : EstadosNombreVO;
		[Bindable]
		public var isPending : Boolean;
	}
}