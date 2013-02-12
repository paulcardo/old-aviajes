package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.UsuarioDetalleVO;
	
	public class UsuarioDetalle
	{
		[Bindable]
		public var usuarioDetalleVO : UsuarioDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}