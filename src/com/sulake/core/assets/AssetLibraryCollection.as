package com.sulake.core.assets
{
  import com.sulake.core.runtime.events.EventDispatcherWrapper;
  import com.sulake.habbo.utils._SA;
  import flash.system.LoaderContext;
  import flash.system.ApplicationDomain;
  import flash.net.URLRequest;

  public class AssetLibraryCollection extends EventDispatcherWrapper implements _v1t
  {
    protected var _G2w:Vector.<_v1t>;
    protected var _D2a:Array;
    protected var _h1Y:LoaderContext;
    private var _gO:uint = 0;
    protected var _61Q:AssetLibrary;

    public function AssetLibraryCollection(param1:String)
    {
      super();
      // _name = param1;
      // §_-U1A§ = null;
      _G2w = new Vector.<_v1t>();
      _D2a = [];
      _h1Y = new LoaderContext(false, ApplicationDomain.currentDomain, null);
    }

    public function addAssetLibrary(param1:_v1t):void
    {
      if (_G2w.indexOf(param1) == -1)
      {
        _G2w.push(param1);
      }
    }

    public function getAssetByName(param1:String):IAsset
    {
      var _loc3_:IAsset = null;
      for each (var _loc2_:_v1t in _G2w)
      {
        _loc3_ = _loc2_.getAssetByName(param1);
        if (_loc3_ != null)
        {
          return _loc3_;
        }
      }
      return null;
    }

    public function loadFromResource(param1:XML, param2:Class):Boolean
    {
      return binLibrary.loadFromResource(param1, param2);
    }

    public function loadAssetFromFile(param1:String, param2:URLRequest, param3:String = null, param4:int = -1):AssetLoaderStruct
    {
      return binLibrary.loadAssetFromFile(param1, param2, param3, param4);
    }

    public function loadFromFile(param1:_SA, param2:Boolean = false):void
    {
      if (loaderContext == null)
      {
        loaderContext = _h1Y;
      }
      var _loc3_:_v1t = new AssetLibrary("lib-" + _gO++);
      _D2a.push(_loc3_);
      _loc3_.loadFromFile(param1, param2);
      // param1.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE", loadEventHandler);
      // param1.addEventListener("LIBRARY_LOADER_EVENT_ERROR", loadEventHandler);
      // param1.addEventListener("LIBRARY_LOADER_EVENT_PROGRESS", loadEventHandler);
    }

    public function get loaderContext():LoaderContext
    {
      return _h1Y;
    }

    public function set loaderContext(param1:LoaderContext):void
    {
      _h1Y = param1;
    }

    private function get binLibrary():_v1t
    {
      if (!_61Q)
      {
        _61Q = new AssetLibrary("bin");
        _G2w.splice(0, 0, _61Q);
      }
      return _61Q;
    }
  }
}