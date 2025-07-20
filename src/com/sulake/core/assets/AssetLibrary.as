package com.sulake.core.assets
{
	import com.sulake.core.assets.loaders.*;
	import com.sulake.core.runtime.events.EventDispatcherWrapper;
	import com.sulake.core.utils.class_39;
	import com.sulake.core.utils.class_43;
	import deng.fzip.FZip;
	import deng.fzip.FZipFile;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.System;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

	public class AssetLibrary extends EventDispatcherWrapper implements class_21
	{

		public static const ASSET_LIBRARY_READY:String = "AssetLibraryReady";

		public static const ASSET_LIBRARY_LOADED:String = "AssetLibraryLoaded";

		public static const ASSET_LIBRARY_UNLOADED:String = "AssetLibraryUnloaded";

		public static const ASSET_LIBRARY_LOAD_ERROR:String = "AssetLibraryLoadError";

		private static const NAME:String = "name";

		private static const ASSET:String = "asset";

		private static const PARAM:String = "param";

		private static const TYPE:String = "mimeType";

		private static const LIB:String = "library";

		private static const REF:String = "ref";

		private static var _sharedListOfTypesByMime:Dictionary;

		private static const USE_LAZY_ASSET_PROCESSOR:Boolean = false;

		private static var var_240:uint = 0;

		private static var var_1208:class_66 = new class_66();

		private static var _assetLibraryRefArray:Array = [];

		private var _name:String;

		private var var_117:String;

		private var var_68:XML;

		private var var_113:Boolean;

		private var var_50:uint;

		private var var_16:class_39;

		private var var_114:Class;

		private var var_156:Dictionary;

		private var var_38:Dictionary;

		private var var_149:Boolean = true;

		private var var_95:Dictionary;

		private var _assetNameArray:Array;

		private var _localListOfTypesByMime:Dictionary;

		public function AssetLibrary(param1:String, param2:XML = null)
		{
			super();
			_name = param1;
			var_68 = param2;
			var_50 = 0;
			_assetNameArray = [];
			if (_sharedListOfTypesByMime == null)
			{
				_sharedListOfTypesByMime = new Dictionary(false);
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("application/octet-stream", UnknownAsset, BinaryFileLoader));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("application/x-shockwave-flash", DisplayAsset, BitmapFileLoader, "swf"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("application/x-font-truetype", TypeFaceAsset, BinaryFileLoader, "ttf", "otf"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("application/zip", UnknownAsset, ZipFileLoader, "zip"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("text/xml", XmlAsset, TextFileLoader, "xml"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("text/html", XmlAsset, TextFileLoader, "htm", "html"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("text/plain", TextAsset, TextFileLoader, "txt"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("image/jpeg", BitmapDataAsset, BitmapFileLoader, "jpg", "jpeg"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("image/gif", BitmapDataAsset, BitmapFileLoader, "gif"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("image/png", BitmapDataAsset, BitmapFileLoader, "png"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("image/tiff", BitmapDataAsset, BitmapFileLoader, "tif", "tiff"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("sound/mp3", SoundAsset, SoundFileLoader, "mp3"));
			}
			var_240++;
			_localListOfTypesByMime = new Dictionary(false);
			var_95 = new Dictionary(false);
			var_156 = new Dictionary(false);
			var_38 = new Dictionary(false);
			_assetLibraryRefArray.push(this);
		}

		public static function get numAssetLibraryInstances():uint
		{
			return var_240;
		}

		public static function get assetLibraryRefArray():Array
		{
			return _assetLibraryRefArray;
		}

		private static function fetchLibraryContents(param1:AssetLibrary, param2:XML, param3:Class, param4:FZip = null):Boolean
		{
			var _loc5_:* = null;
			var _loc14_:String = null;
			var _loc9_:String = null;
			var _loc7_:AssetTypeDeclaration = null;
			var _loc16_:IAsset = null;
			var _loc13_:XMLList = null;
			var _loc10_:XMLList = null;
			var _loc8_:String = null;
			var _loc11_:FZipFile = null;
			if (param3 == null && param4 == null)
			{
				throw new Error("Library " + param1.var_117 + " doesn\'t contain valid resource class!");
			}
			var _loc6_:XMLList = param2.child("library");
			if (_loc6_ == null)
			{
				throw new Error("Provided manifest doesn\'t contain library node!");
			}
			var _loc15_:* = null;
			var _loc12_:* = null;
			_loc10_ = _loc6_[0].assets;
			if (_loc10_ != null)
			{
				_loc10_ = _loc10_.child("asset");
				for each (_loc5_ in _loc10_)
				{
					_loc14_ = _loc5_.attribute("name");
					_loc9_ = _loc5_.attribute("mimeType");
					if (_loc9_ == _loc12_)
					{
						_loc7_ = _loc15_;
					}
					else
					{
						_loc7_ = param1.getAssetTypeDeclarationByMimeType(_loc9_);
						_loc12_ = _loc9_;
						_loc15_ = _loc7_;
					}
					if (_loc7_ != null)
					{
						_loc16_ = new _loc7_.assetClass(_loc7_) as IAsset;
						if (param4 != null && param4.getFileCount() > 0)
						{
							_loc8_ = ".png";
							if (_loc16_ is BitmapDataAsset)
							{
								_loc8_ = ".png";
							}
							if (_loc16_ is XmlAsset)
							{
								_loc8_ = ".xml";
							}
							_loc11_ = param4.getFileByName(_loc14_ + _loc8_);
							if (_loc11_)
							{
								_loc16_.setUnknownContent(_loc11_.content);
							}
						}
						else
						{
							_loc16_.setUnknownContent(param3[_loc14_]);
						}
						_loc13_ = _loc5_.child("param");
						if (_loc13_.length())
						{
							_loc16_.setParamsDesc(_loc13_);
						}
						param1.setAsset(_loc14_, _loc16_);
					}
				}
			}
			_loc10_ = _loc6_[0].aliases;
			if (_loc10_ != null)
			{
				_loc10_ = _loc10_.child("asset");
				for each (_loc5_ in _loc10_)
				{
					_loc14_ = _loc5_.attribute("name");
					_loc9_ = _loc5_.attribute("mimeType");
					if (_loc9_ == _loc12_)
					{
						_loc7_ = _loc15_;
					}
					else
					{
						_loc7_ = param1.getAssetTypeDeclarationByMimeType(_loc9_);
						_loc12_ = _loc9_;
						_loc15_ = _loc7_;
					}
					if (_loc7_ != null)
					{
						_loc16_ = new _loc7_.assetClass(_loc7_) as IAsset;
						_loc16_.setUnknownContent(param1.getAssetByName(_loc5_.attribute("ref")).content);
						_loc13_ = _loc5_.child("param");
						if (_loc13_.length())
						{
							_loc16_.setParamsDesc(_loc13_);
						}
						param1.setAsset(_loc14_, _loc16_);
					}
				}
			}
			return true;
		}

		public function get url():String
		{
			return var_117;
		}

		public function get name():String
		{
			return _name;
		}

		public function get isReady():Boolean
		{
			return var_113;
		}

		public function get manifest():XML
		{
			return var_68 ? var_68 : (var_68 = new XML());
		}

		public function get numAssets():uint
		{
			return var_50;
		}

		public function get nameArray():Array
		{
			return _assetNameArray;
		}

		override public function dispose():void
		{
			if (!disposed)
			{
				unload();
				super.dispose();
				_assetLibraryRefArray.splice(_assetLibraryRefArray.indexOf(this), 1);
				var_240--;
				var_95 = null;
				var_156 = null;
				var_38 = null;
				_assetNameArray = null;
				System.disposeXML(var_68);
				var_68 = null;
				var_50 = 0;
				var_113 = false;
				_name = null;
			}
		}

		public function loadFromFile(param1:class_39, param2:Boolean = true):void
		{
			if (var_117 == param1.url && var_113)
			{
				if (!var_149 && param2)
				{
					AssetLibrary.fetchLibraryContents(this, var_68, var_114);
				}
				var_149 = param2;
				dispatchEvent(new Event("AssetLibraryReady"));
			}
			else
			{
				if (var_16 == null || var_16.disposed)
				{
					var_16 = param1;
					// var_16.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE", libraryLoadedHandler);
					// var_16.addEventListener("LIBRARY_LOADER_EVENT_ERROR", loadErrorHandler);
				}
				var_149 = param2;
				var_117 = var_16.url;
			}
		}

		public function loadFromResource(param1:XML, param2:Class):Boolean
		{
			return AssetLibrary.fetchLibraryContents(this, param1, param2);
		}

		public function unload():void
		{
			var _loc2_:String = null;
			var _loc1_:AssetLoaderStruct = null;
			var _loc3_:IAsset = null;
			for (_loc2_ in var_95)
			{
				_loc1_ = var_95[_loc2_];
				_loc1_.assetLoader.dispose();
				delete var_95[_loc2_];
			}
			for (_loc2_ in var_38)
			{
				_loc3_ = var_38[_loc2_];
				_loc3_.dispose();
				delete var_38[_loc2_];
			}
			for (_loc2_ in var_156)
			{
				delete var_156[_loc2_];
			}
			if (var_16 != null)
			{
				var_16.dispose();
				var_16 = null;
			}
			var_50 = 0;
			var_113 = false;
			var_117 = null;
			dispatchEvent(new Event("AssetLibraryUnloaded"));
		}

		public function getClass(param1:String):Class
		{
			var _loc2_:Class = var_156[param1];
			if (_loc2_ != null)
			{
				return _loc2_;
			}
			if (var_16 != null)
			{
				if (var_16.hasDefinition(param1))
				{
					_loc2_ = var_16.getDefinition(param1) as Class;
					if (_loc2_ != null)
					{
						var_156[param1] = _loc2_;
						return _loc2_;
					}
				}
			}
			return null;
		}

		public function loadAssetFromFile(param1:String, param2:URLRequest, param3:String = null, param4:int = -1):AssetLoaderStruct
		{
			var _loc6_:AssetTypeDeclaration = null;
			if (getAssetByName(param1) != null)
			{
				throw new Error("Asset with name " + param1 + " already exists!");
			}
			var _loc5_:AssetLoaderStruct = var_95[param2.url];
			if (_loc5_ != null)
			{
				if (_loc5_.assetName == param1)
				{
					return _loc5_;
				}
			}
			if (param3 == null)
			{
				_loc6_ = solveAssetTypeDeclarationFromUrl(param2.url);
				if (_loc6_ == null)
				{
					throw new Error("Couldn\'t solve asset type for file " + param2.url + "!");
				}
			}
			else
			{
				_loc6_ = getAssetTypeDeclarationByMimeType(param3, true);
				if (_loc6_ == null)
				{
					throw new Error("Asset type declaration for mime type " + param3 + "not found!");
				}
			}
			var _loc7_:class_36 = new _loc6_.loaderClass(_loc6_.mimeType, param2, param4);
			if (_loc7_ == null)
			{
				throw new Error("Invalid file loader class defined for mime type " + param3 + "!");
			}
			_loc7_.addEventListener("AssetLoaderEventComplete", assetLoadEventHandler);
			_loc7_.addEventListener("AssetLoaderEventError", assetLoadEventHandler);
			_loc7_.addEventListener("AssetLoaderEventUnload", assetLoadEventHandler);
			_loc7_.addEventListener("AssetLoaderEventProgress", assetLoadEventHandler);
			_loc7_.addEventListener("AssetLoaderEventStatus", assetLoadEventHandler);
			_loc7_.addEventListener("AssetLoaderEventOpen", assetLoadEventHandler);
			_loc5_ = new AssetLoaderStruct(param1, _loc7_);
			var_95[param2.url] = _loc5_;
			return _loc5_;
		}

		private function assetLoadEventHandler(param1:AssetLoaderEvent):void
		{
			var _loc5_:String = null;
			var _loc3_:AssetTypeDeclaration = null;
			var _loc6_:IAsset = null;
			var _loc7_:Boolean = false;
			var _loc4_:class_36 = param1.target as class_36;
			if (_loc4_ == null)
			{
				throw new Error("Failed to downcast object to asset loader!");
			}
			var _loc2_:AssetLoaderStruct = var_95[_loc4_.url];
			if (_loc2_ == null)
			{
				throw new Error("Asset loader structure was lost! " + (_loc4_ ? _loc4_.url : ""));
			}
			switch (param1.type)
			{
				case "AssetLoaderEventComplete":
					_loc5_ = _loc4_.mimeType;
					_loc3_ = getAssetTypeDeclarationByMimeType(_loc5_);
					_loc7_ = true;
					if (_loc3_ != null)
					{
						_loc6_ = new _loc3_.assetClass(_loc3_, _loc4_.url);
						try
						{
							_loc6_.setUnknownContent(_loc4_.content);
						}
						catch (error:Error)
						{
							_loc6_.dispose();
							param1 = new AssetLoaderEvent("AssetLoaderEventError", param1.status);
							break;
						}
						if (var_38[_loc2_.assetName] == null)
						{
							var_50++;
							_assetNameArray.push(_loc2_.assetName);
						}
						var_38[_loc2_.assetName] = _loc6_;
						break;
					}
					param1 = new AssetLoaderEvent("AssetLoaderEventError", param1.status);
					break;
				case "AssetLoaderEventError":
					_loc7_ = true;
			}
			_loc2_.dispatchEvent(new AssetLoaderEvent(param1.type, param1.status));
			if (_loc7_)
			{
				if (!_disposed && _loc4_)
				{
					delete var_95[_loc4_.url];
				}
				if (_loc2_)
				{
					_loc2_.dispose();
				}
			}
		}

		public function getAssetByName(param1:String):IAsset
		{
			var _loc2_:IAsset = var_38[param1];
			if (_loc2_ != null)
			{
				return _loc2_;
			}
			if (var_149)
			{
				return null;
			}
			_loc2_ = fetchAssetFromResource(param1);
			if (_loc2_ == null)
			{
			}
			return _loc2_;
		}

		public function getAssetByIndex(param1:uint):IAsset
		{
			return param1 < _assetNameArray.length ? getAssetByName(_assetNameArray[param1]) : null;
		}

		public function getAssetByContent(param1:Object):IAsset
		{
			var _loc3_:IAsset = null;
			var _loc2_:String = null;
			for (_loc2_ in var_38)
			{
				_loc3_ = var_38[_loc2_];
				if (_loc3_.content === param1)
				{
					return _loc3_;
				}
			}
			return null;
		}

		public function getAssetIndex(param1:IAsset):int
		{
			var _loc2_:String = null;
			for (_loc2_ in var_38)
			{
				if (var_38[_loc2_] == param1)
				{
					return _assetNameArray.indexOf(_loc2_);
				}
			}
			return -1;
		}

		public function hasAsset(param1:String):Boolean
		{
			return var_38[param1] != null || (var_114 != null ? var_114[param1] != null : false);
		}

		public function setAsset(param1:String, param2:IAsset, param3:Boolean = true):Boolean
		{
			var _loc4_:* = var_38[param1] == null;
			if ((param3 || _loc4_) && param2)
			{
				if (_loc4_)
				{
					var_50++;
					_assetNameArray.push(param1);
				}
				var_38[param1] = param2;
				return true;
			}
			return false;
		}

		public function createAsset(param1:String, param2:AssetTypeDeclaration):IAsset
		{
			if (hasAsset(param1) || !param2)
			{
				return null;
			}
			var _loc3_:IAsset = new param2.assetClass(param2);
			if (!setAsset(param1, _loc3_))
			{
				_loc3_.dispose();
				_loc3_ = null;
			}
			return _loc3_;
		}

		public function removeAsset(param1:IAsset):IAsset
		{
			var _loc2_:String = null;
			if (param1)
			{
				for (_loc2_ in var_38)
				{
					if (var_38[_loc2_] == param1)
					{
						_assetNameArray.splice(_assetNameArray.indexOf(_loc2_), 1);
						delete var_38[_loc2_];
						var_50--;
						return param1;
					}
				}
			}
			return null;
		}

		public function registerAssetTypeDeclaration(param1:AssetTypeDeclaration, param2:Boolean = true):Boolean
		{
			if (param2)
			{
				if (_sharedListOfTypesByMime.hasOwnProperty(param1.mimeType))
				{
					throw new Error("Asset type " + param1.mimeType + " already registered!");
				}
				_sharedListOfTypesByMime[param1.mimeType] = param1;
			}
			else
			{
				if (_localListOfTypesByMime.hasOwnProperty(param1.mimeType))
				{
					throw new Error("Asset type " + param1.mimeType + " already registered!");
				}
				_localListOfTypesByMime[param1.mimeType] = param1;
			}
			return true;
		}

		public function getAssetTypeDeclarationByMimeType(param1:String, param2:Boolean = true):AssetTypeDeclaration
		{
			var _loc3_:AssetTypeDeclaration = null;
			if (param2)
			{
				_loc3_ = AssetTypeDeclaration(_sharedListOfTypesByMime[param1]);
				if (_loc3_ != null)
				{
					return _loc3_;
				}
			}
			return AssetTypeDeclaration(_localListOfTypesByMime[param1]);
		}

		public function getAssetTypeDeclarationByClass(param1:Class, param2:Boolean = true):AssetTypeDeclaration
		{
			var _loc4_:String = null;
			var _loc3_:AssetTypeDeclaration = null;
			if (param2)
			{
				for (_loc4_ in _sharedListOfTypesByMime)
				{
					_loc3_ = AssetTypeDeclaration(_sharedListOfTypesByMime[_loc4_]);
					if (_loc3_ != null)
					{
						if (_loc3_.assetClass == param1)
						{
							return _loc3_;
						}
					}
				}
			}
			for (_loc4_ in _localListOfTypesByMime)
			{
				_loc3_ = AssetTypeDeclaration(_localListOfTypesByMime[_loc4_]);
				if (_loc3_ != null)
				{
					if (_loc3_.assetClass == param1)
					{
						return _loc3_;
					}
				}
			}
			return null;
		}

		public function getAssetTypeDeclarationByFileName(param1:String, param2:Boolean = true):AssetTypeDeclaration
		{
			var _loc5_:String = null;
			var _loc4_:AssetTypeDeclaration = null;
			var _loc3_:String = param1.substr(param1.lastIndexOf(".") + 1, param1.length);
			if (_loc3_.indexOf("?"))
			{
				_loc3_ = _loc3_.substr(0, _loc3_.indexOf("?") - 1);
			}
			if (param2)
			{
				for (_loc5_ in _sharedListOfTypesByMime)
				{
					_loc4_ = AssetTypeDeclaration(_sharedListOfTypesByMime[_loc5_]);
					if (_loc4_ != null)
					{
						if (_loc4_.fileTypes.indexOf(_loc3_))
						{
							return _loc4_;
						}
					}
				}
			}
			for (_loc5_ in _localListOfTypesByMime)
			{
				_loc4_ = AssetTypeDeclaration(_localListOfTypesByMime[_loc5_]);
				if (_loc4_ != null)
				{
					if (_loc4_.fileTypes.indexOf(_loc3_))
					{
						return _loc4_;
					}
				}
			}
			return null;
		}

		// private function libraryLoadedHandler(param1:class_43):void
		// {
		// 	var _loc2_:class_39 = param1.target as class_39;
		// 	if (_loc2_.manifest == null)
		// 	{
		// 		throw new Error("loader.manifest was null, which would have caused error 1009 anyway. See HL-22347.");
		// 	}
		// 	var_68 = _loc2_.manifest.copy();
		// 	var_114 = _loc2_.resource;
		// 	var_117 = _loc2_.url;
		// 	if (var_149)
		// 	{
		// 		AssetLibrary.fetchLibraryContents(this, var_68, var_114);
		// 	}
		// 	var_113 = true;
		// 	dispatchEvent(new Event("AssetLibraryLoaded"));
		// 	dispatchEvent(new Event("AssetLibraryReady"));
		// 	if (var_149)
		// 	{
		// 		var_16.removeEventListener("LIBRARY_LOADER_EVENT_COMPLETE", libraryLoadedHandler);
		// 		var_16.removeEventListener("LIBRARY_LOADER_EVENT_ERROR", loadErrorHandler);
		// 		var_16.addEventListener("LIBRARY_LOADER_FINALIZE", finalizeLoaderEventHandler);
		// 		var_16 = null;
		// 		var_114 = null;
		// 	}
		// }

		private function finalizeLoaderEventHandler(param1:Event):void
		{
			var _loc2_:class_39 = param1.target as class_39;
			if (_loc2_ && !_loc2_.disposed)
			{
				if (!_loc2_.hasEventListener("LIBRARY_LOADER_EVENT_COMPLETE"))
				{
					_loc2_.removeEventListener("LIBRARY_LOADER_FINALIZE", finalizeLoaderEventHandler);
					_loc2_.dispose();
				}
			}
		}

		private function onLoadProgress(param1:ProgressEvent):void
		{
			dispatchEvent(param1.clone());
		}

		// private function loadErrorHandler(param1:class_43):void
		// {
		// 	var_113 = false;
		// 	var _loc3_:class_39 = param1.target as class_39;
		// 	var _loc2_:String = _loc3_ ? _loc3_.name : "unknown";
		// 	dispatchEvent(new Event("AssetLibraryLoadError"));
		// 	var_16 = null;
		// }

		private function solveAssetTypeDeclarationFromUrl(param1:String):AssetTypeDeclaration
		{
			var _loc4_:int = 0;
			var _loc2_:AssetTypeDeclaration = null;
			var _loc5_:Array = null;
			var _loc3_:String = null;
			_loc4_ = int(param1.indexOf("?", 0));
			if (_loc4_ > 0)
			{
				param1 = param1.slice(0, _loc4_);
			}
			_loc4_ = int(param1.lastIndexOf("."));
			if (_loc4_ == -1)
			{
				return null;
			}
			param1 = param1.slice(_loc4_ + 1, param1.length);
			for (_loc3_ in _localListOfTypesByMime)
			{
				_loc2_ = _localListOfTypesByMime[_loc3_];
				_loc5_ = _loc2_.fileTypes;
				if (_loc5_ != null)
				{
					if (_loc5_.indexOf(param1, 0) > -1)
					{
						return _loc2_;
					}
				}
			}
			for (_loc3_ in _sharedListOfTypesByMime)
			{
				_loc2_ = _sharedListOfTypesByMime[_loc3_];
				_loc5_ = _loc2_.fileTypes;
				if (_loc5_ != null)
				{
					if (_loc5_.indexOf(param1, 0) > -1)
					{
						return _loc2_;
					}
				}
			}
			return null;
		}

		private function fetchAssetFromResource(param1:String):IAsset
		{
			var _loc3_:AssetTypeDeclaration = null;
			var _loc4_:XMLList = null;
			var _loc2_:XML = null;
			var _loc6_:* = 0;
			if (!var_114)
			{
				return null;
			}
			var _loc7_:XMLList = var_68.child("library");
			if (_loc7_ == null)
			{
				throw new Error("Provided manifest doesn\'t contain library node!");
			}
			if (_loc7_.length() == 0)
			{
				return null;
			}
			_loc7_ = _loc7_[0].assets;
			if (_loc7_ != null)
			{
				_loc7_ = _loc7_.child("asset");
				if (_loc7_ != null)
				{
					var _loc8_:IAsset = null;
					var _loc5_:int = int(_loc7_.length());
					_loc6_ = 0;
					while (_loc6_ < _loc5_)
					{
						_loc2_ = _loc7_[_loc6_];
						if (_loc2_.attribute("name") && _loc2_.attribute("name").toString() == param1)
						{
							_loc3_ = getAssetTypeDeclarationByMimeType(_loc2_.attribute("mimeType"));
							if (_loc3_ == null)
							{
								throw new Error("Failed to extract asset " + param1 + " from Library " + var_117 + "!");
							}
							_loc8_ = new _loc3_.assetClass(_loc3_) as IAsset;
							_loc8_.setUnknownContent(var_114[param1]);
							_loc4_ = _loc2_.child("param");
							if (_loc4_ && _loc4_.length())
							{
								_loc8_.setParamsDesc(_loc4_);
							}
							setAsset(param1, _loc8_);
							return _loc8_;
						}
						_loc6_++;
					}
				}
			}
			return null;
		}

		public function toString():String
		{
			return getQualifiedClassName(this) + ": " + _name;
		}
	}
}
