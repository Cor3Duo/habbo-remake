package com.sulake.core.runtime
{
  import flash.utils.getQualifiedClassName;

  internal final class InterfaceStructList implements class_13
  {

    private var var_19:Array = [];

    public function InterfaceStructList()
    {
      super();
    }

    public function get length():uint
    {
      return var_19.length;
    }

    public function get disposed():Boolean
    {
      return var_19 == null;
    }

    public function dispose():void
    {
      var _loc1_:InterfaceStruct = null;
      var _loc3_:* = 0;
      var _loc2_:uint = var_19.length;
      _loc3_ = 0;
      while (_loc3_ < _loc2_)
      {
        _loc1_ = var_19.pop();
        _loc1_.dispose();
        _loc3_++;
      }
      var_19 = null;
    }

    public function insert(param1:InterfaceStruct):uint
    {
      var_19.push(param1);
      return var_19.length;
    }

    public function remove(param1:uint):InterfaceStruct
    {
      var _loc2_:InterfaceStruct = null;
      if (param1 < var_19.length)
      {
        _loc2_ = var_19[param1];
        var_19.splice(param1, 1);
        return _loc2_;
      }
      throw new Error("Index out of range!");
    }

    public function find(param1:IID):IUnknown
    {
      var _loc2_:InterfaceStruct = null;
      var _loc5_:* = 0;
      var _loc3_:String = getQualifiedClassName(param1);
      var _loc4_:uint = var_19.length;
      _loc5_ = 0;
      while (_loc5_ < _loc4_)
      {
        _loc2_ = var_19[_loc5_] as InterfaceStruct;
        if (_loc2_.iis == _loc3_)
        {
          return _loc2_.unknown;
        }
        _loc5_++;
      }
      return null;
    }

    public function getStructByInterface(param1:IID):InterfaceStruct
    {
      var _loc2_:InterfaceStruct = null;
      var _loc5_:* = 0;
      var _loc3_:String = getQualifiedClassName(param1);
      var _loc4_:uint = var_19.length;
      _loc5_ = 0;
      while (_loc5_ < _loc4_)
      {
        _loc2_ = var_19[_loc5_] as InterfaceStruct;
        if (_loc2_.iis == _loc3_)
        {
          return _loc2_;
        }
        _loc5_++;
      }
      return null;
    }

    public function getIndexByInterface(param1:IID):int
    {
      var _loc2_:InterfaceStruct = null;
      var _loc5_:int = 0;
      var _loc3_:String = getQualifiedClassName(param1);
      var _loc4_:uint = var_19.length;
      _loc5_ = 0;
      while (_loc5_ < _loc4_)
      {
        _loc2_ = var_19[_loc5_] as InterfaceStruct;
        if (_loc2_.iis == _loc3_)
        {
          return _loc5_;
        }
        _loc5_++;
      }
      return -1;
    }

    public function mapStructsByInterface(param1:IID, param2:Array):uint
    {
      var _loc3_:InterfaceStruct = null;
      var _loc7_:* = 0;
      var _loc4_:String = getQualifiedClassName(param1);
      var _loc5_:uint = 0;
      var _loc6_:uint = var_19.length;
      _loc7_ = 0;
      while (_loc7_ < _loc6_)
      {
        _loc3_ = var_19[_loc7_] as InterfaceStruct;
        if (_loc3_.iis == _loc4_)
        {
          param2.push(_loc3_);
          _loc5_++;
        }
        _loc7_++;
      }
      return _loc5_;
    }

    public function getStructByImplementor(param1:IUnknown):InterfaceStruct
    {
      var _loc2_:InterfaceStruct = null;
      var _loc4_:* = 0;
      var _loc3_:uint = var_19.length;
      _loc4_ = 0;
      while (_loc4_ < _loc3_)
      {
        _loc2_ = var_19[_loc4_] as InterfaceStruct;
        if (_loc2_.unknown == param1)
        {
          return _loc2_;
        }
        _loc4_++;
      }
      return null;
    }

    public function getIndexByImplementor(param1:IUnknown):int
    {
      var _loc2_:InterfaceStruct = null;
      var _loc4_:* = 0;
      var _loc3_:uint = var_19.length;
      _loc4_ = 0;
      while (_loc4_ < _loc3_)
      {
        _loc2_ = var_19[_loc4_] as InterfaceStruct;
        if (_loc2_.unknown == param1)
        {
          return _loc4_;
        }
        _loc4_++;
      }
      return -1;
    }

    public function mapStructsByImplementor(param1:IUnknown, param2:Array):uint
    {
      var _loc3_:InterfaceStruct = null;
      var _loc6_:* = 0;
      var _loc5_:uint = 0;
      var _loc4_:uint = var_19.length;
      _loc6_ = 0;
      while (_loc6_ < _loc4_)
      {
        _loc3_ = var_19[_loc6_] as InterfaceStruct;
        if (_loc3_.unknown == param1)
        {
          param2.push(_loc3_);
          _loc5_++;
        }
        _loc6_++;
      }
      return _loc5_;
    }

    public function getStructByIndex(param1:uint):InterfaceStruct
    {
      return param1 < var_19.length ? var_19[param1] : null;
    }

    public function getTotalReferenceCount():uint
    {
      var _loc1_:InterfaceStruct = null;
      var _loc4_:* = 0;
      var _loc3_:uint = 0;
      var _loc2_:uint = var_19.length;
      _loc4_ = 0;
      while (_loc4_ < _loc2_)
      {
        _loc1_ = var_19[_loc4_] as InterfaceStruct;
        _loc3_ += _loc1_.references;
        _loc4_++;
      }
      return _loc3_;
    }
  }
}
