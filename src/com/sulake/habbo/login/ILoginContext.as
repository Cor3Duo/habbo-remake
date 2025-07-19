package com.sulake.habbo.login
{
	//import com.sulake.habbo.communication.login.AvatarData;
	import com.sulake.habbo.onBoardingHcUi.IUIContext;
	
	/**
	 * ...
	 * @author Richard
	 */
	public interface ILoginContext extends IUIContext
	{
		
		//function initLogin(param1:String, param2:String):void;
		
		function initLoginWithSsoToken(param1:String, param2:String):void;
		
		//function loginWithAvatar(param1:AvatarData):void;
		
		function showScreen(param1:int):void;
	}

}