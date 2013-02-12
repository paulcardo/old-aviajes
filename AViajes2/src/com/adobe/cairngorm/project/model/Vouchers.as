package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.VouchersVO;
	
	public class Vouchers
	{
		[Bindable]
		public var vouchersVO : VouchersVO;
		[Bindable]
		public var isPending : Boolean;
	}
}