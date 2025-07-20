package com.sulake.habbo.login
{
	import com.sulake.core.runtime.class_13;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class Background extends Sprite implements class_13
	{
		[Embed(source = "/assets/hitchTile.png")]
		private static const background_tiles_png:Class;
		private var _backgroundImage:BitmapData;
		private var _H2H:Boolean;
		private var _FY:Sprite;
		
		public function Background()
		{
			super();
			addEventListener("addedToStage", onAddedToStage);
			addEventListener("removedFromStage", onRemovedFromStage);
		}
		
		public function dispose():void
		{
			_H2H = true;
			while (numChildren > 0)
			{
				removeChildAt(0);
			}
		}
		
		public function get disposed():Boolean
		{
			return _H2H;
		}
		
		private function onRemovedFromStage(param1:Event):void
		{
		}
		
		protected function onAddedToStage(param1:Event):void
		{
			_FY = new Sprite();
			var _loc2_:Bitmap = new background_tiles_png();
			_backgroundImage = _loc2_.bitmapData;
			addChild(_FY);
			resize();
		}
		
		protected function stageChangeResize(param1:Event):void
		{
			resize();
		}
		
		public function resize():void
		{
			var _loc2_:String = null;
			var _loc5_:Array = null;
			var _loc3_:Array = null;
			var _loc4_:Array = null;
			var _loc1_:Matrix = null;
			var _loc6_:String = null;
			if (stage)
			{
				_loc2_ = "linear";
				_loc5_ = [809599, 801381];
				_loc3_ = [1, 1];
				_loc4_ = [127, 255];
				_loc1_ = new Matrix();
				_loc1_.createGradientBox(50, 100, 0, 0, 0);
				_loc1_.rotate(3.141592653589793 / 2);
				_loc1_.scale(stage.stageWidth / 50, stage.stageHeight / 100);
				_loc6_ = "pad";
				graphics.beginGradientFill(_loc2_, _loc5_, _loc3_, _loc4_, _loc1_, _loc6_);
				graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
					//if(_FY != null)
					//{
					//_FY.graphics.clear();
					//_FY.graphics.beginBitmapFill(_backgroundImage);
					//_FY.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
					//_FY.graphics.endFill();
					//}
			}
		}
	
	}

}