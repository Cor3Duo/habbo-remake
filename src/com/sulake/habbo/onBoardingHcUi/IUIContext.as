package com.sulake.habbo.onBoardingHcUi
{
	import flash.display.Stage;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Richard
	 */
	public interface IUIContext
	{
		function get stage():Stage;
		function get debugText():TextField;
	}

}