package com.sulake.habbo
{
	import com.sulake.core.runtime._02o;
	import com.sulake.habbo.localization.HabboLocalizationManager;
	import com.sulake.habbo.onBoardingHcUi.LoaderUI;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class HabboLoadingScreen extends Sprite implements _02o, IHabboLoadingScreen
	{
		private var _localization:HabboLocalizationManager;
		private var _disposed:Boolean = false;
		private var _S1O:int = 0;
		
		public function HabboLoadingScreen(param1:int, param2:int, param3:Dictionary)
		{
			super();
			var _loc5_:Sprite = null;
			var _loc13_:Sprite = null;
			var _loc9_:Array = null;
			//createFakeContext(param3);
			var _loc14_:Sprite = new Sprite();
			_loc14_.name = "background";
			_loc14_.graphics.clear();
			_loc14_.graphics.beginFill(922908);
			_loc14_.graphics.drawRect(0, 0, param1, param2);
			addChild(_loc14_);
			//§_-Ta§ = new PhotoSplashScreen(this);
			//§_-Ta§.name = "photoSplashScreen";
			//addChild(§_-Ta§);
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
				//§_-s1x§ = _loc10_;
				_loc11_ = _loc9_[_S1O];
			}
			else
			{
				_loc11_ = _loc4_;
			}
			var _loc6_:TextField = LoaderUI.createTextField(_loc11_, 28, 16777215, true, false, false, false, "center");
			_loc6_.name = "textField";
			addChild(_loc6_);
			//var _loc7_:TextField = LoaderUI.createTextField("0%",14,10066329,true,false,false,false,"center");
			//_loc7_.name = "loadingNumberTextField";
			//addChild(_loc7_);
			//_loc13_ = new Sprite();
			//_loc13_.name = "fileBarSprite";
			//_loc5_.addChild(_loc13_);
			//_loc5_.visible = true;
			//var _loc12_:XML = NativeApplication.nativeApplication.applicationDescriptor;
			//var _loc8_:Namespace = _loc12_.namespace();
			//var _loc16_:String = _loc12_._loc8_::versionNumber;
			//var _loc15_:TextField = LoaderUI.createTextField(_loc16_,12,10066329,true,false,false,false,"right");
			//_loc15_.name = "versionTextField";
			//addChild(_loc15_);
			//addEventListener("addedToStage",onAddedToStage);
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
			//_loc1_ = _loc1_;
			//if(_loc1_ != null)
			//{
			//_loc1_.removeEventListener("resize",onResize);
			//}
			//removeEventListener("addedToStage",onAddedToStage);
			//removeEventListener("removedFromStage",onRemovedFromStage);
			//removeElement("photoSplashScreen");
			//removeElement("background");
			//removeElement("textField");
			//removeElement("habboLogo");
			//removeElement("fileLoadingBar");
			//removeElement("container");
			//§_-lX§.stop();
			//§_-lX§.removeEventListener("timer",onBarProgressEvent);
			//if(§_-M2§)
			//{
			//§_-M2§.dispose();
			//§_-M2§ = null;
			//}
			//if(_localization)
			//{
			//_localization.dispose();
			//_localization = null;
			//}
			//if(§_-Vt§)
			//{
			//§_-Vt§.dispose();
			//§_-Vt§ = null;
			//}
			//if(parent != null)
			//{
			//parent.removeChild(this);
			//}
		}
		
		public function get disposed():Boolean
		{
			return _disposed;
		}
	
	}

}