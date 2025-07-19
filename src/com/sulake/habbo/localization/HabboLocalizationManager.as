package com.sulake.habbo.localization
{
	import com.sulake.core.assets._v1t;
	import com.sulake.core.runtime._RH;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class HabboLocalizationManager extends CoreLocalizationManager// implements _82s
	{
		
		public function HabboLocalizationManager(param1:_RH, param2:uint = 0, param3:_v1t = null)
		{
			super(param1, param2, param3);
			//_skipExternals = (param2 & 0x10000000) > 0;
		}
		
		override public function getLocalization(param1:String, param2:String = ""):String
		{
			var _loc3_:String = super.getLocalization(param1, param2);
			return interpolate(_loc3_);
		}
	
	}

}