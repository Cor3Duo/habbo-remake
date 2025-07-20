package com.sulake.core.assets
{
	import com.sulake.core.assets.loaders.class_36;
	import com.sulake.core.runtime.class_13;
	import com.sulake.core.runtime.events.EventDispatcherWrapper;

	public class AssetLoaderStruct extends EventDispatcherWrapper implements class_13
	{

		private var var_155:class_36;

		private var _assetName:String;

		public function AssetLoaderStruct(param1:String, param2:class_36)
		{
			super();
			_assetName = param1;
			var_155 = param2;
		}

		public function get assetName():String
		{
			return _assetName;
		}

		public function get assetLoader():class_36
		{
			return var_155;
		}

		override public function dispose():void
		{
			if (!disposed)
			{
				if (var_155 != null)
				{
					if (!var_155.disposed)
					{
						var_155.dispose();
						var_155 = null;
					}
				}
				super.dispose();
			}
		}
	}
}
