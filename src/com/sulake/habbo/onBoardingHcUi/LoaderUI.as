package com.sulake.habbo.onBoardingHcUi
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class LoaderUI
	{
		private static const ETCHING_FILTER:DropShadowFilter = new DropShadowFilter(1, 90, 13751296, 1, 1, 1);
		private static const NEGATIVE_ETCHING_FILTER:DropShadowFilter = new DropShadowFilter(1, 270, 0, 0.7, 1, 1);
		
		[Embed(source = "/assets/Ubuntu-C.ttf", fontName = "Ubuntu", fontFamily = "Ubuntu Condensed", mimeType = "application/x-font", fontWeight = "normal", fontStyle = "normal", unicodeRange = "U+0020-007E,U+00A0-017F,U+0192-0192,U+02C6-02C7,U+02C9-02C9,U+02D8-02DD,U+0311-0311,U+0384-0386,U+0388-038A,U+038C-038C,U+038E-0394,U+03A9-03A9,U+03BC-03BC,U+03C0-03C0,U+2013-2015,U+2018-201A,U+201C-201E,U+2020-2022,U+2026-2026,U+2030-2030,U+2039-203A,U+2044-2044,U+2070-2070,U+2074-2079,U+2080-2089,U+20AC-20AC,U+20AE-20AE,U+20B4-20B4,U+20B9-20B9,U+2113-2113,U+2116-2116,U+2122-2122,U+2126-2126,U+212E-212E,U+2153-2159,U+2202-2202,U+2206-2206,U+220F-220F,U+2211-2211,U+2219-221A,U+221E-221E,U+222B-222B,U+2248-2248,U+2260-2260,U+2264-2265,U+25CA-25CA,U+F000-F002", advancedAntiAliasing = "true", embedAsCFF = "false")]
		public static var ubuntu_regular:Class;
		[Embed(source = "/assets/Ubuntu-B.ttf", fontName = "Ubuntu", fontFamily = "Ubuntu", mimeType = "application/x-font", fontWeight = "bold", fontStyle = "normal", unicodeRange = "U+0020-007E,U+00A0-017F,U+0192-0192,U+02C6-02C7,U+02C9-02C9,U+02D8-02DD,U+0311-0311,U+0384-0386,U+0388-038A,U+038C-038C,U+038E-0394,U+03A9-03A9,U+03BC-03BC,U+03C0-03C0,U+2013-2015,U+2018-201A,U+201C-201E,U+2020-2022,U+2026-2026,U+2030-2030,U+2039-203A,U+2044-2044,U+2070-2070,U+2074-2079,U+2080-2089,U+20AC-20AC,U+20AE-20AE,U+20B4-20B4,U+20B9-20B9,U+2113-2113,U+2116-2116,U+2122-2122,U+2126-2126,U+212E-212E,U+2153-2159,U+2202-2202,U+2206-2206,U+220F-220F,U+2211-2211,U+2219-221A,U+221E-221E,U+222B-222B,U+2248-2248,U+2260-2260,U+2264-2265,U+25CA-25CA,U+F000-F002", advancedAntiAliasing = "true", embedAsCFF = "false")]
		public static var ubuntu_bold:Class;
		[Embed(source = "/assets/Ubuntu-I.ttf", fontName = "Ubuntu", fontFamily = "Ubuntu", mimeType = "application/x-font", fontWeight = "normal", fontStyle = "italic", unicodeRange = "U+0020-007E,U+00A0-017F,U+0192-0192,U+02C6-02C7,U+02C9-02C9,U+02D8-02DD,U+0311-0311,U+0384-0386,U+0388-038A,U+038C-038C,U+038E-0394,U+03A9-03A9,U+03BC-03BC,U+03C0-03C0,U+2013-2015,U+2018-201A,U+201C-201E,U+2020-2022,U+2026-2026,U+2030-2030,U+2039-203A,U+2044-2044,U+2070-2070,U+2074-2079,U+2080-2089,U+20AC-20AC,U+20AE-20AE,U+20B4-20B4,U+20B9-20B9,U+2113-2113,U+2116-2116,U+2122-2122,U+2126-2126,U+212E-212E,U+2153-2159,U+2202-2202,U+2206-2206,U+220F-220F,U+2211-2211,U+2219-221A,U+221E-221E,U+222B-222B,U+2248-2248,U+2260-2260,U+2264-2265,U+25CA-25CA,U+F000-F002", advancedAntiAliasing = "true", embedAsCFF = "false")]
		public static var ubuntu_italic:Class;
		[Embed(source = "/assets/Ubuntu-BI.ttf", fontName = "Ubuntu", fontFamily = "Ubuntu", mimeType = "application/x-font", fontWeight = "bold", fontStyle = "italic", unicodeRange = "U+0020-007E,U+00A0-017F,U+0192-0192,U+02C6-02C7,U+02C9-02C9,U+02D8-02DD,U+0311-0311,U+0384-0386,U+0388-038A,U+038C-038C,U+038E-0394,U+03A9-03A9,U+03BC-03BC,U+03C0-03C0,U+2013-2015,U+2018-201A,U+201C-201E,U+2020-2022,U+2026-2026,U+2030-2030,U+2039-203A,U+2044-2044,U+2070-2070,U+2074-2079,U+2080-2089,U+20AC-20AC,U+20AE-20AE,U+20B4-20B4,U+20B9-20B9,U+2113-2113,U+2116-2116,U+2122-2122,U+2126-2126,U+212E-212E,U+2153-2159,U+2202-2202,U+2206-2206,U+220F-220F,U+2211-2211,U+2219-221A,U+221E-221E,U+222B-222B,U+2248-2248,U+2260-2260,U+2264-2265,U+25CA-25CA,U+F000-F002", advancedAntiAliasing = "true", embedAsCFF = "false")]
		public static var ubuntu_bold_italic:Class;
		[Embed(source = "/assets/block_dark_point_down.png")]
		private static const block_dark_point_down_png:Class;
		[Embed(source = "/assets/block_dark_point_up.png")]
		private static const block_dark_point_up_png:Class;
		[Embed(source = "/assets/block_dark_point_left.png")]
		private static const block_dark_point_left_png:Class;
		[Embed(source = "/assets/block_dark_point_right.png")]
		private static const block_dark_point_right_png:Class;
		
		public function LoaderUI()
		{
			super();
		}
		
		public static function createTextField(param1:String, param2:int, param3:uint, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:String = "left", param9:Boolean = false, param10:Boolean = false):TextField
		{
			var _loc11_:TextFormat = new TextFormat("Ubuntu", param2, param3, param4, param7, param10);
			_loc11_.align = param8;
			_loc11_.kerning = param9;
			var _loc12_:LocalizedTextField = new LocalizedTextField();
			_loc12_.embedFonts = true;
			_loc12_.antiAliasType = "advanced";
			_loc12_.defaultTextFormat = _loc11_;
			_loc12_.multiline = param5;
			_loc12_.wordWrap = param5;
			_loc12_.type = param6 ? "input" : "dynamic";
			_loc12_.selectable = param6;
			_loc12_.htmlText = param1;
			_loc12_.autoSize = "left";
			_loc12_.width = _loc12_.textWidth;
			_loc12_.height = _loc12_.textHeight;
			return _loc12_;
		}
		
		public static function lineUpHorizontallyRevers(param1:DisplayObject, ... rest):void
		{
			var _loc5_:int = 0;
			var _loc3_:int = 0;
			var _loc6_:DisplayObject = null;
			var _loc4_:int = rest.length / 2;
			_loc5_ = 0;
			while (_loc5_ < _loc4_)
			{
				_loc3_ = int(rest[_loc5_ * 2]);
				_loc6_ = rest[_loc5_ * 2 + 1];
				_loc6_.x = param1.x - _loc3_ - _loc6_.width;
				param1 = _loc6_;
				_loc5_++;
			}
		}
		
		public static function createFrame(param1:String, param2:String, param3:Rectangle, param4:int = 1):Sprite
		{
			var _loc8_:TextField = null;
			var _loc9_:Sprite = new Sprite();
			_loc9_.x = param3.x;
			_loc9_.y = param3.y;
			if (param4 == 1)
			{
				_loc9_.addChild(NineSplitSprite.FRAME.render(param3.width, param3.height));
			}
			var _loc5_:uint = uint(param4 == 2 ? 8309486 : 16777215);
			var _loc6_:int = param4 == 2 ? 24 : 40;
			var _loc7_:TextField = createTextField(param1, _loc6_, _loc5_, false, false, false, false);
			_loc7_.y = -(_loc6_ + 8);
			_loc7_.autoSize = "left";
			_loc9_.addChild(_loc7_);
			if (param4 == 2)
			{
				_loc7_.width = param3.width;
				_loc7_.thickness = 50;
			}
			if (param2 != null && param2 != "")
			{
				_loc8_ = createTextField(param2, 10, 11184810, true);
				_loc8_.x = 8;
				_loc8_.y = -(_loc6_ + 16);
				_loc8_.autoSize = "left";
				_loc9_.addChild(_loc8_);
			}
			return _loc9_;
		}
		
		public static function addEtching(param1:DisplayObject, param2:Boolean = false):void
		{
			param1.filters = [param2 ? NEGATIVE_ETCHING_FILTER.clone() : ETCHING_FILTER.clone()];
		}
		
		public static function alignAnchors(param1:DisplayObject, param2:int, param3:String, ... rest):void
		{
			for each (var _loc5_:* in rest)
			{
				if (param3.indexOf("l") >= 0)
				{
					_loc5_.x = param1.x + param2;
				}
				if (param3.indexOf("c") >= 0)
				{
					_loc5_.x = param1.x + int((param1.width - _loc5_.width) / 2);
				}
				if (param3.indexOf("r") >= 0)
				{
					_loc5_.x = param1.x + param1.width - _loc5_.width - param2;
				}
				if (param3.indexOf("t") >= 0)
				{
					_loc5_.y = param1.y + param2;
				}
				if (param3.indexOf("m") >= 0)
				{
					_loc5_.y = param1.y + int((param1.height - _loc5_.height) / 2);
				}
				if (param3.indexOf("b") >= 0)
				{
					_loc5_.y = param1.y + param1.height - _loc5_.height - param2;
				}
			}
		}
		
		public static function createBalloon(param1:int, param2:int, param3:int, param4:Boolean, param5:uint = 16777215, param6:String = "up"):Bitmap
		{
			var _loc9_:Bitmap = null;
			var _loc10_:int = 0;
			var _loc11_:int = 0;
			var _loc8_:Bitmap = null;
			if (param3 < 0)
			{
				param3 = (param1 - 9) / 2;
			}
			var _loc7_:NineSplitSprite = NineSplitSprite.DARK_BALLOON;
			switch (param6)
			{
			case "up": 
				_loc9_ = new block_dark_point_up_png();
				_loc10_ = _loc9_.height;
				_loc8_ = new Bitmap(new BitmapData(param1, param2 + _loc9_.height, true, 860986));
				_loc7_.renderOn(_loc8_, new Rectangle(0, _loc10_, param1, param2));
				_loc8_.bitmapData.copyPixels(_loc9_.bitmapData, _loc9_.bitmapData.rect, new Point(param3, 0));
				break;
			case "down": 
				_loc9_ = new block_dark_point_down_png();
				_loc10_ = _loc9_.height;
				_loc8_ = new Bitmap(new BitmapData(param1, param2 + _loc9_.height, true, 860986));
				_loc7_.renderOn(_loc8_, new Rectangle(0, _loc10_, param1, param2));
				_loc8_.bitmapData.copyPixels(_loc9_.bitmapData, _loc9_.bitmapData.rect, new Point(param3, param2 + _loc10_));
				break;
			case "left": 
				_loc9_ = new block_dark_point_left_png();
				_loc11_ = _loc9_.width;
				_loc8_ = new Bitmap(new BitmapData(param1 + _loc11_, param2, true, 16777215));
				_loc7_.renderOn(_loc8_, new Rectangle(_loc11_, 0, param1, param2));
				_loc8_.bitmapData.copyPixels(_loc9_.bitmapData, _loc9_.bitmapData.rect, new Point(0, param3 - _loc11_));
				break;
			case "right": 
				_loc9_ = new block_dark_point_right_png();
				_loc11_ = _loc9_.width;
				_loc8_ = new Bitmap(new BitmapData(param1 + _loc11_, param2, true, 860986));
				_loc7_.renderOn(_loc8_, new Rectangle(0, 0, param1, param2));
				_loc8_.bitmapData.copyPixels(_loc9_.bitmapData, _loc9_.bitmapData.rect, new Point(param1, param3 - _loc11_));
				break;
			case "none": 
				_loc8_ = new Bitmap(new BitmapData(param1, param2, true, 860986));
				_loc7_.renderOn(_loc8_, new Rectangle(0, 0, param1, param2));
			}
			_loc8_.bitmapData.colorTransform(_loc8_.bitmapData.rect, new ColorTransform((param5 >> 16 & 0xFF) / 255, (param5 >> 8 & 0xFF) / 255, (param5 & 0xFF) / 255));
			return _loc8_;
		}
		
		public static function createScale9GridShapeFromImage(param1:BitmapData, param2:Rectangle):Shape
		{
			var _loc8_:int = 0;
			var _loc6_:Number = NaN;
			var _loc9_:int = 0;
			var _loc3_:Array = [param2.left - 0.001, param2.right + 0.001, param1.width];
			var _loc4_:Array = [param2.top - 0.001, param2.bottom + 0.001, param1.height];
			var _loc5_:Shape = new Shape();
			var _loc7_:Number = 0;
			_loc8_ = 0;
			while (_loc8_ < 3)
			{
				_loc6_ = 0;
				_loc9_ = 0;
				while (_loc9_ < 3)
				{
					_loc5_.graphics.beginBitmapFill(param1);
					_loc5_.graphics.drawRect(_loc7_, _loc6_, _loc3_[_loc8_] - _loc7_, _loc4_[_loc9_] - _loc6_);
					_loc5_.graphics.endFill();
					_loc6_ = Number(_loc4_[_loc9_]);
					_loc9_++;
				}
				_loc7_ = Number(_loc3_[_loc8_]);
				_loc8_++;
			}
			_loc5_.scale9Grid = param2;
			return _loc5_;
		}
	
	}

}