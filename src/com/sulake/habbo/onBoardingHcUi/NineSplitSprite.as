package com.sulake.habbo.onBoardingHcUi
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import com.sulake.habbo.utils._3s;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class NineSplitSprite
	{
		[Embed(source = "/assets/frame.png")]
		private static const frame_png:Class;
		[Embed(source="/assets/input_field_hitch.png")]
		private static const input_field_hitch_png:Class;
		[Embed(source="/assets/block_dark_base.png")]
		private static const block_dark_base_png:Class;
		
		private static const FRAME_BITMAP:Bitmap = new frame_png();
		private static const INPUT_FIELD_HITCH_BITMAP:Bitmap = new input_field_hitch_png();
		private static const DARK_BALLOON_BITMAP:Bitmap = new block_dark_base_png();
		
		public static var FRAME:NineSplitSprite = new NineSplitSprite(FRAME_BITMAP.bitmapData, new <int>[4, 3, 4], new <int>[5, 1, 7]);
		public static var INPUT_FIELD_HITCH:NineSplitSprite = new NineSplitSprite(INPUT_FIELD_HITCH_BITMAP.bitmapData,new <int>[10,310,10],new <int>[5,21,5]);
		public static var DARK_BALLOON:NineSplitSprite = new NineSplitSprite(DARK_BALLOON_BITMAP.bitmapData,new <int>[5,4,5],new <int>[11,1,5]);
		
		private var _bitmapData:BitmapData;
		private var _widths:Vector.<int>;
		private var _heights:Vector.<int>;
		
		public function NineSplitSprite(param1:BitmapData, param2:Vector.<int>, param3:Vector.<int>)
		{
			super();
			_bitmapData = param1;
			_widths = param2;
			_heights = param3;
		}
		
		public function render(param1:int, param2:int):Bitmap
		{
			var _loc3_:Bitmap = new Bitmap(new BitmapData(param1, param2, true, 16777215));
			renderOn(_loc3_, new Rectangle(0, 0, param1, param2));
			return _loc3_;
		}
		
		public function renderOn(param1:Bitmap, param2:Rectangle):void
		{
			var _loc10_:int = 0;
			var _loc11_:int = 0;
			var _loc7_:Rectangle = null;
			var _loc5_:Rectangle = null;
			var _loc17_:int = param2.x;
			var _loc18_:int = param2.y;
			var _loc16_:int = param2.width;
			var _loc9_:int = param2.height;
			var _loc6_:Vector.<int> = new <int>[0, _widths[0], _widths[0] + _widths[1]];
			var _loc8_:Vector.<int> = new <int>[0, _heights[0], _heights[0] + _heights[1]];
			var _loc3_:Vector.<int> = _widths;
			var _loc14_:Vector.<int> = _heights;
			var _loc13_:Vector.<int> = new <int>[_loc17_, _loc17_ + _widths[0], _loc17_ + _loc16_ - _widths[2]];
			var _loc15_:Vector.<int> = new <int>[_loc18_, _loc18_ + _heights[0], _loc18_ + _loc9_ - _heights[2]];
			var _loc12_:Vector.<int> = new <int>[_widths[0], _loc16_ - _widths[0] - _widths[2], _widths[2]];
			var _loc4_:Vector.<int> = new <int>[_heights[0], _loc9_ - _heights[0] - _heights[2], _heights[2]];
			_loc10_ = 0;
			while (_loc10_ < 3)
			{
				_loc11_ = 0;
				while (_loc11_ < 3)
				{
					if (!(_loc12_[_loc10_] < 1 || _loc4_[_loc11_] < 1 || _loc3_[_loc10_] < 1 || _loc14_[_loc11_] < 1))
					{
						_loc7_ = new Rectangle(_loc6_[_loc10_], _loc8_[_loc11_], _loc3_[_loc10_], _loc14_[_loc11_]);
						if (_loc10_ != 1 && _loc11_ != 1)
						{
							param1.bitmapData.copyPixels(_bitmapData, _loc7_, new Point(_loc13_[_loc10_], _loc15_[_loc11_]));
						}
						else
						{
							_loc5_ = new Rectangle(_loc13_[_loc10_], _loc15_[_loc11_], _loc12_[_loc10_], _loc4_[_loc11_]);
							param1.bitmapData.draw(_bitmapData, _3s.rectangleTransformMatrix(_loc7_, _loc5_), null, null, _loc5_, false);
						}
					}
					_loc11_++;
				}
				_loc10_++;
			}
		}
	
	}

}