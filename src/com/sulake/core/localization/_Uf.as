package com.sulake.core.localization
{
	import com.sulake.core.runtime.IUnknown;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Richard
	 */
	public interface _Uf extends IUnknown
	{
		
		function registerListener(param1:String, param2:ILocalizable):Boolean;
		
		function removeListener(param1:String, param2:ILocalizable):Boolean;
		
		function loadLocalizationFromURL(param1:String, param2:String, param3:Boolean = false):void;
		
		function hasLocalization(param1:String):Boolean;
		
		function getLocalization(param1:String, param2:String = ""):String;
		
		function getProperty(param1:String, param2:Dictionary = null):String;
		
		function updateLocalization(param1:String, param2:String):void;
		
		function registerParameter(param1:String, param2:String, param3:String, param4:String = "%"):String;
		
		//function getLocalizationRaw(param1:String):ILocalization;
		
		function getKeys():Array;
		
		function registerLocalizationDefinition(param1:String, param2:String, param3:String, param4:String):void;
		
		function activateLocalizationDefinition(param1:String):Boolean;
		
		//function getLocalizationDefinitions() : §_-UR§;
		
		//function getLocalizationDefinition(param1:String):ILocalizationDefinition;
		
		//function getActiveLocalizationDefinition():ILocalizationDefinition;
		
		function printNonExistingKeys():void;
		
		//function getGameDataResources() : §_-62T§;
		
		function interpolate(param1:String):String;
	}

}