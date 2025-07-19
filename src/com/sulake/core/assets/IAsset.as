package com.sulake.core.assets
{
	import com.sulake.core.runtime._02o;
	
	/**
	 * ...
	 * @author Richard
	 */
	public interface IAsset extends _02o
	{
		//function get url():String;
		//
		function get content():Object;
		//
		//function get declaration():AssetTypeDeclaration;
		//
		function setUnknownContent(param1:Object):void;
		//
		//function setFromOtherAsset(param1:IAsset):void;
		//
		function setParamsDesc(param1:XMLList):void;
	}

}