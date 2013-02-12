package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.VoucherDetalleVO;
	
	public class VoucherDetalleUpdate
	{
		[Bindable]
		public var voucherDetalleVO : VoucherDetalleVO;
		[Bindable]
		public var isPending : Boolean;
	}
}