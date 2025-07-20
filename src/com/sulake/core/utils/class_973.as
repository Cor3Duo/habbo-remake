package com.sulake.core.utils
{
  public class class_973
  {

    private static var var_642:class_24 = new class_24();

    public function class_973()
    {
      super();
    }

    public static function method_20(param1:String):Object
    {
      return var_642[param1];
    }

    public static function assign(param1:String, param2:Object):Object
    {
      return var_642[param1] = param2;
    }

    public static function remove(param1:String):Object
    {
      return var_642.remove(param1);
    }
  }
}
