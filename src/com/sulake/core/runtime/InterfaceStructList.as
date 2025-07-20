package com.sulake.core.runtime
{
  import flash.utils.getQualifiedClassName;

  internal final class InterfaceStructList implements _02o
  {
    private var _Pw:Array = [];

    public function InterfaceStructList()
    {
      super();
    }

    public function getStructByInterface(param1:IID):InterfaceStruct
    {
      var _loc2_:InterfaceStruct = null;
      var _loc5_:* = 0;
      var _loc3_:String = getQualifiedClassName(param1);
      var _loc4_:uint = _Pw.length;
      _loc5_ = 0;
      while (_loc5_ < _loc4_)
      {
        _loc2_ = _Pw[_loc5_] as InterfaceStruct;
        if (_loc2_.iis == _loc3_)
        {
          return _loc2_;
        }
        _loc5_++;
      }
      return null;
    }

    public function getTotalReferenceCount():uint
    {
      var _loc1_:InterfaceStruct = null;
      var _loc4_:* = 0;
      var _loc3_:uint = 0;
      var _loc2_:uint = _Pw.length;
      _loc4_ = 0;
      while (_loc4_ < _loc2_)
      {
        _loc1_ = _Pw[_loc4_] as InterfaceStruct;
        _loc3_ += _loc1_.references;
        _loc4_++;
      }
      return _loc3_;
    }

    public function get disposed():Boolean
    {
      return _Pw == null;
    }

    public function dispose():void
    {
      var _loc1_:InterfaceStruct = null;
      var _loc3_:* = 0;
      var _loc2_:uint = _Pw.length;
      _loc3_ = 0;
      while (_loc3_ < _loc2_)
      {
        _loc1_ = _Pw.pop();
        _loc1_.dispose();
        _loc3_++;
      }
      _Pw = null;
    }
  }
}