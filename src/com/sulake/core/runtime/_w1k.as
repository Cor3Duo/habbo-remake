package com.sulake.core.runtime
{
	import com.sulake.core.assets._v1t;
	import com.sulake.core.runtime.events.EventDispatcherWrapper;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	import com.sulake.habbo.utils.ClassUtils;
	import com.sulake.core.runtime.exceptions.ComponentDisposedException;

	/**
	 * ...
	 * @author Richard
	 */
	public class _w1k implements IUnknown, _MX
	{
		private var _disposed:Boolean = false;
		private var _context:_RH = null;
		private var _J2I:EventDispatcherWrapper;
		private var _assets:_v1t;
		private var _K2A:int = 1;
		private var _J1q:Vector.<String>;
		private var _6l:InterfaceStructList;
		private var _Io:Boolean = false;
		private var _71o:Vector.<Function> = new Vector.<Function>(0);
		protected var _lastError:String = "";
		private var _x1U:uint;

		public function _w1k(param1:_RH, param2:uint = 0, param3:_v1t = null)
		{
			super();
			_x1U = param2;
			// §_-6l§ = new InterfaceStructList();
			_J2I = new EventDispatcherWrapper();
			_context = param1;
			// _assets = param3 ?? new AssetLibrary("_internal_asset_library");
			// if(_context == null)
			// {
			// throw new InvalidComponentException("IContext not provided to Component\'s constructor!");
			// }
			if (dependencies.length > 0)
			{
				lock();
			}
			_J1q = new Vector.<String>(0);
			for each (var _loc4_:ComponentDependency in dependencies)
			{
				if (_loc4_.isRequired)
				{
					_J1q.push(ClassUtils.getSimpleQualifiedClassName(_loc4_.identifier));
				}
				injectDependency(_loc4_.identifier, _loc4_.dependencySetter, _loc4_.isRequired, _loc4_.eventListeners);
			}
			allDependenciesRequested();
		}

		final protected function lock():void
		{
			if (!_Io)
			{
				_Io = true;
			}
		}

		public function release(param1:IID):uint
		{
			if (_disposed)
			{
				return 0;
			}
			var _loc2_:InterfaceStruct = _6l.getStructByInterface(param1);
			if (_loc2_ == null)
			{
				_lastError = "Attempting to release unknown interface:" + param1 + "!";
				throw new Error(_lastError);
			}
			var _loc3_:uint = _loc2_.release();
			if (_x1U & 4)
			{
				if (_loc3_ == 0)
				{
					if (_6l.getTotalReferenceCount() == 0)
					{
						_context.detachComponent(this);
						this.dispose();
					}
				}
			}
			return _loc3_;
		}

		public function queueInterface(param1:IID, param2:Function = null):IUnknown
		{
			var _loc3_:InterfaceStruct = _6l.getStructByInterface(param1);
			if (_loc3_ == null)
			{
				return _context.queueInterface(param1, param2);
			}
			if (_disposed)
			{
				throw new ComponentDisposedException("Failed to queue interface trough disposed Component \"" + ClassUtils.getSimpleQualifiedClassName(this) + "\"!");
			}
			if (_Io)
			{
				return null;
			}
			_loc3_.reserve();
			var _loc4_:IUnknown = _loc3_.unknown;
			if (param2 != null)
			{
				param2(param1, _loc4_);
			}
			return _loc4_;
		}

		private function injectDependency(param1:IID, param2:Function, param3:Boolean, param4:Array):void
		{
			var identifier:IID = param1;
			var dependencySetter:Function = param2;
			var isRequired:Boolean = param3;
			var eventListeners:Array = param4;
			if (isRequired)
			{
				_K2A++;
			}
			queueInterface(identifier, (function(param1:Function, param2:Boolean, param3:Array, param4:String):Function
					{
						var setter:Function = param1;
						var required:Boolean = param2;
						var listeners:Array = param3;
						var componentName:String = param4;
						return function(param1:IID, param2:IUnknown):void
						{
							var eventDispatcher:IEventDispatcher;
							var listener:Object;
							var identifier:IID = param1;
							var unknown:IUnknown = param2;
							if (disposed)
							{
								return;
							}
							if (setter != null)
							{
								setter(unknown);
							}
							if (listeners != null)
							{
								eventDispatcher = _w1k(unknown).events;
								for each (listener in listeners)
								{
									eventDispatcher.addEventListener(listener.type, listener.callback);
								}
							}
							_71o.push((function(param1:IID, param2:IUnknown):Function
									{
										var iid:IID = param1;
										var component:IUnknown = param2;
										return function():void
										{
											var _loc2_:IEventDispatcher = null;
											if (listeners != null)
											{
												_loc2_ = _w1k(component).events;
												if (_loc2_ != null)
												{
													for each (var _loc1_:* in listeners)
													{
														_loc2_.removeEventListener(_loc1_.type, _loc1_.callback);
													}
												}
											}
											if (setter != null)
											{
												setter(null);
											}
											component.release(iid);
										};
									})(identifier, unknown));
							if (required)
							{
								allDependenciesRequested(ClassUtils.getSimpleQualifiedClassName(identifier));
							}
						};
					})(dependencySetter, isRequired, eventListeners, ClassUtils.getSimpleQualifiedClassName(this)));
		}

		private function allDependenciesRequested(param1:String = ""):void
		{
			_K2A--;
			if (param1 != "" && _J1q.indexOf(param1) > -1)
			{
				_J1q.splice(_J1q.indexOf(param1), 1);
			}
			if (_K2A == 0)
			{
				initComponent();
				// unlock();
			}
		}

		public function propertyExists(param1:String):Boolean
		{
			return _context.configuration ? _context.configuration.propertyExists(param1) : false;
		}

		protected function initComponent():void
		{
		}

		public function interpolate(param1:String):String
		{
			return _context.configuration ? _context.configuration.interpolate(param1) : "";
		}

		public function getProperty(param1:String, param2:Dictionary = null):String
		{
			return _context.configuration ? _context.configuration.getProperty(param1, param2) : "";
		}

		public function get events():IEventDispatcher
		{
			return _J2I;
		}

		public function get disposed():Boolean
		{
			return _disposed;
		}

		public function get assets():_v1t
		{
			return _assets;
		}

		protected function get dependencies():Vector.<ComponentDependency>
		{
			return new Vector.<ComponentDependency>(0);
		}

		public function dispose():void
		{
			if (!_disposed)
			{
				// for each(var _loc1_ in §_-71o§)
				// {
				// _loc1_();
				// }
				// §_-71o§ = null;
				// §_-J2I§.dispatchEvent(new Event("COMPONENT_EVENT_DISPOSING"));
				// §_-J2I§ = null;
				// §_-6l§.dispose();
				// §_-6l§ = null;
				// _assets.dispose();
				// _assets = null;
				// _context = null;
				// §_-Rm§ = 0;
				_disposed = true;
			}
		}

	}

}