package com.sulake.core.localization
{
	import flash.utils.Dictionary;

	/**
	 * ...
	 * @author Richard
	 */
	public class Localization implements ILocalization
	{
		private var _key:String;
		private var _value:String;
		private var _2b:_Uf;
		private var _listeners:Array;
		private var _parameters:Dictionary;

		public function Localization(param1:_Uf, param2:String, param3:String = null)
		{
			super();
			_2b = param1;
			_key = param2;
			_value = param3;
		}

		public function setValue(param1:String):void
		{
			_value = param1;
			updateListeners();
		}

		public function registerParameter(param1:String, param2:String, param3:String = "%"):void
		{
			if (!_parameters)
			{
				_parameters = new Dictionary();
			}
			_parameters[param1] = {
					"id": param3,
					"value": param2
				};
			updateListeners();
		}

		public function updateListeners():void
		{
			var _loc1_:String = _2b.interpolate(value);
			if (_listeners)
			{
				for each (var _loc2_: ILocalizable in _listeners)
				{
					_loc2_.localization = _loc1_;
				}
			}
		}

		public function registerListener(param1:ILocalizable):void
		{
			if (!_listeners)
			{
				_listeners = [];
			}
			if (_listeners.indexOf(param1) == -1)
			{
				_listeners.push(param1);
			}
			param1.localization = _2b.interpolate(value);
		}

		public function removeListener(param1:ILocalizable):void
		{
			var _loc2_:int = 0;
			if (_listeners)
			{
				_loc2_ = int(_listeners.indexOf(param1));
				if (_loc2_ >= 0)
				{
					_listeners.splice(_loc2_, 1);
				}
			}
		}

		private function fillParameterValues():String
		{
			var _loc12_:Object = null;
			var _loc15_:String = null;
			var _loc7_:String = null;
			var _loc13_:RegExp = null;
			var _loc1_:int = 0;
			var _loc4_:RegExp = null;
			var _loc8_:RegExp = null;
			var _loc6_:int = 0;
			var _loc3_:String = null;
			var _loc11_:String = null;
			var _loc10_:String = null;
			var _loc9_:String = _value;
			if (_loc9_ == null)
			{
				return null;
			}
			if (_parameters)
			{
				for (var _loc14_:* in _parameters)
				{
					_loc12_ = _parameters[_loc14_];
					_loc15_ = _loc12_.id + _loc14_ + _loc12_.id;
					_loc7_ = _loc12_.value;
					_loc13_ = new RegExp(_loc15_, "gim");
					_loc9_ = _loc9_.replace(_loc13_, _loc7_);
					if (_loc9_.toLowerCase().indexOf(_loc12_.id + "{" + _loc14_) >= 0)
					{
						switch (int(_loc7_))
						{
							case 0:
								_loc1_ = 1;
								break;
							case 1:
								_loc1_ = 2;
								break;
							default:
								_loc1_ = 3;
						}
						_loc4_ = new RegExp(_loc12_.id + "\\{" + _loc14_ + "\\|([^|]*)\\|([^|]*)\\|([^}]*)\\}", "gim");
						_loc8_ = new RegExp(_loc12_.id + _loc12_.id, "gim");
						_loc9_ = _loc9_.replace(_loc4_, "$" + _loc1_);
						_loc9_ = _loc9_.replace(_loc8_, _loc7_);
					}
				}
			}
			var _loc2_:RegExp = /%%%([A-Za-z0-9_])+%%%/g;
			var _loc5_:Array = _loc9_.match(_loc2_);
			if (_loc5_ != null)
			{
				_loc6_ = _loc5_.length - 1;
				while (_loc6_ >= 0)
				{
					_loc3_ = _loc5_[_loc6_].substring(3, _loc5_[_loc6_].length - 3);
					_loc11_ = _key + "." + _loc3_;
					_loc10_ = _2b.getLocalization(_loc11_, _loc3_);
					_loc9_ = _loc9_.replace(_loc5_[_loc6_], _loc10_);
					_loc6_--;
				}
			}
			return _loc9_;
		}

		public function get value():String
		{
			return fillParameterValues();
		}

	}

}