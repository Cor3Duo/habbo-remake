package com.sulake.core.runtime
{
	import com.sulake.core.assets._v1t;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class _w1k implements IUnknown//, §_-MX§
	{
		private var _disposed:Boolean = false;
		private var _context:_RH = null;
		
		public function _w1k(param1:_RH, param2:uint = 0, param3:_v1t = null)
		{
			super();
			//§_-x1U§ = param2;
			//§_-6l§ = new InterfaceStructList();
			//§_-J2I§ = new EventDispatcherWrapper();
			_context = param1;
			//_assets = param3 ?? new AssetLibrary("_internal_asset_library");
			//if(_context == null)
			//{
			//throw new InvalidComponentException("IContext not provided to Component\'s constructor!");
			//}
			//if(dependencies.length > 0)
			//{
			//lock();
			//}
			//§_-J1q§ = new Vector.<String>(0);
			//for each(var _loc4_ in dependencies)
			//{
			//if(_loc4_.isRequired)
			//{
			//§_-J1q§.push(ClassUtils.getSimpleQualifiedClassName(_loc4_.identifier));
			//}
			//injectDependency(_loc4_.identifier,_loc4_.dependencySetter,_loc4_.isRequired,_loc4_.eventListeners);
			//}
			//allDependenciesRequested();
		}
		
		public function getProperty(param1:String, param2:Dictionary = null):String
		{
			return _context.configuration ? _context.configuration.getProperty(param1, param2) : "";
		}
		
		public function get disposed():Boolean
		{
			return _disposed;
		}
		
		public function dispose():void
		{
			if (!_disposed)
			{
				//for each(var _loc1_ in §_-71o§)
				//{
				//_loc1_();
				//}
				//§_-71o§ = null;
				//§_-J2I§.dispatchEvent(new Event("COMPONENT_EVENT_DISPOSING"));
				//§_-J2I§ = null;
				//§_-6l§.dispose();
				//§_-6l§ = null;
				//_assets.dispose();
				//_assets = null;
				//_context = null;
				//§_-Rm§ = 0;
				_disposed = true;
			}
		}
	
	}

}