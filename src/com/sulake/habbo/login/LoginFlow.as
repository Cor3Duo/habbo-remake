package com.sulake.habbo.login
{
	import com.sulake.core.assets.AssetLibrary;
	import com.sulake.core.assets._v1t;
	import com.sulake.core.runtime._RH;
	import com.sulake.habbo.FakeContext;
	import com.sulake.habbo.HabboConfigurationCom;
	import com.sulake.habbo.configuration.HabboConfigurationManager;
	import com.sulake.habbo.onBoardingHcUi.ColouredButton;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import com.sulake.core.runtime._02o;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class LoginFlow extends Sprite implements ILoginContext//, _02o, ILoginViewer
	{
		[Embed(source = "/assets/logo_new.png")]
		private static const habbo_logo_png:Class;
		
		private var _x1z:Sprite;
		private var _background:Background;
		private var _B1n:Loader;
		private var _mainSprite:Sprite;
		private var _F1m:Sprite;
		private var _V1c:SsoTokenView;
		private var _j4:EnvironmentView;
		private var _ssoToken:String;
		private var _Vt:HabboConfigurationManager;
		private var _M2:_RH;
		private var _xY:ColouredButton;
		private var _H2H:Boolean;
		
		public function LoginFlow(param1:Dictionary)
		{
			super();
			createFakeContext(param1);
		}
		
		private function createFakeContext(param1:Dictionary):void
		{
			_M2 = new FakeContext(param1);
			var _loc3_:XML = <manifest><library /></manifest>;
			//var _loc2_:§_-v1t§ = new AssetLibrary("_assetsTemp@",_loc3_);
			//(§_-M2§.assets as AssetLibraryCollection).addAssetLibrary(_loc2_);
			_Vt = createConfiguration(_M2);
			//_localization = createLocalization(§_-M2§);
			//_communication = createCommunication(§_-M2§);
			//LocalizedSprite.localizationManager = _localization;
			//LocalizedTextField.localizationManager = _localization;
			//_localization.loadDefaultEmbedLocalizations(§_-Vt§.getProperty("environment.id"));
			//§_-sz§ = new WebApiLoginProvider(this);
			//§_-sz§.addEventListener("SSO_TOKEN_AVAILABLE",onSsoTokenAvailable);
		}
		
		private function createConfiguration(param1:_RH):HabboConfigurationManager
		{
			var _loc5_:XML = <manifest><library /></manifest>;
			var _loc2_:ByteArray = new HabboConfigurationCom.manifest() as ByteArray;
			var _loc3_:XML = new XML(_loc2_.readUTFBytes(_loc2_.length));
			_loc5_.library.appendChild(_loc3_.component.assets);
			var _loc4_:AssetLibrary = new AssetLibrary("_assetsConfiguration@");
			_loc4_.loadFromResource(_loc5_, HabboConfigurationCom);
			return new HabboConfigurationManager(param1, 0, _loc4_);
		}
		
		public function updateEnvironment(param1:String, param2:Boolean):void
		{
			//if(param2)
			//{
			//_localization.loadDefaultEmbedLocalizations(param1);
			//return;
			//}
			//CommunicationUtils.writeSOLProperty("environment",param1);
			//_Vt.updateEnvironmentId(param1);
			//if(_j4)
			//{
			//_j4.updateEnvironment();
			//}
			//_localization.loadDefaultEmbedLocalizations(_Vt.getProperty("environment.id"));
			//§_-Lu§.log("[LoginFlow] updated environment to: " + param1);
			//_communication.updateHostParameters();
			//_localization.requestLocalizationInit();
		}
		
		public function initLoginWithSsoToken(param1:String, param2:String):void
		{
			updateEnvironment(param1, false);
			_ssoToken = param2;
			dispatchEvent(new Event("LOGIN_FLOW_FINISHED_EVENT"));
		}
		
		public function init():void
		{
			//stage.addEventListener("resize",onStageResize);
			_background = new Background();
			addChild(_background);
			_B1n = new Loader();
			_B1n.visible = false;
			_B1n.alpha = 0;
			addChild(_B1n);
			//§_-91d§ = new Loader();
			//§_-91d§.visible = false;
			//§_-91d§.alpha = 0;
			//addChild(§_-91d§);
			_x1z = new Sprite();
			addChild(_x1z);
			var _loc1_:Bitmap = new habbo_logo_png();
			_loc1_.x = 40;
			_loc1_.y = 40;
			_x1z.addChild(_loc1_);
			_mainSprite = new Sprite();
			addChild(_mainSprite);
			_mainSprite.y = 50;
			_mainSprite.x = 5;
			_F1m = new Sprite();
			_F1m.x = 0;
			_F1m.y = 50;
			_F1m.visible = true;
			_mainSprite.addChild(_F1m);
			_j4 = new EnvironmentView(this);
			//§_-H1S§ = new LoginView(this);
			//§_-E2M§ = new AvatarView(this);
			_V1c = new SsoTokenView(this);
			//_xY = new ColouredButton("red", "X", new Rectangle(0, 0, 0, 40), true, onClose, 14211288);
			//§_-j4§.init();
			//loadImages();
			showScreen(4);
			layoutMainElements();
			//addEventListener("addedToStage",onAddedToStage);
			//addEventListener("enterFrame",onEnterFrame);
		}
		
		public function showScreen(param1:int):void
		{
			hideViews();
			var _loc2_:String = "";
			var _loc3_:String = "";
			switch (param1 - 1)
			{
			case 0: 
				_F1m.addChild(_j4);
				_j4.init();
				break;
			//case 1:
			//§_-F1m§.addChild(§_-H1S§);
			//§_-H1S§.init();
			//§_-sz§.init(_communication);
			//break;
			//case 2:
			//§_-F1m§.addChild(§_-E2M§);
			//§_-E2M§.init();
			//§_-E2M§.baseUrl = getProperty("web.api");
			//layoutMainElements();
			//break;
			case 3: 
				_F1m.addChild(_V1c);
				_V1c.init();
			}
			layoutMainElements();
		}
		
		private function layoutMainElements():void
		{
			var _loc2_:int = 0;
			if (disposed)
			{
				return;
			}
			if (_H2H)
			{
				return;
			}
			if (_background != null)
			{
				_background.resize();
			}
			var _loc1_:int = _mainSprite.width + 20;
			if (stage.stageWidth > _loc1_)
			{
				_loc2_ = (stage.stageWidth - _loc1_) / 2;
				if (_loc2_ < 5)
				{
					_loc2_ = 5;
				}
				_mainSprite.x = _loc2_;
			}
			else
			{
				_mainSprite.x = 5;
			}
			_mainSprite.y = 50;
			//_xY.y = 30;
			//_xY.x = stage.stageWidth - _xY.width - 30;
			//§_-91d§.x = Math.max(400,stage.stageWidth - §_-91d§.width + 50);
			//§_-91d§.y = stage.stageHeight - §_-91d§.height + 50;
			//§_-B1n§.x = -50;
			//§_-B1n§.y = stage.stageHeight - §_-B1n§.height + 50;
		}
		
		public function getProperty(param1:String, param2:Dictionary = null):String
		{
			var _loc3_:String = _Vt ? _Vt.getProperty(param1, param2) : "";
			if (!_loc3_ || _loc3_.length == 0)
			{
				//§_-Lu§.log("[LoginFlow] Add property: " + param1);
			}
			return _loc3_;
		}
		
		public function dispose():void
		{
			//removeEventListener("enterFrame", onEnterFrame);
			if (_H2H)
			{
				return;
			}
			if (_M2)
			{
				_M2.dispose();
				_M2 = null;
			}
			if (_background)
			{
				removeChild(_background);
				_background.dispose();
				_background = null;
			}
			if (_mainSprite != null)
			{
				removeChild(_mainSprite);
				_mainSprite = null;
			}
			hideViews();
			_j4.dispose();
			//_H1S.dispose();
			//_E2M.dispose();
			//_V1c.dispose();
			//_sz = null;
			stage.removeChild(this);
			_H2H = true;
			//LocalizedSprite.localizationManager = null;
			//LocalizedTextField.localizationManager = null;
		}
		
		private function hideViews():void
		{
			while (_F1m.numChildren > 0)
			{
				_F1m.removeChildAt(0);
			}
		}
		
		public function get debugText():TextField
		{
			return null;
		}
		
		public function get disposed():Boolean
		{
			return _H2H;
		}
		
		public function get ssoToken():String
		{
			return _ssoToken;
		}
	}

}