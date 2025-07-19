package com.sulake.core.assets
{
	import com.sulake.core.assets.loaders._g9;
	import com.sulake.core.runtime._02o;
	import com.sulake.core.runtime.events.EventDispatcherWrapper;

	/**
	 * ...
	 * @author Richard
	 */
	public class AssetLoaderStruct extends EventDispatcherWrapper implements _02o
	{
		private var _assetName:String;

		public function AssetLoaderStruct(param1:String, param2:_g9)
		{
			super();
			_assetName = param1;
			// §_-112§ = param2;
		}

		public function get assetName():String
		{
			return _assetName;
		}

	}

}