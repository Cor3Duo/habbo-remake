package com.sulake.core.runtime
{
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	import flash.system.ApplicationDomain;
	
	/**
	 * ...
	 * @author Richard
	 */
	public interface _RH extends IUnknown
	{
		
		//function get assets() : §_-v1t§;
		
		//function get events():IEventDispatcher;
		
		//function get root():_RH;
		
		function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null):Boolean;
		
		//function getLastErrorMessage():String;
		
		function debug(param1:String):void;
		
		//function getLastDebugMessage():String;
		
		function warning(param1:String):void;
		
		//function getLastWarningMessage():String;
		
		//function get displayObjectContainer():DisplayObjectContainer;
		
		//function loadFromFile(param1:URLRequest, param2:LoaderContext) : §_-SA§;
		
		//function attachComponent(param1:§_-w1k§, param2:Array) : void;
		
		//function detachComponent(param1:§_-w1k§) : void;
		
		//function prepareComponent(param1:Class, param2:uint = 0, param3:ApplicationDomain = null):IUnknown;
		
		//function prepareAssetLibrary(param1:XML, param2:Class):Boolean;
		
		//function registerUpdateReceiver(param1:§_-u17§, param2:uint) : void;
		
		//function removeUpdateReceiver(param1:§_-u17§) : void;
		
		//function toXMLString(param1:uint = 0):String;
		
		function get configuration():_MX;
	
		//function set configuration(param1:§_-MX§) : void;
	
		//function addLinkEventTracker(param1:ILinkEventTracker):void;
	
		//function removeLinkEventTracker(param1:ILinkEventTracker):void;
	
		//function createLinkEvent(param1:String):void;
	
		//function get linkEventTrackers():Vector.<ILinkEventTracker>;
	}

}