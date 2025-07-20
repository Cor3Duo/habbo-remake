package com.sulake.habbo.utils
{
	import flash.net.SharedObject;

	/**
	 * ...
	 * @author Richard
	 */
	public class CommunicationUtils
	{

		public function CommunicationUtils()
		{
			super();
		}

		public static function readSOLString(param1:String, param2:String = null):String
		{
			var _loc3_:Object = readSOLProperty(param1, param2);
			if (!_loc3_)
			{
				return null;
			}
			return String(_loc3_);
		}

		public static function writeSOLProperty(param1:String, param2:Object):void
		{
			var _loc3_:SharedObject = null;
			try
			{
				_loc3_ = SharedObject.getLocal("fuselogin", "/");
				_loc3_.data[param1] = param2;
				_loc3_.flush();
			}
			catch (e:Error)
			{
				// class_14.log("Error writing SOL propert \'" + param1 + "\' with value \'" + param2 + "\'");
			}
		}

		public static function readSOLProperty(param1:String, param2:Object = null):Object
		{
			var _loc4_:SharedObject = null;
			var _loc3_:* = null;
			try
			{
				_loc4_ = SharedObject.getLocal("fuselogin", "/");
				_loc3_ = _loc4_.data[param1];
				if (_loc3_ == null)
				{
					_loc3_ = param2;
				}
				if (param1 == "environment" && _loc3_)
				{
					_loc3_ = _loc3_.replace("hh", "");
					_loc3_ = _loc3_.replace("br", "pt");
					_loc3_ = _loc3_.replace("us", "en");
				}
				return _loc3_;
			}
			catch (e:Error)
			{
				// §_-Lu§.log("Error reading SOL property \'" + param1 + "\'");
			}
			return param2;
		}

	}

}