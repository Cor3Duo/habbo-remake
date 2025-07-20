package com.sulake.core.utils
{
  public class ErrorReportStorage
  {
    private static var var_429:class_24 = new class_24();
    private static var var_244:class_24 = new class_24();

    public function ErrorReportStorage()
    {
      super();
    }

    public static function getDebugData():String
    {
      var _loc2_:int = 0;
      var _loc1_:String = "";
      _loc2_ = 0;
      while (_loc2_ < var_244.length)
      {
        if (_loc2_ == 0)
        {
          _loc1_ = var_244.getWithIndex(_loc2_);
        }
        else
        {
          _loc1_ = _loc1_ + " ** " + var_244.getWithIndex(_loc2_);
        }
        _loc2_++;
      }
      if (_loc1_.length > 400)
      {
        _loc1_ = _loc1_.substr(_loc1_.length - 400);
      }
      return _loc1_;
    }

    public static function addDebugData(param1:String, param2:String):void
    {
      var_244.remove(param1);
      var_244.add(param1, param2);
    }

    public static function setParameter(param1:String, param2:String):void
    {
      var_429[param1] = param2;
    }

    public static function getParameter(param1:String):String
    {
      return var_429[param1];
    }

    public static function getParameterNames():Array
    {
      return var_429.getKeys();
    }
  }
}
