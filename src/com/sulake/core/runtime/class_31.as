package com.sulake.core.runtime
{
	import com.sulake.core.assets.class_21;
	import com.sulake.core.runtime.events.ILinkEventTracker;
	import com.sulake.core.utils.class_39;
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;

	[SecureSWF(rename="true")]
	public interface class_31 extends IUnknown
	{

		function get assets():class_21;

		function get events():IEventDispatcher;

		function get root():class_31;

		function error(message:String, critical:Boolean, category:int = -1, error:Error = null):Boolean;

		function getLastErrorMessage():String;

		function debug(message:String):void;

		function getLastDebugMessage():String;

		function warning(message:String):void;

		function getLastWarningMessage():String;

		function get displayObjectContainer():DisplayObjectContainer;

		function loadFromFile(url:URLRequest, loaderContext:LoaderContext):class_39;

		function attachComponent(component:class_20, param2:Array):void;

		function detachComponent(component:class_20):void;

		function prepareComponent(resource:Class, flags:uint = 0, domain:ApplicationDomain = null):IUnknown;

		function prepareAssetLibrary(manifest:XML, resource:Class):Boolean;

		function registerUpdateReceiver(receiver:class_41, param2:uint):void;

		function removeUpdateReceiver(receiver:class_41):void;

		function toXMLString(param1:uint = 0):String;

		function get configuration():class_19;

		function set configuration(value:class_19):void;

		function addLinkEventTracker(param1:ILinkEventTracker):void;

		function removeLinkEventTracker(param1:ILinkEventTracker):void;

		function createLinkEvent(link:String):void;

		function get linkEventTrackers():Vector.<ILinkEventTracker>;
	}
}
