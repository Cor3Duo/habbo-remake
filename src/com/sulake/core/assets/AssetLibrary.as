package com.sulake.core.assets
{
	import com.sulake.core.runtime.events.EventDispatcherWrapper;
	import com.sulake.habbo.utils._SA;
	import deng.fzip.FZip;
	import deng.fzip.FZipFile;
	import flash.utils.Dictionary;
	import flash.events.Event;
	import flash.net.URLRequest;
	import com.sulake.core.assets.loaders._g9;

	/**
	 * ...
	 * @author Richard
	 */
	public class AssetLibrary extends EventDispatcherWrapper implements _v1t
	{
		private var _p1W:Dictionary;
		private var _U1B:uint;
		private var _A2G:Boolean = true;
		private var _B11:Class;
		private var _U1A:XML;
		private static var _sharedListOfTypesByMime:Dictionary;
		private var _localListOfTypesByMime:Dictionary;
		private var _assetNameArray:Array;
		private var _n1e:Boolean;
		private var _3g:String;
		private var _v1S:_SA;
		private var _6k:Dictionary;

		public function AssetLibrary(param1:String, param2:XML = null)
		{
			super();
			// _name = param1;
			_U1A = param2;
			_U1B = 0;
			_assetNameArray = [];
			if (_sharedListOfTypesByMime == null)
			{
				_sharedListOfTypesByMime = new Dictionary(false);
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("application/octet-stream",UnknownAsset,BinaryFileLoader));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("application/x-shockwave-flash",DisplayAsset,BitmapFileLoader,"swf"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("application/x-font-truetype",TypeFaceAsset,BinaryFileLoader,"ttf","otf"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("application/zip",UnknownAsset,ZipFileLoader,"zip"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("text/xml",XmlAsset,TextFileLoader,"xml"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("text/html",XmlAsset,TextFileLoader,"htm","html"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("text/plain",TextAsset,TextFileLoader,"txt"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("image/jpeg",BitmapDataAsset,BitmapFileLoader,"jpg","jpeg"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("image/gif",BitmapDataAsset,BitmapFileLoader,"gif"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("image/png",BitmapDataAsset,BitmapFileLoader,"png"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("image/tiff",BitmapDataAsset,BitmapFileLoader,"tif","tiff"));
				// registerAssetTypeDeclaration(new AssetTypeDeclaration("sound/mp3",SoundAsset,SoundFileLoader,"mp3"));
			}
			// §_-C3§++;
			_localListOfTypesByMime = new Dictionary(false);
			_6k = new Dictionary(false);
			// §_-h§ = new Dictionary(false);
			_p1W = new Dictionary(false);
			// _assetLibraryRefArray.push(this);
		}

		public function loadFromFile(param1:_SA, param2:Boolean = true):void
		{
			if (_3g == param1.url && _n1e)
			{
				if (!_A2G && param2)
				{
					AssetLibrary.fetchLibraryContents(this, _U1A, _B11);
				}
				_A2G = param2;
				dispatchEvent(new Event("AssetLibraryReady"));
			}
			else
			{
				if (_v1S == null || _v1S.disposed)
				{
					_v1S = param1;
					// _v1S.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE", libraryLoadedHandler);
					// _v1S.addEventListener("LIBRARY_LOADER_EVENT_ERROR", loadErrorHandler);
				}
				_A2G = param2;
				_3g = _v1S.url;
			}
		}

		public function loadFromResource(param1:XML, param2:Class):Boolean
		{
			return AssetLibrary.fetchLibraryContents(this, param1, param2);
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

		public function setAsset(param1:String, param2:IAsset, param3:Boolean = true):Boolean
		{
			var _loc4_:* = _p1W[param1] == null;
			if ((param3 || _loc4_) && param2)
			{
				if (_loc4_)
				{
					_U1B++;
					_assetNameArray.push(param1);
				}
				_p1W[param1] = param2;
				return true;
			}
			return false;
		}

		public function getAssetByName(param1:String):IAsset
		{
			var _loc2_:IAsset = _p1W[param1];
			if (_loc2_ != null)
			{
				return _loc2_;
			}
			if (_A2G)
			{
				return null;
			}
			_loc2_ = fetchAssetFromResource(param1);
			if (_loc2_ == null)
			{
			}
			return _loc2_;
		}

		private function fetchAssetFromResource(param1:String):IAsset
		{
			var _loc3_:AssetTypeDeclaration = null;
			var _loc4_:XMLList = null;
			var _loc2_:XML = null;
			var _loc6_:* = 0;
			if (!_B11)
			{
				return null;
			}
			// var _loc7_:XMLList = _U1A.child("library");
			// if(_loc7_ == null)
			// {
			// throw new Error("Provided manifest doesn\'t contain library node!");
			// }
			// if(_loc7_.length() == 0)
			// {
			// return null;
			// }
			// _loc7_ = _loc7_[0].assets;
			// if(_loc7_ != null)
			// {
			// _loc7_ = _loc7_.child("asset");
			// if(_loc7_ != null)
			// {
			// var _loc8_:IAsset = null;
			// var _loc5_:int = int(_loc7_.length());
			// _loc6_ = 0;
			// while(_loc6_ < _loc5_)
			// {
			// _loc2_ = _loc7_[_loc6_];
			// if(_loc2_.attribute("name") && _loc2_.attribute("name").toString() == param1)
			// {
			// _loc3_ = getAssetTypeDeclarationByMimeType(_loc2_.attribute("mimeType"));
			// if(_loc3_ == null)
			// {
			// throw new Error("Failed to extract asset " + param1 + " from Library "/* + _3g*/ + "!");
			// }
			// _loc8_ = new _loc3_.assetClass(_loc3_) as IAsset;
			// _loc8_.setUnknownContent(§_-B11§[param1]);
			// _loc4_ = _loc2_.child("param");
			// if(_loc4_ && _loc4_.length())
			// {
			// _loc8_.setParamsDesc(_loc4_);
			// }
			// setAsset(param1,_loc8_);
			// return _loc8_;
			// }
			// _loc6_++;
			// }
			// }
			// }
			return null;
		}

		public function loadAssetFromFile(param1:String, param2:URLRequest, param3:String = null, param4:int = -1):AssetLoaderStruct
		{
			var _loc6_:AssetTypeDeclaration = null;
			if (getAssetByName(param1) != null)
			{
				throw new Error("Asset with name " + param1 + " already exists!");
			}
			var _loc5_:AssetLoaderStruct = _6k[param2.url];
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
			var _loc7_:_g9 = new _loc6_.loaderClass(_loc6_.mimeType, param2, param4);
			if (_loc7_ == null)
			{
				throw new Error("Invalid file loader class defined for mime type " + param3 + "!");
			}
			// _loc7_.addEventListener("AssetLoaderEventComplete",assetLoadEventHandler);
			// _loc7_.addEventListener("AssetLoaderEventError",assetLoadEventHandler);
			// _loc7_.addEventListener("AssetLoaderEventUnload",assetLoadEventHandler);
			// _loc7_.addEventListener("AssetLoaderEventProgress",assetLoadEventHandler);
			// _loc7_.addEventListener("AssetLoaderEventStatus",assetLoadEventHandler);
			// _loc7_.addEventListener("AssetLoaderEventOpen",assetLoadEventHandler);
			_loc5_ = new AssetLoaderStruct(param1, _loc7_);
			_6k[param2.url] = _loc5_;
			return _loc5_;
		}

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
				throw new Error("Library " /* + param1._3g */ + " doesn\'t contain valid resource class!");
			}
			var _loc6_:XMLList = param2.child("library");
			if (_loc6_ == null)
			{
				throw new Error("Provided manifest doesn\'t contain library node!");
			}
			var _loc15_:AssetTypeDeclaration = null;
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

	}

}