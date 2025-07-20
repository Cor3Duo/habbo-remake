package com.sulake.core.utils
{
	import com.sulake.core.runtime.class_13;
	import com.sulake.core.runtime.events.EventDispatcherWrapper;
	import flash.system.LoaderContext;
	import flash.net.URLRequest;
	import flash.display.Loader;

	/**
	 * ...
	 * @author Richard
	 */
	public class class_39 extends EventDispatcherWrapper implements class_13
	{
		protected var _N6:URLRequest;
		protected var var_16:Loader;

		public function class_39(param1:LoaderContext = null, param2:Boolean = false, param3:Boolean = false)
		{
			super();
			// if(param1 == null)
			// {
			// _context = new LoaderContext();
			// _context.applicationDomain = ApplicationDomain.currentDomain;
			// }
			// else
			// {
			// _context = param1;
			// }
			// _l1H = param2;
			// _38 = param3;
			// _status = 0;
			// _v1S = new Loader();
			// _v1S.contentLoaderInfo.addEventListener("init",loadEventHandler);
			// _v1S.contentLoaderInfo.addEventListener("complete",loadEventHandler);
			// _v1S.contentLoaderInfo.addEventListener("progress",loadEventHandler);
			// _v1S.contentLoaderInfo.addEventListener("unload",loadEventHandler);
			// _v1S.contentLoaderInfo.addEventListener("httpStatus",loadEventHandler);
			// _v1S.contentLoaderInfo.addEventListener("ioError",loadEventHandler);
			// _v1S.contentLoaderInfo.addEventListener("securityError",loadEventHandler);
		}

		public function getDefinition(param1:String):Object
		{
			if (class_973.method_20(param1))
			{
				return class_973.method_20(param1);
			}
			var _loc2_:Object = null;
			try
			{
				if (var_16.contentLoaderInfo.applicationDomain.hasDefinition(param1))
				{
					_loc2_ = var_16.contentLoaderInfo.applicationDomain.getDefinition(param1);
				}
			}
			catch (e:Error)
			{
			}
			return _loc2_;
		}

		public function hasDefinition(param1:String):Boolean
		{
			if (class_973.method_20(param1))
			{
				// class_14.log("[LibraryLoader] Definition in resources: " + param1);
				return true;
			}
			var _loc2_:Boolean = false;
			try
			{
				_loc2_ = var_16.contentLoaderInfo.applicationDomain.hasDefinition(param1);
			}
			catch (e:Error)
			{
			}
			return _loc2_;
		}

		public function get url():String
		{
			return _N6 ? _N6.url : null;
		}

	}

}