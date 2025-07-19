package com.sulake.habbo.login
{
	import com.sulake.core.runtime._02o;
	import com.sulake.habbo.onBoardingHcUi.Button;
	import com.sulake.habbo.onBoardingHcUi.ColouredButton;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.sulake.habbo.onBoardingHcUi.LoaderUI;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class EnvironmentView extends Sprite implements _02o
	{
		[Embed(source = "/assets/flag_icons_de.png")]
		private static const flag_icon_de_png:Class;
		[Embed(source = "/assets/flag_icons_dev.png")]
		private static const flag_icon_dev_png:Class;
		[Embed(source = "/assets/flag_icons_en.png")]
		private static const flag_icon_en_png:Class;
		[Embed(source = "/assets/flag_icons_es.png")]
		private static const flag_icon_es_png:Class;
		[Embed(source = "/assets/flag_icons_fi.png")]
		private static const flag_icon_fi_png:Class;
		[Embed(source = "/assets/flag_icons_fr.png")]
		private static const flag_icon_fr_png:Class;
		[Embed(source = "/assets/flag_icons_it.png")]
		private static const flag_icon_it_png:Class;
		[Embed(source = "/assets/flag_icons_nl.png")]
		private static const flag_icon_nl_png:Class;
		[Embed(source = "/assets/flag_icons_pt.png")]
		private static const flag_icon_pt_png:Class;
		[Embed(source = "/assets/flag_icons_tr.png")]
		private static const flag_icon_tr_png:Class;
		[Embed(source = "/assets/flags_icon_selected.png")]
		private static const flag_icon_selected_png:Class;
		
		private var _E0:Vector.<Bitmap>;
		private var _I1e:Boolean;
		private var _24:Array;
		private var _context:LoginFlow;
		private var _22B:TextField;
		private var _Y16:int = 0;
		private var _TQ:Bitmap;
		private var _j1f:Sprite;
		private var _environmentName:TextField;
		private var _aN:Button;
		private var _7Z:Button;
		private var _32s:Bitmap;
		private var _environmentImageContainers:Array = [];
		
		public function EnvironmentView(param1:LoginFlow)
		{
			super();
			_context = param1;
			addEventListener("addedToStage", onAddedToStage);
		}
		
		private function onAddedToStage(param1:Event):void
		{
			var _loc2_:Timer = new Timer(20, 1);
			_loc2_.addEventListener("timerComplete", onAlignElements);
			_loc2_.start();
		}
		
		private function onAlignElements(param1:TimerEvent = null):void
		{
			LoaderUI.alignAnchors(this, 0, "c", _TQ);
			if (_7Z)
			{
				LoaderUI.alignAnchors(_TQ, 0, "r", _7Z);
				LoaderUI.lineUpHorizontallyRevers(_7Z, 20, _aN);
			}
			else
			{
				LoaderUI.alignAnchors(_TQ, 0, "r", _aN);
			}
		}
		
		public function dispose():void
		{
			if (disposed)
			{
				return;
			}
			if (_7Z)
			{
				//_7Z.dispose();
			}
			//_aN.dispose();
			for each (var _loc1_: Bitmap in _E0)
			{
			}
			_E0 = null;
			_context = null;
		}
		
		public function get disposed():Boolean
		{
			return _context == null;
		}
		
		public function init():void
		{
			if (_I1e)
			{
				return;
			}
			_I1e = true;
			_E0 = new Vector.<Bitmap>();
			if (_24 == null)
			{
				initEnvironmentImages();
			}
			updateEnvironment();
			initView();
		}
		
		public function initView():void
		{
			var _loc7_:int = 0;
			var _loc8_:Sprite = null;
			var _loc10_:Bitmap = null;
			var _loc3_:int = 0;
			var _loc2_:int = 0;
			var _loc6_:int = 0;
			var _loc9_:int = 0;
			var _loc4_:int = 0;
			var _loc5_:int = 0;
			addTitleField();
			_TQ = LoaderUI.createBalloon(640, 100, 0, false, 995918, "none");
			_TQ.visible = false;
			addChild(_TQ);
			_j1f = new Sprite();
			addChild(_j1f);
			_32s = Bitmap(new flag_icon_selected_png());
			_j1f.addChild(_32s);
			_j1f.scaleX = _j1f.scaleY = 0.5;
			var _loc1_:int = 100;
			_loc7_ = 0;
			while (_loc7_ < _E0.length)
			{
				_loc8_ = new Sprite();
				_loc10_ = _E0[_loc7_] as Bitmap;
				if (_loc10_ != null)
				{
					_loc8_.addChild(_loc10_);
				}
				addChild(_loc8_);
				_environmentImageContainers.push(_loc8_);
				_loc8_.name = String(_loc7_);
				_loc8_.addEventListener("click", onEnvironmentClick);
				_loc8_.scaleX = _loc8_.scaleY = 0.5;
				_loc3_ = 80;
				_loc2_ = 5;
				_loc6_ = _loc7_ % 9;
				_loc9_ = _loc7_ / 9;
				_loc4_ = _loc6_ * _loc3_ + _loc6_ * _loc2_;
				_loc5_ = _loc9_ * _loc3_ + _loc9_ * _loc2_;
				_loc8_.x = _loc4_;
				_loc8_.y = _loc1_ + _loc5_;
				_loc7_++;
			}
			_environmentName = LoaderUI.createTextField("Title", 20, 16777215, false, true, false, false);
			_environmentName.width = 260;
			_environmentName.y = 300;
			addChild(_environmentName);
			_aN = new ColouredButton("gfreen", "${connection.login.useTicket}", new Rectangle(0, 300, 0, 40), true, onButtonSelectToken);
			addChild(_aN);
			chooseEnvironment();
		}
		
		private function onEnvironmentClick(param1:Event):void
		{
			_Y16 = int(param1.currentTarget.name);
			chooseEnvironment();
			_context.updateEnvironment(_24[_Y16], true);
			onAlignElements();
		}
		
		private function onButtonSelectToken(param1:DisplayObject):void
		{
			_context.updateEnvironment(_24[_Y16], false);
			_context.showScreen(4);
		}
		
		private function addTitleField():void
		{
			if (!_22B)
			{
				_22B = LoaderUI.createTextField("${connection.login.environment.choose}", 40, 16777215, false, true, false, false, "left");
				_22B.x = 0;
				_22B.y = 0;
				_22B.width = 500;
				_22B.multiline = false;
				_22B.thickness = 50;
				addChild(_22B);
			}
		}
		
		public function updateEnvironment():void
		{
			var _loc1_:String = _context.getProperty("environment.id");
			var _loc2_:int = int(_24.indexOf(_loc1_));
			if (_loc2_ == -1)
			{
				//_Lu.log("Missing environment, require hotel selection! " + _loc1_);
				_Y16 = 0;
			}
			else
			{
				_Y16 = _loc2_;
			}
			chooseEnvironment();
		}
		
		private function chooseEnvironment():void
		{
			var _loc1_:Sprite = _environmentImageContainers[_Y16];
			if (_loc1_ == null)
			{
				return;
			}
			_j1f.x = _loc1_.x - (_j1f.width - _loc1_.width) / 2 - 1;
			_j1f.y = _loc1_.y - (_j1f.height - _loc1_.height) / 2 - 1;
			_j1f.visible = true;
			if (_7Z)
			{
				_7Z.active = true;
			}
			updateDescription();
		}
		
		private function updateDescription():void
		{
			var _loc1_:String = _24[_Y16];
			_environmentName.text = _context.getProperty("connection.info.name." + _loc1_);
		}
		
		private function initEnvironmentImages():void
		{
			_24 = _context.getProperty("live.environment.list").split("/");
			_E0.push(Bitmap(new flag_icon_en_png()));
			_E0.push(Bitmap(new flag_icon_pt_png()));
			_E0.push(Bitmap(new flag_icon_de_png()));
			_E0.push(Bitmap(new flag_icon_es_png()));
			_E0.push(Bitmap(new flag_icon_fi_png()));
			_E0.push(Bitmap(new flag_icon_fr_png()));
			_E0.push(Bitmap(new flag_icon_it_png()));
			_E0.push(Bitmap(new flag_icon_nl_png()));
			_E0.push(Bitmap(new flag_icon_tr_png()));
			_E0.push(Bitmap(new flag_icon_dev_png()));
		}
	
	}

}