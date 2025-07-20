package com.sulake.core.runtime.exceptions
{
  public class Exception extends Error
  {
    public function Exception(param1:String, param2:int = 0, param3:Error = null)
    {
      super(param1, param2);
      // _cause = param3;
    }
  }
}