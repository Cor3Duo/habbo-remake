package com.sulake.core.runtime
{
  import flash.utils.getQualifiedClassName;

  internal final class InterfaceStruct implements class_13
  {
    private var _s1s:IID;
    private var _iis:String;
    private var _I11:IUnknown;
    private var _Rm:uint;

    public function InterfaceStruct(param1:IID, param2:IUnknown)
    {
      super();
      _s1s = param1;
      _iis = getQualifiedClassName(_s1s);
      _I11 = param2;
      _Rm = 0;
    }

    public function get unknown():IUnknown
    {
      return _I11;
    }

    public function reserve():uint
    {
      return ++_Rm;
    }

    public function get disposed():Boolean
    {
      return _I11 == null;
    }

    public function dispose():void
    {
      _s1s = null;
      _iis = null;
      _I11 = null;
      // _Rm = 0;
    }

    public function get iis():String
    {
      return _iis;
    }

    public function get references():uint
    {
      return _Rm;
    }

    public function release():uint
    {
      return references > 0 ? --_Rm : 0;
    }
  }
}