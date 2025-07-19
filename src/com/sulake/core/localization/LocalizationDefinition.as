package com.sulake.core.localization
{
  public class LocalizationDefinition implements ILocalizationDefinition
  {
    private var _f1u:String;
    private var _Ty:String;

    public function LocalizationDefinition(param1:String, param2:String, param3:String)
    {
      super();
      var _loc4_:Array = param1.split("_");
      _Ty = _loc4_[0];
      // var _loc5_:Array = String(_loc4_[1]).split(".");
      // §_-j1F§ = _loc5_[0];
      // §_-F11§ = _loc5_[1];
      // _name = param2;
      _f1u = param3;
    }

    public function get languageCode():String
    {
      return _Ty;
    }

    public function get url():String
    {
      return _f1u;
    }
  }
}