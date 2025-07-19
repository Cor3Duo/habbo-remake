package com.sulake.habbo
{
	import com.sulake.core.runtime._MX;
	import com.sulake.core.runtime._v1h;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class FakeContext implements _v1h
	{
		private var _Vt:_MX;
		
		public function FakeContext(param1:Dictionary)
		{
			super();
			//§_-J2I§ = new EventDispatcherWrapper();
			//_assets = new AssetLibraryCollection("fakeAssetCollection");
			//§_-k15§ = param1;
		}
		
		public function dispose():void
		{
			//_assets.dispose();
			//_J2I = null;
			//_assets = null;
		}
		
		public function interpolate(param1:String):String
		{
			return "";
		}
		
		public function debug(param1:String):void
		{
		}
		
		public function purge():void
		{
		}
		
		public function warning(param1:String):void
		{
		}
		
		public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null):Boolean
		{
			return false;
		}
		
		public function getProperty(param1:String, param2:Dictionary = null):String
		{
			return "";
		}
		
		public function get disposed():Boolean
		{
			return false;
		}
		
		public function get configuration():_MX
		{
			return _Vt;
		}
	
	}

}