package com.sulake.core.runtime
{
	
	/**
	 * ...
	 * @author Richard
	 */
	public interface IUnknown extends class_13
	{
		function queueInterface(param1:IID, param2:Function = null):IUnknown;
		function release(param1:IID):uint;
	}

}