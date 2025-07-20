package com.sulake.core.utils
{
  import flash.utils.ByteArray;

  public interface class_67
  {

    function clearCache():void;

    function localFilePath(name:String):String;

    function cacheFilePath(param1:String):String;

    function loadLocalBitmapData(name:String, callback:Function):void;

    function cacheFileExists(uri:String):Boolean;

    function localFileExists(uri:String):Boolean;

    function readCache(param1:String):ByteArray;

    function readCacheAsync(param1:String, callback:Function):void;

    function writeCache(param1:String, bytes:ByteArray):void;

    function writeCacheAsync(param1:String, bytes:ByteArray):void;

    function deleteCacheDirectory(param1:String):void;

    function swapObjectToDisk(param1:Object):int;

    function swapObjectFromDisk(param1:int):Object;
  }
}
