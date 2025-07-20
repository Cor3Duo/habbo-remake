package com.sulake.core.runtime
{
	import com.sulake.core.utils.class_67;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;

	public interface class_35 extends class_31, class_19
	{

		function initialize():void;

		function purge():void;

		function hibernate(level:int, param2:int = 1):void;

		function resume():void;

		function get fileProxy():class_67;

		function writeDictionaryToProxy(name:String, data:Dictionary):Boolean;

		function readDictionaryFromProxy(name:String):Dictionary;

		function writeXMLToProxy(name:String, data:XML):Boolean;

		function readXMLFromProxy(name:String):XML;

		function readStringFromProxy(name:String):String;

		function writeStringToProxy(name:String, data:String):Boolean;

		function readConfigDocument(param1:XML, param2:IEventDispatcher = null):void;

		function getNumberOfFilesPending():uint;

		function getNumberOfFilesLoaded():uint;

		function setProfilerMode(value:Boolean):void;

		function get arguments():Dictionary;

		function clearArguments():void;
	}
}
