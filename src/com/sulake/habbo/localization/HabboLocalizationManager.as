package com.sulake.habbo.localization
{
	import com.sulake.core.assets.class_21;
	import com.sulake.core.runtime.class_31;
	import flash.events.Event;

	/**
	 * ...
	 * @author Richard
	 */
	public class HabboLocalizationManager extends CoreLocalizationManager // implements _82s
	{
		private var _skipExternals:Boolean = false;

		public function HabboLocalizationManager(param1:class_31, param2:uint = 0, param3:class_21 = null)
		{
			super(param1, param2, param3);
			_skipExternals = (param2 & 0x10000000) > 0;
		}

		private function configureLocalizationLocations():void
		{
			var _loc3_:String = null;
			var _loc2_:String = null;
			var _loc1_:String = null;
			var _loc5_:String = null;
			var _loc4_:int = 1;
			while (propertyExists("localization." + _loc4_))
			{
				_loc3_ = getProperty("localization." + _loc4_);
				_loc2_ = getProperty("localization." + _loc4_ + ".code");
				_loc1_ = getProperty("localization." + _loc4_ + ".name");
				_loc5_ = getProperty("localization." + _loc4_ + ".url");
				super.registerLocalizationDefinition(_loc3_, _loc1_, _loc5_, _loc2_);
				_loc4_++;
			}
		}

		override protected function initComponent():void
		{
			super.initComponent();
			configureLocalizationLocations();
			if (_skipExternals)
			{
				events.dispatchEvent(new Event("complete"));
			}
			else
			{
				// context.events.addEventListener("HABBO_CONNECTION_EVENT_AUTHENTICATED", onAuthenticated);
			}
		}

		override public function getLocalization(param1:String, param2:String = ""):String
		{
			var _loc3_:String = super.getLocalization(param1, param2);
			return interpolate(_loc3_);
		}

	}

}