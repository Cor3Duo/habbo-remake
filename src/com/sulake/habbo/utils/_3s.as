package com.sulake.habbo.utils
{
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class _3s
	{
		
		public function _3s()
		{
			super();
		}
		
		public static function rectangleTransformMatrix(param1:Rectangle, param2:Rectangle):Matrix
		{
			var _loc3_:Matrix = new Matrix();
			_loc3_.a = param2.width / param1.width;
			_loc3_.d = param2.height / param1.height;
			_loc3_.tx = param2.x - param1.x * _loc3_.a;
			_loc3_.ty = param2.y - param1.y * _loc3_.d;
			return _loc3_;
		}
	
	}

}