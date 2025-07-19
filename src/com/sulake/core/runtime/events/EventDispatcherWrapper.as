package com.sulake.core.runtime.events
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import com.sulake.core.runtime._02o;
	import com.sulake.core._k3;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class EventDispatcherWrapper implements IEventDispatcher, _02o
	{
		
		private static const _Zf:uint = 0;
		
		private static const _n1D:uint = 1;
		
		private static const _Nx:uint = 2;
		
		protected var _disposed:Boolean = false;
		
		private var _qn:EventDispatcher;
		
		private var _Zz:Dictionary = new Dictionary();
		
		private var _Y1w:uint;
		
		private var _F1z:Error;
		
		public function EventDispatcherWrapper(param1:IEventDispatcher = null)
		{
			super();
			_qn = new EventDispatcher(param1 ? param1 : this);
		}
		
		public function get disposed():Boolean
		{
			return _disposed;
		}
		
		public function get error():Error
		{
			return _F1z;
		}
		
		public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false):void
		{
			var _loc8_:Array = _Zz[param1];
			var _loc6_:EventListenerStruct = new EventListenerStruct(param2, param3, param4, param5);
			if (!_loc8_)
			{
				_loc8_ = [_loc6_];
				_Zz[param1] = _loc8_;
				_qn.addEventListener(param1, eventProcessor);
			}
			else
			{
				for each (var _loc7_: EventListenerStruct in _loc8_)
				{
					if (_loc7_.callback == param2 && _loc7_.useCapture == param3)
					{
						return;
					}
					if (param4 > _loc7_.priority)
					{
						_loc8_.splice(_loc8_.indexOf(_loc7_), 0, _loc6_);
						return;
					}
				}
				_loc8_.push(_loc6_);
			}
		}
		
		public function removeEventListener(param1:String, param2:Function, param3:Boolean = false):void
		{
			var _loc5_:Array = null;
			var _loc6_:* = 0;
			if (!_disposed)
			{
				_loc5_ = _Zz[param1];
				if (_loc5_)
				{
					_loc6_ = 0;
					for each (var _loc4_: EventListenerStruct in _loc5_)
					{
						if (_loc4_.callback == param2 && _loc4_.useCapture == param3)
						{
							_loc5_.splice(_loc6_, 1);
							_loc4_.callback = null;
							if (_loc5_.length == 0)
							{
								delete _Zz[param1];
								_qn.removeEventListener(param1, eventProcessor);
							}
							return;
						}
						_loc6_++;
					}
				}
			}
		}
		
		public function dispatchEvent(param1:Event):Boolean
		{
			if (!_disposed)
			{
				_Y1w = 0;
				_qn.dispatchEvent(param1);
				if (_Y1w == 2)
				{
					if (_F1z != null)
					{
						_k3.crash("Error caught when handling " + getQualifiedClassName(param1) + ": " + _F1z.message, _F1z.errorID, _F1z);
					}
					else
					{
						_k3.crash("Error caught when handling " + getQualifiedClassName(param1) + ". No error data available!", 0, _F1z);
					}
				}
				return _Y1w == 0;
			}
			return false;
		}
		
		public function hasEventListener(param1:String):Boolean
		{
			return _disposed ? false : _Zz[param1] != null;
		}
		
		public function callEventListeners(param1:String):void
		{
			var _loc3_:Array = _Zz[param1];
			if (_loc3_)
			{
				for each (var _loc2_: EventListenerStruct in _loc3_)
				{
					_loc2_.callback(null);
				}
			}
		}
		
		public function willTrigger(param1:String):Boolean
		{
			return _disposed ? false : _Zz[param1] != null;
		}
		
		private function eventProcessor(param1:Event):void
		{
			var _loc4_:Function = null;
			var _loc5_:Array = null;
			var _loc3_:Array = _Zz[param1.type];
			if (_loc3_)
			{
				_loc5_ = [];
				for each (var _loc2_: EventListenerStruct in _loc3_)
				{
					_loc5_.push(_loc2_.callback);
				}
				while (true)
				{
					if (_loc5_.length > 0)
					{
						try
						{
							_loc4_ = _loc5_.shift();
							_loc4_(param1);
						}
						catch (e:Error)
						{
							//_Lu.log(e.getStackTrace());
							_Y1w = 2;
							_F1z = e;
							break;
						}
						continue;
						break;
					}
				}
				return;
			}
			_Y1w = param1.isDefaultPrevented() ? 1 : 0;
		}
		
		public function dispose():void
		{
			var _loc2_:Array = null;
			if (!_disposed)
			{
				for (var _loc3_: String in _Zz)
				{
					_loc2_ = _Zz[_loc3_] as Array;
					for each (var _loc1_: EventListenerStruct in _loc2_)
					{
						_loc1_.callback = null;
					}
					delete _Zz[_loc3_];
					_qn.removeEventListener(_loc3_, eventProcessor);
				}
				_Zz = null;
				_qn = null;
				_disposed = true;
			}
		}
	
	}

}