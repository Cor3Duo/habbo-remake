package com.sulake.habbo.utils.animation
{
  import flash.events.Event;
  import flash.events.EventDispatcher;

  public class Tween extends EventDispatcher implements class_65
  {

    private static const HINT_MARKER:String = "#";

    private static var var_608:Vector.<Tween> = new Vector.<Tween>(0);

    private var var_174:Object;

    private var var_135:Function;

    private var mTransitionName:String;

    private var var_129:Vector.<String>;

    private var var_110:Vector.<Number>;

    private var var_224:Vector.<Number>;

    private var var_265:Vector.<Function>;

    private var var_147:Function;

    private var mOnUpdate:Function;

    private var var_171:Function;

    private var var_198:Function;

    private var var_252:Array;

    private var var_255:Array;

    private var var_256:Array;

    private var var_215:Array;

    private var mTotalTime:Number;

    private var mCurrentTime:Number;

    private var mProgress:Number;

    private var var_259:Number;

    private var var_344:Boolean;

    private var mNextTween:Tween;

    private var var_75:int;

    private var var_284:Number;

    private var var_369:Boolean;

    private var var_109:int;

    private const REMOVE_FROM_JUGGLER:String = "REMOVE_FROM_JUGGLER";

    public function Tween(param1:Object, param2:Number, param3:Object = "linear")
    {
      super();
      reset(param1, param2, param3);
    }

    internal static function getPropertyHint(param1:String):String
    {
      if (param1.indexOf("color") != -1 || param1.indexOf("Color") != -1)
      {
        return "rgb";
      }
      var _loc2_:int = int(param1.indexOf("#"));
      if (_loc2_ != -1)
      {
        return param1.substr(_loc2_ + 1);
      }
      return null;
    }

    internal static function getPropertyName(param1:String):String
    {
      var _loc2_:int = int(param1.indexOf("#"));
      if (_loc2_ != -1)
      {
        return param1.substring(0, _loc2_);
      }
      return param1;
    }

    internal static function fromPool(param1:Object, param2:Number, param3:Object = "linear"):Tween
    {
      if (var_608.length)
      {
        return var_608.pop().reset(param1, param2, param3);
      }
      return new Tween(param1, param2, param3);
    }

    internal static function toPool(param1:Tween):void
    {
      param1.var_147 = param1.mOnUpdate = param1.var_171 = param1.var_198 = null;
      param1.var_252 = param1.var_255 = param1.var_256 = param1.var_215 = null;
      param1.var_174 = null;
      param1.var_135 = null;
      var_608.push(param1);
    }

    public function reset(param1:Object, param2:Number, param3:Object = "linear"):Tween
    {
      var_174 = param1;
      mCurrentTime = 0;
      mTotalTime = Math.max(0.0001, param2);
      mProgress = 0;
      var_259 = var_284 = 0;
      var_147 = mOnUpdate = var_171 = var_198 = null;
      var_252 = var_255 = var_256 = var_215 = null;
      var_344 = var_369 = false;
      var_75 = 1;
      var_109 = -1;
      mNextTween = null;
      if (param3 is String)
      {
        this.transition = param3 as String;
      }
      else
      {
        if (!(param3 is Function))
        {
          throw new ArgumentError("Transition must be either a string or a function");
        }
        this.transitionFunc = param3 as Function;
      }
      if (var_129)
      {
        var_129.length = 0;
      }
      else
      {
        var_129 = new Vector.<String>(0);
      }
      if (var_110)
      {
        var_110.length = 0;
      }
      else
      {
        var_110 = new Vector.<Number>(0);
      }
      if (var_224)
      {
        var_224.length = 0;
      }
      else
      {
        var_224 = new Vector.<Number>(0);
      }
      if (var_265)
      {
        var_265.length = 0;
      }
      else
      {
        var_265 = new Vector.<Function>(0);
      }
      return this;
    }

    public function animate(param1:String, param2:Number):void
    {
      if (var_174 == null)
      {
        return;
      }
      var _loc3_:int = int(var_129.length);
      var _loc4_:Function = getUpdateFuncFromProperty(param1);
      var_129[_loc3_] = getPropertyName(param1);
      var_110[_loc3_] = NaN;
      var_224[_loc3_] = param2;
      var_265[_loc3_] = _loc4_;
    }

    public function scaleTo(param1:Number):void
    {
      animate("scaleX", param1);
      animate("scaleY", param1);
    }

    public function moveTo(param1:Number, param2:Number):void
    {
      animate("x", param1);
      animate("y", param2);
    }

    public function fadeTo(param1:Number):void
    {
      animate("alpha", param1);
    }

    public function rotateTo(param1:Number, param2:String = "rad"):void
    {
      animate("rotation#" + param2, param1);
    }

    public function advanceTime(param1:Number):void
    {
      var _loc6_:int = 0;
      var _loc7_:Function = null;
      var _loc5_:Function = null;
      var _loc8_:Array = null;
      if (param1 == 0 || var_75 == 1 && mCurrentTime == mTotalTime)
      {
        return;
      }
      var _loc3_:Number = mCurrentTime;
      var _loc2_:Number = mTotalTime - mCurrentTime;
      var _loc10_:Number = param1 > _loc2_ ? param1 - _loc2_ : 0;
      mCurrentTime += param1;
      if (mCurrentTime <= 0)
      {
        return;
      }
      if (mCurrentTime > mTotalTime)
      {
        mCurrentTime = mTotalTime;
      }
      if (var_109 < 0 && _loc3_ <= 0 && mCurrentTime > 0)
      {
        var_109++;
        if (var_147 != null)
        {
          var_147.apply(this, var_252);
        }
      }
      var _loc11_:Number = mCurrentTime / mTotalTime;
      var _loc9_:Boolean = var_369 && var_109 % 2 == 1;
      var _loc4_:int = int(var_110.length);
      mProgress = _loc9_ ? var_135(1 - _loc11_) : var_135(_loc11_);
      _loc6_ = 0;
      while (_loc6_ < _loc4_)
      {
        if (var_110[_loc6_] != var_110[_loc6_])
        {
          var_110[_loc6_] = var_174[var_129[_loc6_]] as Number;
        }
        _loc7_ = var_265[_loc6_] as Function;
        _loc7_(var_129[_loc6_], var_110[_loc6_], var_224[_loc6_]);
        _loc6_++;
      }
      if (mOnUpdate != null)
      {
        mOnUpdate.apply(this, var_255);
      }
      if (_loc3_ < mTotalTime && mCurrentTime >= mTotalTime)
      {
        if (var_75 == 0 || var_75 > 1)
        {
          mCurrentTime = -var_284;
          var_109++;
          if (var_75 > 1)
          {
            var_75--;
          }
          if (var_171 != null)
          {
            var_171.apply(this, var_256);
          }
        }
        else
        {
          _loc5_ = var_198;
          _loc8_ = var_215;
          dispatchEvent(new Event("REMOVE_FROM_JUGGLER"));
          if (_loc5_ != null)
          {
            _loc5_.apply(this, _loc8_);
          }
          if (mCurrentTime == 0)
          {
            _loc10_ = 0;
          }
        }
      }
      if (_loc10_)
      {
        advanceTime(_loc10_);
      }
    }

    private function getUpdateFuncFromProperty(param1:String):Function
    {
      var _loc3_:Function = null;
      var _loc2_:String = getPropertyHint(param1);
      switch (_loc2_)
      {
        case null:
          _loc3_ = updateStandard;
          break;
        case "rgb":
          _loc3_ = updateRgb;
          break;
        case "rad":
          _loc3_ = updateRad;
          break;
        case "deg":
          _loc3_ = updateDeg;
          break;
        default:
          _loc3_ = updateStandard;
      }
      return _loc3_;
    }

    private function updateStandard(param1:String, param2:Number, param3:Number):void
    {
      var _loc4_:Number = param2 + mProgress * (param3 - param2);
      if (var_344)
      {
        _loc4_ = Math.round(_loc4_);
      }
      var_174[param1] = _loc4_;
    }

    private function updateRgb(param1:String, param2:Number, param3:Number):void
    {
      var _loc11_:uint = param2;
      var _loc6_:uint = param3;
      var _loc13_:uint = uint(_loc11_ >> 24 & 0xFF);
      var _loc17_:uint = uint(_loc11_ >> 16 & 0xFF);
      var _loc7_:uint = uint(_loc11_ >> 8 & 0xFF);
      var _loc10_:uint = uint(_loc11_ & 0xFF);
      var _loc9_:uint = uint(_loc6_ >> 24 & 0xFF);
      var _loc16_:uint = uint(_loc6_ >> 16 & 0xFF);
      var _loc5_:uint = uint(_loc6_ >> 8 & 0xFF);
      var _loc8_:uint = uint(_loc6_ & 0xFF);
      var _loc14_:uint = _loc13_ + (_loc9_ - _loc13_) * mProgress;
      var _loc4_:uint = _loc17_ + (_loc16_ - _loc17_) * mProgress;
      var _loc15_:uint = _loc7_ + (_loc5_ - _loc7_) * mProgress;
      var _loc12_:uint = _loc10_ + (_loc8_ - _loc10_) * mProgress;
      var_174[param1] = _loc14_ << 24 | _loc4_ << 16 | _loc15_ << 8 | _loc12_;
    }

    private function updateRad(param1:String, param2:Number, param3:Number):void
    {
      updateAngle(3.141592653589793, param1, param2, param3);
    }

    private function updateDeg(param1:String, param2:Number, param3:Number):void
    {
      updateAngle(180, param1, param2, param3);
    }

    private function updateAngle(param1:Number, param2:String, param3:Number, param4:Number):void
    {
      while (Math.abs(param4 - param3) > param1)
      {
        if (param3 < param4)
        {
          param4 -= 2 * param1;
        }
        else
        {
          param4 += 2 * param1;
        }
      }
      updateStandard(param2, param3, param4);
    }

    public function getEndValue(param1:String):Number
    {
      var _loc2_:int = int(var_129.indexOf(param1));
      if (_loc2_ == -1)
      {
        throw new ArgumentError("The property \'" + param1 + "\' is not animated");
      }
      return var_224[_loc2_] as Number;
    }

    public function get isComplete():Boolean
    {
      return mCurrentTime >= mTotalTime && var_75 == 1;
    }

    public function get target():Object
    {
      return var_174;
    }

    public function get transition():String
    {
      return mTransitionName;
    }

    public function set transition(param1:String):void
    {
      mTransitionName = param1;
      var_135 = Transitions.getTransition(param1);
      if (var_135 == null)
      {
        throw new ArgumentError("Invalid transiton: " + param1);
      }
    }

    public function get transitionFunc():Function
    {
      return var_135;
    }

    public function set transitionFunc(param1:Function):void
    {
      mTransitionName = "custom";
      var_135 = param1;
    }

    public function get totalTime():Number
    {
      return mTotalTime;
    }

    public function get currentTime():Number
    {
      return mCurrentTime;
    }

    public function get progress():Number
    {
      return mProgress;
    }

    public function get delay():Number
    {
      return var_259;
    }

    public function set delay(param1:Number):void
    {
      mCurrentTime = mCurrentTime + var_259 - param1;
      var_259 = param1;
    }

    public function get repeatCount():int
    {
      return var_75;
    }

    public function set repeatCount(param1:int):void
    {
      var_75 = param1;
    }

    public function get repeatDelay():Number
    {
      return var_284;
    }

    public function set repeatDelay(param1:Number):void
    {
      var_284 = param1;
    }

    public function get reverse():Boolean
    {
      return var_369;
    }

    public function set reverse(param1:Boolean):void
    {
      var_369 = param1;
    }

    public function get roundToInt():Boolean
    {
      return var_344;
    }

    public function set roundToInt(param1:Boolean):void
    {
      var_344 = param1;
    }

    public function get onStart():Function
    {
      return var_147;
    }

    public function set onStart(param1:Function):void
    {
      var_147 = param1;
    }

    public function get onUpdate():Function
    {
      return mOnUpdate;
    }

    public function set onUpdate(param1:Function):void
    {
      mOnUpdate = param1;
    }

    public function get onRepeat():Function
    {
      return var_171;
    }

    public function set onRepeat(param1:Function):void
    {
      var_171 = param1;
    }

    public function get onComplete():Function
    {
      return var_198;
    }

    public function set onComplete(param1:Function):void
    {
      var_198 = param1;
    }

    public function get onStartArgs():Array
    {
      return var_252;
    }

    public function set onStartArgs(param1:Array):void
    {
      var_252 = param1;
    }

    public function get onUpdateArgs():Array
    {
      return var_255;
    }

    public function set onUpdateArgs(param1:Array):void
    {
      var_255 = param1;
    }

    public function get onRepeatArgs():Array
    {
      return var_256;
    }

    public function set onRepeatArgs(param1:Array):void
    {
      var_256 = param1;
    }

    public function get onCompleteArgs():Array
    {
      return var_215;
    }

    public function set onCompleteArgs(param1:Array):void
    {
      var_215 = param1;
    }

    public function get nextTween():Tween
    {
      return mNextTween;
    }

    public function set nextTween(param1:Tween):void
    {
      mNextTween = param1;
    }
  }
}
