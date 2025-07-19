package com.sulake.habbo.utils
{
	import com.sulake.core.runtime._02o;
	import flash.utils.Dictionary;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	use namespace flash_proxy;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class _UR extends Proxy implements _02o
	{
		private var _length:uint;
		
		private var _QQ:Dictionary;
		
		private var _61K:Array;
		
		private var _81K:Array;
		
		public function _UR()
		{
			super();
			_length = 0;
			_QQ = new Dictionary();
			_61K = [];
			_81K = [];
		}
		
		public function get length():uint
		{
			return _length;
		}
		
		public function get disposed():Boolean
		{
			return _QQ == null;
		}
		
		public function dispose():void
		{
			_QQ = null;
			_length = 0;
			_61K = null;
			_81K = null;
		}
		
		public function reset():void
		{
			_QQ = new Dictionary();
			_length = 0;
			_61K = [];
			_81K = [];
		}
		
		public function unshift(param1:*, param2:*):Boolean
		{
			if (_QQ[param1] != null)
			{
				return false;
			}
			_QQ[param1] = param2;
			_61K.unshift(param2);
			_81K.unshift(param1);
			_length++;
			return true;
		}
		
		public function add(param1:*, param2:*):Boolean
		{
			if (_QQ[param1] != null)
			{
				return false;
			}
			_QQ[param1] = param2;
			_61K[_length] = param2;
			_81K[_length] = param1;
			_length++;
			return true;
		}
		
		public function remove(param1:*):*
		{
			var _loc2_:Object = _QQ[param1];
			if (_loc2_ == null)
			{
				return null;
			}
			var _loc3_:int = int(_81K.indexOf(param1));
			if (_loc3_ >= 0)
			{
				_61K.splice(_loc3_, 1);
				_81K.splice(_loc3_, 1);
				_length--;
			}
			delete _QQ[param1];
			return _loc2_;
		}
		
		public function getWithIndex(param1:int):*
		{
			if (param1 < 0 || param1 >= _length)
			{
				return null;
			}
			return _61K[param1];
		}
		
		public function getKey(param1:int):*
		{
			if (param1 < 0 || param1 >= _length)
			{
				return null;
			}
			return _81K[param1];
		}
		
		public function getKeys():Array
		{
			return _81K.slice();
		}
		
		public function hasKey(param1:*):Boolean
		{
			return _81K.indexOf(param1) > -1;
		}
		
		public function getValue(param1:*):*
		{
			return _QQ[param1];
		}
		
		public function getValues():Array
		{
			return _61K.slice();
		}
		
		public function hasValue(param1:*):Boolean
		{
			return _61K.indexOf(param1) > -1;
		}
		
		public function indexOf(param1:*):int
		{
			return _61K.indexOf(param1);
		}
		
		public function concatenate(param1:_UR):void
		{
			var _loc3_:* = undefined;
			var _loc2_:Array = param1._81K;
			for each (_loc3_ in _loc2_)
			{
				add(_loc3_, param1[_loc3_]);
			}
		}
		
		public function clone():_UR
		{
			var _loc1_:_UR = new _UR();
			_loc1_.concatenate(this);
			return _loc1_;
		}
		
		override flash_proxy function getProperty(param1:*):*
		{
			if (param1 is QName)
			{
				param1 = QName(param1).localName;
			}
			return _QQ[param1];
		}
		
		override flash_proxy function setProperty(param1:*, param2:*):void
		{
			if (param1 is QName)
			{
				param1 = QName(param1).localName;
			}
			_QQ[param1] = param2;
			var _loc3_:int = int(_81K.indexOf(param1));
			if (_loc3_ == -1)
			{
				_61K[_length] = param2;
				_81K[_length] = param1;
				_length++;
			}
			else
			{
				_61K.splice(_loc3_, 1, param2);
			}
		}
		
		override flash_proxy function nextNameIndex(param1:int):int
		{
			return param1 < _length ? param1 + 1 : 0;
		}
		
		override flash_proxy function nextName(param1:int):String
		{
			return _81K[param1 - 1];
		}
		
		override flash_proxy function nextValue(param1:int):*
		{
			return _61K[param1 - 1];
		}
		
		override flash_proxy function callProperty(param1:*, ... rest):*
		{
			return param1.localName == "toString" ? "Map" : null;
		}
	
	}

}