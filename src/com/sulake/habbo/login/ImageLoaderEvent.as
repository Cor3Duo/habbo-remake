package com.sulake.habbo.login
{
  import flash.events.Event;
  import flash.display.Loader;

  public class ImageLoaderEvent extends Event
  {
    private var var_16:Loader;
    private var var_91:String;

    public function ImageLoaderEvent(param1:String, param2:Loader, param3:String)
    {
      var_16 = param2;
      var_91 = param3;
      super(param1, false, false);
    }

    public function get loader():Loader
    {
      return var_16;
    }

    public function get url():String
    {
      return var_91;
    }
  }
}