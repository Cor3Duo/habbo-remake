package com.sulake.habbo
{
	import com.sulake.habbo.login.LoginFlow;
	import com.sulake.habbo.utils.CommunicationUtils;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class Main extends MovieClip
	{
		private var _KY:Boolean;
		private var _m19:Boolean = true;
		private var _k15:Dictionary;
		private var _loginFlow:LoginFlow = null;
		//private var _loadingScreen:IHabboLoadingScreen;
		
		public function Main()
		{
			super();
			//var _loc1_: DomainLock = new DomainLock();
			//if(!_loc1_.validateLocation(this))
			//{
			//	return;
			//}
			//_startTime = getTimer();
			stop();
			_k15 = new Dictionary();
			if (stage)
			{
				onAddedToStage();
			}
			else
			{
				this.addEventListener("addedToStage", onAddedToStage);
			}
			//NativeApplication.nativeApplication.addEventListener("invoke",onInvoke);
			//NativeApplication.nativeApplication.addEventListener("browserInvoke",onBrowserInvoke);
		}
		
		private function onAddedToStage(param1:Event = null):void
		{
			removeEventListener("addedToStage", onAddedToStage);
			_KY = true;
			tryInit();
		}
		
		private function tryInit():void
		{
			var clientFatalErrorUrl:String;
			var urlPrefix:String;
			//if(!§_-P1d§ || !§_-KY§)
			//{
			//return;
			//}
			//clientFatalErrorUrl = §_-k15§["client.fatal.error.url"];
			//if(clientFatalErrorUrl != null)
			//{
			//§_-J0§ = clientFatalErrorUrl;
			//}
			//else
			//{
			//urlPrefix = §_-k15§["url.prefix"];
			//if(urlPrefix != null)
			//{
			//§_-J0§ = urlPrefix + "/flash_client_error";
			//}
			//}
			//PROCESSLOG_ENABLED = §_-k15§["processlog.enabled"] == "1";
			//trackLoginStep("client.init.start");
			stage.scaleMode = "noScale";
			stage.quality = "low";
			stage.align = "TL";
			//root.loaderInfo.addEventListener("progress",onPreLoadingProgress);
			//root.loaderInfo.addEventListener("httpStatus",onPreLoadingStatus);
			//root.loaderInfo.addEventListener("complete",onPreLoadingCompleted);
			//root.loaderInfo.addEventListener("ioError",onPreLoadingFailed);
			//root.loaderInfo.uncaughtErrorEvents.addEventListener("uncaughtError",function(param1:UncaughtErrorEvent):void
			//{
			//reportCrash("Uncaught client error, eventType: " + param1.type + " errorID: " + param1.errorID + " runtime: " + (getTimer() - _startTime) / 1000 + "s",40,true,param1.error);
			//});
			//if(§_-gb§.isSupported())
			//{
			//CommunicationUtils.encryptedLocalStorage = new §_-gb§();
			//}
			createLoginFlowOrLoadingScreen();
			//checkPreLoadingStatus();
			//MouseWheelEnabler.init(stage);
		}
		
		private function clone(param1:Dictionary):Dictionary
		{
			var _loc2_:Dictionary = new Dictionary();
			for (var _loc3_:* in param1)
			{
				if (param1[_loc3_] is Dictionary)
				{
					_loc2_[_loc3_] = clone(param1[_loc3_]);
				}
				else
				{
					_loc2_[_loc3_] = param1[_loc3_];
				}
			}
			return _loc2_;
		}
		
		private function createLoginFlowOrLoadingScreen():void
		{
			if (!ssoTokenAvailable && _m19)
			{
				_loginFlow = new LoginFlow(clone(_k15));
				_loginFlow.addEventListener("LOGIN_FLOW_FINISHED_EVENT", onLoginFlowFinished);
				stage.addChild(_loginFlow);
				_loginFlow.init();
				//updateLoadingBarProgress();
				return;
			}
			//createLoadingScreen();
		}
		
		private function onLoginFlowFinished(param1:Event):void
		{
			_k15["sso.token"] = _loginFlow.ssoToken;
			_k15["environment.id"] = CommunicationUtils.readSOLString("environment");
			_loginFlow.removeEventListener("LOGIN_FLOW_FINISHED_EVENT", onLoginFlowFinished);
			_loginFlow.dispose();
			_loginFlow = null;
			//_loadingScreen = null;
			//createLoadingScreen();
			//checkPreLoadingStatus();
		}
		
		private function get ssoTokenAvailable():Boolean
		{
			var _loc1_:String = _k15["sso.token"];
			return _loc1_ != null && _loc1_.length > 0;
		}
	
	}

}