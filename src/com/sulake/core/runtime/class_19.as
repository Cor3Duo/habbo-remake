package com.sulake.core.runtime
{
	import flash.utils.Dictionary;

	[SecureSWF(rename="true")]
	public interface class_19 extends IUnknown
	{

		function propertyExists(id:String):Boolean;

		function getProperty(id:String, param2:Dictionary = null):String;

		function setProperty(id:String, value:String, param3:Boolean = false, debug:Boolean = false):void;

		function getBoolean(id:String):Boolean;

		function getInteger(id:String, param2:int):int;

		function interpolate(param1:String):String;

		function updateUrlProtocol(url:String):String;
	}
}
