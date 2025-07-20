package com.sulake.habbo.onBoardingHcUi
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class ColouredButton extends Button
	{
		[Embed(source="/assets/button_skin_pink.png")]
		private static const button_red_png:Class;
		[Embed(source="/assets/button_skin_pink_pressed.png")]
		private static const button_red_pressed_png:Class;
		[Embed(source="/assets/button_skin_pink_rollover.png")]
		private static const button_red_rollover_png:Class;
		[Embed(source="/assets/button_skin_pink_inactive.png")]
		private static const button_red_inactive_png:Class;

    [Embed(source="/assets/button_skin_green.png")]
		private static const button_green_png:Class;
		[Embed(source="/assets/button_skin_green_pressed.png")]
		private static const button_green_pressed_png:Class;
		[Embed(source="/assets/button_skin_green_rollover.png")]
		private static const button_green_rollover_png:Class;
		[Embed(source="/assets/button_skin_green_inactive.png")]
		private static const button_green_inactive_png:Class;
		
		private var defaultBg:DisplayObject;
		private var pressedBg:DisplayObject;
		private var inactiveBg:DisplayObject;
		private var rolloverBg:DisplayObject;
		
		public function ColouredButton(param1:String, param2:String, param3:Rectangle, param4:Boolean, param5:Function, param6:uint = 16777215)
		{
			super(param2, param3, param4, param5, param6);
			switch (param1)
			{
			case "red":
				defaultBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_red_png()).bitmapData, new Rectangle(8, 10, 6, 4));
				pressedBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_red_pressed_png()).bitmapData, new Rectangle(8, 10, 6, 4));
				inactiveBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_red_inactive_png()).bitmapData, new Rectangle(8, 10, 6, 4));
				rolloverBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_red_rollover_png()).bitmapData, new Rectangle(8, 10, 6, 4));
				break;
			case "gfreen": 
        defaultBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_green_png()).bitmapData, new Rectangle(8, 10, 6, 4));
        pressedBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_green_pressed_png()).bitmapData, new Rectangle(8, 10, 6, 4));
        inactiveBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_green_inactive_png()).bitmapData, new Rectangle(8, 10, 6, 4));
        rolloverBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_green_rollover_png()).bitmapData, new Rectangle(8, 10, 6, 4));
        break;
					//case "yellow": 
					//defaultBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_yellow_png()).bitmapData, new Rectangle(8, 10, 6, 4));
					//pressedBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_yellow_pressed_png()).bitmapData, new Rectangle(8, 10, 6, 4));
					//inactiveBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_yellow_inactive_png()).bitmapData, new Rectangle(8, 10, 6, 4));
					//rolloverBg = LoaderUI.createScale9GridShapeFromImage(Bitmap(new button_yellow_rollover_png()).bitmapData, new Rectangle(8, 10, 6, 4));
					//_icon = Bitmap(new icon_hc());
			}
		}

		override protected function get defaultBackground() : DisplayObject
    {
      return defaultBg;
    }
    
    override protected function get pressedBackground() : DisplayObject
    {
      return pressedBg;
    }
    
    override protected function get inactiveBackground() : DisplayObject
    {
      return inactiveBg;
    }
    
    override protected function get rolloverBackground() : DisplayObject
    {
      return rolloverBg;
    }
	
	}

}