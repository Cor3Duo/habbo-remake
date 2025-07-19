package com.sulake.habbo.localization
{
	import com.sulake.core.assets.AssetLoaderStruct;
	import com.sulake.core.assets.IAsset;
	import com.sulake.core.assets._v1t;
	import com.sulake.core.localization.ILocalizable;
	import com.sulake.core.localization.Localization;
	import com.sulake.core.localization._62T;
	import com.sulake.core.localization._t1N;
	import com.sulake.core.runtime._02o;
	import com.sulake.core.runtime._RH;
	import com.sulake.core.runtime._w1k;
	import com.sulake.core.localization._Uf;
	import com.sulake.habbo.utils._UR;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import com.sulake.core.localization.LocalizationDefinition;

	/**
	 * ...
	 * @author Richard
	 */
	public class CoreLocalizationManager extends _w1k implements _02o, _Uf
	{
		private var _Z17:Dictionary;
		private var _F1H:Array = [];
		private var _gameDataResources:_62T;
		private var _activeEnvironmentId:String;
		private var _acceptEmptyMap:_UR;
		private var _81v:_UR;
		private var _82N:String;

		public function CoreLocalizationManager(param1:_RH, param2:uint = 0, param3:_v1t = null)
		{
			super(param1, param2, param3);
		}

		public function hasLocalization(param1:String):Boolean
		{
			var _loc2_:Localization = _Z17[param1] as Localization;
			return _loc2_ != null;
		}

		public function updateLocalization(param1:String, param2:String):void
		{
			var _loc3_:Localization = _Z17[param1];
			if (_loc3_ == null)
			{
				_loc3_ = new Localization(this, param1, param2);
				_Z17[param1] = _loc3_;
			}
			else
			{
				_loc3_.setValue(param2);
			}
		}

		public function registerParameter(param1:String, param2:String, param3:String, param4:String = "%"):String
		{
			var _loc5_:Localization = _Z17[param1];
			if (_loc5_ == null)
			{
				_loc5_ = new Localization(this, param1, param1);
				_Z17[param1] = _loc5_;
			}
			_loc5_.registerParameter(param2, param3, param4);
			return _loc5_.value;
		}

		public function getKeys():Array
		{
			var _loc1_:Array = [];
			for (var _loc2_:* in _Z17)
			{
				_loc1_.push(_loc2_);
			}
			return _loc1_;
		}

		public function activateLocalizationDefinition(param1:String):Boolean
		{
			var _loc2_:LocalizationDefinition = _81v[param1];
			if (_loc2_ != null)
			{
				_82N = param1;
				loadLocalizationFromURL(_loc2_.url, _loc2_.languageCode);
				return true;
			}
			return false;
		}

		public function getLocalization(param1:String, param2:String = ""):String
		{
			var _loc3_:Localization = _Z17[param1] as Localization;
			if (_loc3_ == null)
			{
				_F1H.push(param1);
				return param2;
			}
			return _loc3_.value;
		}

		public function printNonExistingKeys():void
		{
			var _loc1_:String = "";
			for each (var _loc2_:String in _F1H)
			{
				_loc1_ += _loc2_ + "\n";
			}
			// §_-Lu§.log(_loc1_);
		}

		public function registerLocalizationDefinition(param1:String, param2:String, param3:String, param4:String):void
		{
			var _loc5_:LocalizationDefinition = _81v[param1];
			if (_loc5_ == null)
			{
				_loc5_ = new LocalizationDefinition(param4, param2, param3);
				_81v[param1] = _loc5_;
			}
		}

		public function loadLocalizationFromURL(param1:String, param2:String, param3:Boolean = false):void
		{
			var urlLoader:URLLoader;
			var hashesUrl:String = param1;
			var environmentId:String = param2;
			var acceptEmpty:Boolean = param3;
			if (!hashesUrl || hashesUrl == "")
			{
				// §_-Lu§.log("[CoreLocalizationManager] Localization hashes URL was null or empty!");
				events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
				return;
			}
			urlLoader = new URLLoader(new URLRequest(hashesUrl));
			urlLoader.addEventListener("complete", function(param1:Event):void
				{
					var _loc4_:_t1N = null;
					var _loc5_:String = null;
					var _loc6_:IAsset = null;
					var _loc7_:String = null;
					var _loc3_:AssetLoaderStruct = null;
					var _loc2_:String = param1.currentTarget.data;
					if (_loc2_ && _loc2_.length > 0)
					{
						try
						{
							_loc4_ = _t1N.parse(_loc2_);
							if (!_loc4_.isValid())
							{
								events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
								return;
							}
							_gameDataResources = _loc4_;
							_loc5_ = "localization_" + environmentId.toLowerCase() + "_" + _loc4_.getExternalTextsHash();
							_loc6_ = assets.getAssetByName(_loc5_);
							if (_loc6_ && environmentId == _activeEnvironmentId)
							{
								events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_LOADED"));
								return;
							}
							_activeEnvironmentId = environmentId;
							_acceptEmptyMap.remove(_loc5_);
							_acceptEmptyMap.add(_loc5_, acceptEmpty);
							_loc7_ = _loc4_.getExternalTextsUrl() + "/" + _loc4_.getExternalTextsHash();
							// §_-Lu§.log("[CoreLocalizationManager] load localization for url: " + _loc7_);
							_loc3_ = assets.loadAssetFromFile(_loc5_, new URLRequest(_loc7_), "text/plain");
							// _loc3_.addEventListener("AssetLoaderEventComplete",onLocalizationReady);
							// _loc3_.addEventListener("AssetLoaderEventError",onLocalizationFailed);
						}
						catch (error:Error)
						{
							// §_-Lu§.log("Failed parsing hashes",error.getStackTrace());
							events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
						}
					}
					else
					{
						events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
					}
				});
			urlLoader.addEventListener("error", function(param1:Event):void
				{
					events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
				});
			urlLoader.addEventListener("ioError", function(param1:Event):void
				{
					events.dispatchEvent(new Event("LOCALIZATION_EVENT_LOCALIZATION_FAILED"));
				});
		}

		public function removeListener(param1:String, param2:ILocalizable):Boolean
		{
			var _loc3_:Localization = _Z17[param1];
			if (_loc3_ != null)
			{
				_loc3_.removeListener(param2);
			}
			return true;
		}

		public function registerListener(param1:String, param2:ILocalizable):Boolean
		{
			var _loc3_:Localization = _Z17[param1];
			if (_loc3_ == null)
			{
				_F1H.push(param1);
				_loc3_ = new Localization(this, param1, param1);
				_Z17[param1] = _loc3_;
			}
			_loc3_.registerListener(param2);
			return true;
		}

		override public function interpolate(param1:String):String
		{
			var _loc5_:int = 0;
			var _loc4_:Object = null;
			var _loc3_:int = 0;
			var _loc7_:int = 0;
			var _loc2_:Localization = null;
			var _loc6_:RegExp = /\${([^}]*)}/g;
			_loc5_ = 0;
			while (_loc5_ < 3)
			{
				_loc4_ = _loc6_.exec(param1);
				if (_loc4_ == null)
				{
					return param1;
				}
				_loc3_ = 0;
				_loc7_ = 1;
				while (_loc7_ < _loc4_.length)
				{
					_loc2_ = _Z17[_loc4_[_loc7_]];
					if (_loc2_ != null)
					{
						_loc3_++;
						param1 = param1.replace("${" + _loc4_[_loc7_] + "}", _loc2_.value);
					}
					_loc7_ += 1;
				}
				if (_loc3_ == 0)
				{
					break;
				}
				_loc5_++;
			}
			return super.interpolate(param1);
		}

	}

}