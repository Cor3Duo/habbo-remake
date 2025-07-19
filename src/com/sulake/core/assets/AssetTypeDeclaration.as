package com.sulake.core.assets
{
	
	/**
	 * ...
	 * @author Richard
	 */
	public class AssetTypeDeclaration
	{
		private var _Q1P:String;
		private var _62b:Class;
		private var _E2V:Class;
		private var _Iy:Array;
		
		public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class = null, ... rest)
		{
			super();
			_Q1P = param1;
			_62b = param2;
			_E2V = param3;
			if(rest == null)
			{
				_Iy = [];
			}
			else
			{
				_Iy = rest;
			}
		}
		
		public function get mimeType() : String
		{
			return _Q1P;
		}

		public function get assetClass() : Class
		{
			return _62b;
		}

		public function get loaderClass() : Class
		{
			return _E2V;
		}

		public function get fileTypes() : Array
		{
			return _Iy;
		}
	
	}

}