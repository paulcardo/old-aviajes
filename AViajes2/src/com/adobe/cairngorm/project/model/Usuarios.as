package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.UsuariosVO;
	
	public class Usuarios
	{
		[Bindable]
		public var usuariosVO : UsuariosVO;
		[Bindable]
		public var isPending : Boolean;
	}
}