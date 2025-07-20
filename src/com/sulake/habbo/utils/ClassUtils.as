package com.sulake.habbo.utils
{
  import flash.utils.getQualifiedClassName;

  public class ClassUtils
  {
    public function ClassUtils()
    {
      super();
    }

    public static function getSimpleQualifiedClassName(param1:*):String
    {
      var _loc3_:String = getQualifiedClassName(param1);
      var _loc2_:int = int(_loc3_.indexOf("::"));
      if (_loc2_ > 0)
      {
        return _loc3_.substr(_loc2_ + 2, _loc3_.length);
      }
      return _loc3_;
    }
  }
}