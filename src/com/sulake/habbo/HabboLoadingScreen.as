package com.sulake.habbo
{
	import com.sulake.core.runtime._02o;
	import com.sulake.habbo.localization.HabboLocalizationManager;
	import com.sulake.habbo.onBoardingHcUi.LoaderUI;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	import com.sulake.core.runtime._RH;
	import com.sulake.core.assets._v1t;
	import com.sulake.core.assets.AssetLibrary;
	import com.sulake.core.assets.AssetLibraryCollection;
	import flash.utils.ByteArray;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.utils.Timer;
	import flash.display.DisplayObject;
	import com.sulake.habbo.splash.PhotoSplashScreen;

	/**
	 * ...
	 * @author Richard
	 */
	public class HabboLoadingScreen extends Sprite implements _02o, IHabboLoadingScreen
	{
		private var _localization:HabboLocalizationManager;
		private var _disposed:Boolean = false;
		private var _S1O:int = 0;
		private var _M2:_RH;
		private var _lX:Timer;
		private var _Q1:int = 0;
		private var _C14:Boolean = false;
		private var _s1x:String = null;
		private var _Ta:PhotoSplashScreen;

		public function HabboLoadingScreen(param1:int, param2:int, param3:Dictionary)
		{
			super();
			var _loc5_:Sprite = null;
			var _loc13_:Sprite = null;
			var _loc9_:Array = null;
			createFakeContext(param3);
			var _loc14_:Sprite = new Sprite();
			_loc14_.name = "background";
			_loc14_.graphics.clear();
			_loc14_.graphics.beginFill(922908);
			_loc14_.graphics.drawRect(0, 0, param1, param2);
			addChild(_loc14_);
			_Ta = new PhotoSplashScreen(this);
			_Ta.name = "photoSplashScreen";
			addChild(_Ta);
			_loc5_ = new Sprite();
			_loc5_.name = "fileLoadingBar";
			_loc5_.graphics.lineStyle(1, 16777215, 1, true);
			_loc5_.graphics.beginFill(2500143);
			_loc5_.graphics.drawRect(1, 0, 400 - 1, 0);
			_loc5_.graphics.drawRect(400, 1, 0, 25 - 1);
			_loc5_.graphics.drawRect(1, 25, 400 - 1, 0);
			_loc5_.graphics.drawRect(0, 1, 0, 25 - 1);
			_loc5_.graphics.endFill();
			addChild(_loc5_);
			var _loc10_:String = _localization.getLocalization("client.starting.revolving");
			var _loc4_:String = _localization.getLocalization("client.starting");
			var _loc11_:* = null;
			if (_loc10_ != null)
			{
				_loc9_ = _loc10_.split("/");
				_S1O = randomNumber(0, _loc9_.length - 1);
				// §_-s1x§ = _loc10_;
				_loc11_ = _loc9_[_S1O];
			}
			else
			{
				_loc11_ = _loc4_;
			}
			var _loc6_:TextField = LoaderUI.createTextField(_loc11_, 28, 16777215, true, false, false, false, "center");
			_loc6_.name = "textField";
			addChild(_loc6_);
			var _loc7_:TextField = LoaderUI.createTextField("0%", 14, 10066329, true, false, false, false, "center");
			_loc7_.name = "loadingNumberTextField";
			addChild(_loc7_);
			_loc13_ = new Sprite();
			_loc13_.name = "fileBarSprite";
			_loc5_.addChild(_loc13_);
			_loc5_.visible = true;
			// var _loc12_:XML = NativeApplication.nativeApplication.applicationDescriptor;
			// var _loc8_:Namespace = _loc12_.namespace();
			// var _loc16_:String = _loc12_._loc8_::versionNumber;
			// var _loc15_:TextField = LoaderUI.createTextField(_loc16_,12,10066329,true,false,false,false,"right");
			// _loc15_.name = "versionTextField";
			// addChild(_loc15_);
			addEventListener("addedToStage", onAddedToStage);
		}

		private function onAddedToStage(param1:Event):void
		{
			removeEventListener("addedToStage", onAddedToStage);
			// stage.addEventListener("resize",onResize);
			positionLoadingScreenDisplayElements();
			_lX = new Timer(750);
			_lX.addEventListener("timer", onBarProgressEvent);
			_lX.start();
		}

		private function onBarProgressEvent(param1:Event):void
		{
			var _loc4_:Array = null;
			var _loc2_:TextField = null;
			var _loc3_:TextField = null;
			if (_Q1 == 100)
			{
				if (_C14)
				{
					_loc4_ = _s1x.split("/");
					_loc2_ = getChildByName("textField") as TextField;
					if (_loc2_ != null)
					{
						removeElement("textField");
						_loc3_ = LoaderUI.createTextField(_loc4_[_S1O], 28, 16777215, true, false, false, false, "center");
						_loc3_.x = (width - _loc3_.width) / 2;
						_loc3_.y = _loc2_.y;
						_loc3_.name = "textField";
						addChild(_loc3_);
					}
					_C14 = false;
				}
				_Q1 = 0;
			}
			else
			{
				_Q1 += Math.min(randomNumber(35, Math.min(randomNumber(45, 55))), 100 - _Q1);
			}
			if (_Q1 == 100 && _s1x != null)
			{
				_C14 = true;
				_S1O = (_S1O + 1) % (_s1x.split("/").length - 1);
			}
			updateLoadingBarProgression(_Q1 / 100);
		}

		public function updateLoadingBarProgression(param1:Number):void
		{
			var _loc6_:int = 400;
			var _loc9_:int = 25;
			var _loc5_:int = 2;
			var _loc3_:int = 2;
			var _loc8_:Sprite = getChildByName("fileLoadingBar") as Sprite;
			if (_loc8_ == null)
			{
				return;
			}
			var _loc7_:Sprite = _loc8_.getChildByName("fileBarSprite") as Sprite;
			if (_loc7_ == null)
			{
				return;
			}
			_loc7_.x = _loc5_ + _loc3_;
			_loc7_.y = _loc5_ + _loc3_;
			_loc7_.graphics.clear();
			var _loc4_:int = _loc9_ - _loc5_ * 2 - _loc3_ * 2;
			var _loc2_:int = (_loc6_ - _loc5_ * 2 - _loc3_ * 2) * param1;
			_loc7_.graphics.beginFill(0);
			_loc7_.graphics.drawRect(-1, -1, _loc6_ - _loc5_ * 2, _loc9_ - _loc3_ * 2);
			_loc7_.graphics.endFill();
			_loc7_.graphics.beginFill(12241619);
			_loc7_.graphics.drawRect(0, 0, _loc2_, _loc4_ / 2);
			_loc7_.graphics.endFill();
			_loc7_.graphics.beginFill(9216429);
			_loc7_.graphics.drawRect(0, _loc4_ / 2, _loc2_, _loc4_ / 2 + 1);
			_loc7_.graphics.endFill();
		}

		private function removeElement(param1:String):void
		{
			var _loc2_:DisplayObject = getChildByName(param1);
			if (_loc2_ != null)
			{
				removeChild(_loc2_);
			}
		}

		public function positionLoadingScreenDisplayElements():void
		{
			var _loc11_:int = 0;
			var _loc14_:int = 0;
			var _loc8_:Stage = this.stage;
			if (_loc8_ != null)
			{
				_loc11_ = _loc8_.stageWidth;
				_loc14_ = _loc8_.stageHeight;
			}
			else
			{
				_loc11_ = this.width;
				_loc14_ = this.height;
			}
			var _loc9_:Sprite = getChildByName("background") as Sprite;
			if (_loc9_ != null)
			{
				_loc9_.x = 0;
				_loc9_.y = 0;
				_loc9_.graphics.clear();
				_loc9_.graphics.beginFill(922908);
				_loc9_.graphics.drawRect(0, 0, _loc11_, _loc14_);
			}
			var _loc15_:int = 0;
			var _loc6_:int = 0;
			var _loc12_:int = 0;
			var _loc4_:int = 0;
			var _loc1_:int = 0;
			var _loc3_:int = 10;
			var _loc7_:Sprite = getChildByName("photoSplashScreen") as Sprite;
			if (_loc7_ != null)
			{
				_loc7_.x = (_loc11_ - _loc7_.width) / 2;
				_loc1_ = _loc7_.y + _loc7_.height;
			}
			var _loc5_:TextField = getChildByName("textField") as TextField;
			if (_loc5_ != null)
			{
				_loc5_.x = (_loc11_ - _loc5_.width) / 2;
				if (_loc5_.width > _loc12_)
				{
					_loc12_ = _loc5_.width;
					_loc15_ = _loc5_.x;
				}
			}
			var _loc2_:TextField = getChildByName("versionTextField") as TextField;
			if (_loc2_ != null)
			{
				_loc2_.x = _loc11_ - _loc2_.width;
				_loc2_.y = 0;
			}
			var _loc13_:Sprite = getChildByName("fileLoadingBar") as Sprite;
			if (_loc13_ != null)
			{
				_loc13_.x = (_loc11_ - _loc13_.width) / 2;
				_loc13_.y = _loc1_;
				_loc1_ = _loc13_.y + _loc13_.height;
				if (_loc13_.width > _loc12_)
				{
					_loc12_ = _loc13_.width;
					_loc15_ = _loc13_.x;
				}
			}
			var _loc10_:TextField = getChildByName("loadingNumberTextField") as TextField;
			if (_loc10_ != null)
			{
				_loc10_.x = (_loc11_ - _loc10_.width) / 2;
				if (_loc10_.width > _loc12_)
				{
					_loc12_ = _loc10_.width;
					_loc15_ = _loc10_.x;
				}
			}
			_loc1_ = (_loc14_ - _loc1_) / 2;
			_loc1_ -= _loc3_ * 2;
			if (_loc7_ != null)
			{
				_loc7_.y = _loc1_;
				_loc1_ = _loc7_.y + _loc7_.height;
			}
			if (_loc5_ != null)
			{
				_loc5_.y = _loc1_ + 50;
				_loc1_ = _loc5_.y + _loc5_.height + _loc3_;
			}
			if (_loc13_ != null)
			{
				_loc13_.y = _loc1_;
				_loc1_ = _loc13_.y + _loc13_.height + _loc3_ / 2;
			}
			if (_loc10_ != null)
			{
				_loc10_.y = _loc1_;
			}
		}

		private function createFakeContext(param1:Dictionary):void
		{
			_M2 = new FakeContext(param1);
			var _loc3_:XML = <manifest><library /></manifest>;
			var _loc2_:_v1t = new AssetLibrary("_assetsTemp@", _loc3_);
			(_M2.assets as AssetLibraryCollection).addAssetLibrary(_loc2_);
			// _Vt = createConfiguration(_M2);
			_localization = createLocalization(_M2);
			// _localization.loadDefaultEmbedLocalizations(§_-Vt§.getProperty("environment.id"));
		}

		private function createLocalization(param1:_RH):HabboLocalizationManager
		{
			var _loc5_:XML = <manifest><library /></manifest>;
			var _loc2_:ByteArray = new HabboLocalizationCom.manifest() as ByteArray;
			var _loc3_:XML = new XML(_loc2_.readUTFBytes(_loc2_.length));
			_loc5_.library.appendChild(_loc3_.component.assets);
			var _loc4_:_v1t = new AssetLibrary("_assetsLocalization@");
			_loc4_.loadFromResource(_loc5_, HabboLocalizationCom);
			return new HabboLocalizationManager(param1, 0, _loc4_);
		}

		private function randomNumber(param1:Number, param2:Number):Number
		{
			return Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
		}

		public function updateLoadingBar(param1:Number):void
		{
			var _loc2_:TextField = getChildByName("loadingNumberTextField") as TextField;
			if (_loc2_ != null)
			{
				_loc2_.text = Math.round(param1 * 100) + "%";
			}
		}

		public function dispose():void
		{
			var _loc1_:* = null;
			if (disposed)
			{
				return;
			}
			_disposed = true;
			// _loc1_ = _loc1_;
			// if(_loc1_ != null)
			// {
			// _loc1_.removeEventListener("resize",onResize);
			// }
			// removeEventListener("addedToStage",onAddedToStage);
			// removeEventListener("removedFromStage",onRemovedFromStage);
			// removeElement("photoSplashScreen");
			// removeElement("background");
			// removeElement("textField");
			// removeElement("habboLogo");
			// removeElement("fileLoadingBar");
			// removeElement("container");
			// §_-lX§.stop();
			// §_-lX§.removeEventListener("timer",onBarProgressEvent);
			// if(§_-M2§)
			// {
			// §_-M2§.dispose();
			// §_-M2§ = null;
			// }
			// if(_localization)
			// {
			// _localization.dispose();
			// _localization = null;
			// }
			// if(§_-Vt§)
			// {
			// §_-Vt§.dispose();
			// §_-Vt§ = null;
			// }
			// if(parent != null)
			// {
			// parent.removeChild(this);
			// }
		}

		public function get disposed():Boolean
		{
			return _disposed;
		}

	}

}