package com.sulake.core.localization
{
	
	/**
	 * ...
	 * @author Richard
	 */
	public class _t1N implements _62T
	{
		private var _jv:String;
		private var _Q1b:String;
		private var _OP:String;
		private var _3y:String;
		
		private var _externalTextsHash:String;
		private var _externalVariablesHash:String;
		private var _furniDataHash:String;
		private var _productDataHash:String;
		
		public function _t1N()
		{
			super();
		}
		
		public static function parse(param1:String):_t1N
		{
			var _loc2_:Object = JSON.parse(param1);
			var _loc4_:_t1N = new _t1N();
			for each (var _loc3_:* in _loc2_.hashes)
			{
				if (_loc3_.name == "external_texts")
				{
					_loc4_._jv = _loc3_.url;
					_loc4_._externalTextsHash = _loc3_.hash;
				}
				else if (_loc3_.name == "external_variables")
				{
					_loc4_._Q1b = _loc3_.url;
					_loc4_._externalVariablesHash = _loc3_.hash;
				}
				else if (_loc3_.name == "furnidata")
				{
					_loc4_._OP = _loc3_.url;
					_loc4_._furniDataHash = _loc3_.hash;
				}
				else if (_loc3_.name == "productdata")
				{
					_loc4_._3y = _loc3_.url;
					_loc4_._productDataHash = _loc3_.hash;
				}
			}
			return _loc4_;
		}
		
		public function isValid():Boolean
		{
			return _jv && _externalTextsHash && _Q1b && _externalVariablesHash && _OP && _furniDataHash && _3y && _productDataHash;
		}
		
		public function getExternalTextsUrl():String
		{
			return _jv;
		}
		
		public function getExternalTextsHash():String
		{
			return _externalTextsHash;
		}
	
	}

}