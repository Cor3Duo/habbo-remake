package com.sulake.core.assets
{
	import com.sulake.core.runtime.class_13;
	import flash.net.URLRequest;
	import com.sulake.core.utils.class_39;

	public interface class_21 extends class_13
	{

		function get url():String;

		function get name():String;

		function get isReady():Boolean;

		function get numAssets():uint;

		function get manifest():XML;

		function get nameArray():Array;

		function loadFromFile(param1:class_39, param2:Boolean = true):void;

		function loadFromResource(manifest:XML, resource:Class):Boolean;

		function unload():void;

		function loadAssetFromFile(assetName:String, url:URLRequest, mimeType:String = null, id:int = -1):AssetLoaderStruct;

		function getAssetByName(name:String):IAsset;

		function getAssetByContent(content:Object):IAsset;

		function getAssetByIndex(index:uint):IAsset;

		function getAssetIndex(asset:IAsset):int;

		function hasAsset(name:String):Boolean;

		function setAsset(name:String, asset:IAsset, replace:Boolean = true):Boolean;

		function createAsset(name:String, param2:AssetTypeDeclaration):IAsset;

		function removeAsset(asset:IAsset):IAsset;

		function registerAssetTypeDeclaration(declaration:AssetTypeDeclaration, param2:Boolean = true):Boolean;

		function getAssetTypeDeclarationByMimeType(mimeType:String, param2:Boolean = true):AssetTypeDeclaration;

		function getAssetTypeDeclarationByClass(assetClass:Class, param2:Boolean = true):AssetTypeDeclaration;

		function getAssetTypeDeclarationByFileName(fileName:String, param2:Boolean = true):AssetTypeDeclaration;
	}
}
