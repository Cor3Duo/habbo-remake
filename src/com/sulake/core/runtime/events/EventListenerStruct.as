package com.sulake.core.runtime.events
{
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class EventListenerStruct
	{
		
		private var _QQ:Dictionary;
		
		public var useCapture:Boolean;
		
		public var priority:int;
		
		public var useWeakReference:Boolean;
		
		public function EventListenerStruct(param1:Function, param2:Boolean = false, param3:int = 0, param4:Boolean = false)
		{
			super();
			_QQ = new Dictionary(param4);
			this.callback = param1;
			this.useCapture = param2;
			this.priority = param3;
			this.useWeakReference = param4;
		}
		
		public function set callback(param1:Function):void
		{
			for (var _loc2_: * in _QQ)
			{
				delete _QQ[_loc2_ as Function];
			}
			_QQ[param1] = null;
		}
		
		public function get callback():Function
		{
			var _loc3_:int = 0;
			var _loc2_:Dictionary = _QQ;
			for (var _loc1_: * in _loc2_)
			{
				return _loc1_ as Function;
			}
			return null;
		}
	
	}

}