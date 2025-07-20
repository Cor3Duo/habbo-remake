package com.sulake.habbo
{
	import com.sulake.core.assets.AssetLibraryCollection;
	import com.sulake.core.assets.class_21;
	import com.sulake.core.runtime.IID;
	import com.sulake.core.runtime.IUnknown;
	import com.sulake.core.runtime.class_19;
	import com.sulake.core.runtime.class_20;
	import com.sulake.core.runtime.class_31;
	import com.sulake.core.runtime.class_35;
	import com.sulake.core.runtime.class_41;
	import com.sulake.core.runtime.events.EventDispatcherWrapper;
	import com.sulake.core.runtime.events.ILinkEventTracker;
	import com.sulake.core.utils.class_39;
	import com.sulake.core.utils.class_67;
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.Dictionary;

	public class FakeContext implements class_35
	{

		private var name_1:IEventDispatcher;

		private var _assets:AssetLibraryCollection;

		private var var_192:class_19;

		private var var_56:Dictionary;

		public function FakeContext(param1:Dictionary)
		{
			super();
			name_1 = new EventDispatcherWrapper();
			_assets = new AssetLibraryCollection("fakeAssetCollection");
			var_56 = param1;
		}

		public function get assets():class_21
		{
			return _assets;
		}

		public function get events():IEventDispatcher
		{
			return name_1;
		}

		public function get root():class_31
		{
			return null;
		}

		public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null):Boolean
		{
			return false;
		}

		public function getLastErrorMessage():String
		{
			return "";
		}

		public function debug(param1:String):void
		{
		}

		public function getLastDebugMessage():String
		{
			return "";
		}

		public function warning(param1:String):void
		{
		}

		public function getLastWarningMessage():String
		{
			return "";
		}

		public function get displayObjectContainer():DisplayObjectContainer
		{
			return null;
		}

		public function loadFromFile(param1:URLRequest, param2:LoaderContext):class_39
		{
			return null;
		}

		public function attachComponent(param1:class_20, param2:Array):void
		{
		}

		public function detachComponent(param1:class_20):void
		{
		}

		public function prepareComponent(param1:Class, param2:uint = 0, param3:ApplicationDomain = null):IUnknown
		{
			return null;
		}

		public function prepareAssetLibrary(param1:XML, param2:Class):Boolean
		{
			return false;
		}

		public function registerUpdateReceiver(param1:class_41, param2:uint):void
		{
		}

		public function removeUpdateReceiver(param1:class_41):void
		{
		}

		public function toXMLString(param1:uint = 0):String
		{
			return "";
		}

		public function queueInterface(param1:IID, param2:Function = null):IUnknown
		{
			return null;
		}

		public function release(param1:IID):uint
		{
			return 0;
		}

		public function dispose():void
		{
			_assets.dispose();
			name_1 = null;
			_assets = null;
		}

		public function get disposed():Boolean
		{
			return false;
		}

		public function injectDependencies(param1:class_20):void
		{
		}

		public function get configuration():class_19
		{
			return var_192;
		}

		public function set configuration(param1:class_19):void
		{
			var_192 = param1;
		}

		public function addLinkEventTracker(param1:ILinkEventTracker):void
		{
		}

		public function removeLinkEventTracker(param1:ILinkEventTracker):void
		{
		}

		public function createLinkEvent(param1:String):void
		{
		}

		public function get linkEventTrackers():Vector.<ILinkEventTracker>
		{
			return null;
		}

		public function initialize():void
		{
		}

		public function purge():void
		{
		}

		public function hibernate(param1:int, param2:int = 1):void
		{
		}

		public function resume():void
		{
		}

		public function readConfigDocument(param1:XML, param2:IEventDispatcher = null):void
		{
		}

		public function writeDictionaryToProxy(param1:String, param2:Dictionary):Boolean
		{
			return false;
		}

		public function readDictionaryFromProxy(param1:String):Dictionary
		{
			return new Dictionary();
		}

		public function writeXMLToProxy(param1:String, param2:XML):Boolean
		{
			return false;
		}

		public function readXMLFromProxy(param1:String):XML
		{
			return new XML();
		}

		public function readStringFromProxy(param1:String):String
		{
			return "";
		}

		public function writeStringToProxy(param1:String, param2:String):Boolean
		{
			return false;
		}

		public function getNumberOfFilesPending():uint
		{
			return 0;
		}

		public function getNumberOfFilesLoaded():uint
		{
			return 0;
		}

		public function setProfilerMode(param1:Boolean):void
		{
		}

		public function get arguments():Dictionary
		{
			return var_56;
		}

		public function clearArguments():void
		{
			var_56 = new Dictionary();
		}

		public function propertyExists(param1:String):Boolean
		{
			return false;
		}

		public function getProperty(param1:String, param2:Dictionary = null):String
		{
			return "";
		}

		public function setProperty(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false):void
		{
		}

		public function getBoolean(param1:String):Boolean
		{
			return false;
		}

		public function getInteger(param1:String, param2:int):int
		{
			return 0;
		}

		public function interpolate(param1:String):String
		{
			return "";
		}

		public function updateUrlProtocol(param1:String):String
		{
			return "";
		}

		public function get fileProxy():class_67
		{
			return undefined;
		}
	}
}
