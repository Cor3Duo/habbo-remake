package com.sulake.core.runtime
{
  public class ComponentDependency
  {
    private var _21R:Boolean;
    private var _n1O:IID;
    private var _i16:Function;
    private var _eventListeners:Array;

    public function ComponentDependency(param1:IID, param2:Function, param3:Boolean = true, param4:Array = null)
    {
      super();
      _n1O = param1;
      _i16 = param2;
      _21R = param3;
      _eventListeners = param4;
    }

    internal function get eventListeners():Array
    {
      return _eventListeners;
    }

    internal function get dependencySetter():Function
    {
      return _i16;
    }

    internal function get identifier():IID
    {
      return _n1O;
    }

    internal function get isRequired():Boolean
    {
      return _21R;
    }
  }
}