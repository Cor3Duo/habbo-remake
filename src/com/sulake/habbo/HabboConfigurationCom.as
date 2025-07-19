package com.sulake.habbo
{
	
	/**
	 * ...
	 * @author Richard
	 */
	public class HabboConfigurationCom// extends SimpleApplication
	{
		[Embed(source="/assets/manifest.bin", mimeType="application/octet-stream")]
		public static var manifest:Class;
		
		public function HabboConfigurationCom()
		{
			super();
		}
	
	}

}