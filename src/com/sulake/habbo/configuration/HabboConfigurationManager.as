package com.sulake.habbo.configuration
{
	import com.sulake.core.assets.class_21;
	import com.sulake.core.runtime.class_31;
	import com.sulake.core.runtime.class_20;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class HabboConfigurationManager extends class_20// implements §_ -MX§, §_ -s1L§
	{
		
		public function HabboConfigurationManager(param1:class_31, param2:uint = 0, param3:class_21 = null)
		{
			super(param1, param2, param3);
			//param1.configuration = this;
			//§_-014§ = (param2 & 0x10000000) > 0;
			//§_-B1X§ = (param2 & 0x01000000) > 0;
			//lock();
			//resetAll();
			//if(!propertyExists("environment.id") && CommunicationUtils.propertyExists("environment"))
			//{
			//updateEnvironmentId(CommunicationUtils.readSOLString("environment"));
			//}
		}
		
		override public function getProperty(param1:String, param2:Dictionary = null):String
		{
			//var _loc3_:String = §_-bX§[param1] as String;
			//_loc3_ = interpolate(_loc3_);
			//if(_loc3_ == null)
			//{
			//return "";
			//}
			//if(_loc3_.substr(0,2) == "//")
			//{
			//_loc3_ = (§_-41d§ ? "https:" : "http:") + _loc3_;
			//}
			//_loc3_ = updateUrlProtocol(_loc3_);
			//if(param2 != null)
			//{
			//_loc3_ = this.fillParams(_loc3_,param2);
			//}
			//return _loc3_;
			return "";
		}
	
	}

}