package com.sulake.habbo.login
{
  import flash.events.EventDispatcher;
  import flash.display.Loader;
  import flash.net.URLRequest;
  import flash.events.Event;
  import flash.events.ErrorEvent;

  public class ImageLoader extends EventDispatcher
  {
    private var var_16:Loader;
    private var var_91:String;

    public function ImageLoader(param1:Loader, param2:String)
    {
      super();
      var_16 = param1;
      var_91 = param2;
      var _loc3_:URLRequest = new URLRequest(param2);
      param1.load(_loc3_);
      param1.contentLoaderInfo.addEventListener("complete", avatarImageLoadCompleteHandler);
      param1.contentLoaderInfo.addEventListener("error", onImageError);
      param1.contentLoaderInfo.addEventListener("ioError", onImageError);
      param1.contentLoaderInfo.addEventListener("securityError", onImageError);
    }

    public static function CreateLoader(param1:Loader, param2:String, param3:Function):ImageLoader
    {
      var _loc4_:ImageLoader = new ImageLoader(param1, param2);
      _loc4_.addEventListener("complete", param3);
      return _loc4_;
    }

    private function avatarImageLoadCompleteHandler(param1:Event):void
    {
      // class_14.log("[ImageLoader] Loaded image " + var_91);
      dispatchEvent(new ImageLoaderEvent("complete", var_16, var_91));
    }

    private function onImageError(param1:ErrorEvent):void
    {
      // class_14.log("[ImageLoader] Failed to load image " + param1.text);
    }
  }
}