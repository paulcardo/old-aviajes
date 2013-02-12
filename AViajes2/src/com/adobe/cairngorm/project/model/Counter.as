package com.adobe.cairngorm.project.model
{
	import com.adobe.cairngorm.project.vo.CounterVO;
	
	public class Counter
	{
		[Bindable]
		public var counterVO : CounterVO;
		[Bindable]
		public var isPending : Boolean;
	}
}