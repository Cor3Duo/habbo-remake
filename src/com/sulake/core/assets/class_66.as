package com.sulake.core.assets
{
  import com.sulake.core.class_79;
  import com.sulake.core.runtime.class_41;

  public class class_66 implements class_41
  {

    private var var_86:Vector.<ILazyAsset> = new Vector.<ILazyAsset>();

    private var var_90:Boolean = false;

    private var _disposed:Boolean = false;

    public function class_66()
    {
      super();
    }

    public function get disposed():Boolean
    {
      return _disposed;
    }

    public function dispose():void
    {
      if (!_disposed)
      {
        class_79.instance.removeUpdateReceiver(this);
        var_86 = null;
        var_90 = false;
        _disposed = true;
      }
    }

    public function push(param1:ILazyAsset):void
    {
      if (param1)
      {
        var_86.push(param1);
        if (!var_90)
        {
          class_79.instance.registerUpdateReceiver(this, 2);
          var_90 = true;
        }
      }
    }

    public function flush():void
    {
      for each (var _loc1_:* in var_86)
      {
        if (!_loc1_.disposed)
        {
          _loc1_.prepareLazyContent();
        }
      }
      var_86 = new Vector.<ILazyAsset>();
      if (var_90)
      {
        class_79.instance.removeUpdateReceiver(this);
        var_90 = false;
      }
    }

    public function update(param1:uint):void
    {
      var _loc2_:ILazyAsset = var_86.shift();
      if (!_loc2_)
      {
        if (var_90)
        {
          class_79.instance.removeUpdateReceiver(this);
          var_90 = false;
        }
      }
      else if (!_loc2_.disposed)
      {
        _loc2_.prepareLazyContent();
      }
    }
  }
}
