package com.sulake.habbo.login
{
	import com.sulake.habbo.onBoardingHcUi.Button;
	import com.sulake.habbo.onBoardingHcUi.ColouredButton;
	import com.sulake.habbo.onBoardingHcUi.InputField;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.utils.Timer;
	import com.sulake.habbo.onBoardingHcUi.LoaderUI;
	
	/**
	 * ...
	 * @author Richard
	 */
	public class SsoTokenView extends Sprite
	{
		private var _context:LoginFlow;
		private var _I1e:Boolean;
		private var _22B:TextField;
		private var _F2:InputField;
		private var _52h:ColouredButton;
		private var _71s:ColouredButton;
		private var _loginAreaWidth:int = 640;
		
		public function SsoTokenView(param1:LoginFlow)
		{
			super();
			_context = param1;
			addEventListener("addedToStage", onAddedToStage);
			init();
		}
		
		private function onAddedToStage(param1:Event):void
		{
			var _loc2_:Timer = new Timer(20, 1);
			_loc2_.addEventListener("timerComplete", onAlignElements);
			_loc2_.start();
		}
		
		private function onAlignElements(param1:TimerEvent):void
		{
			LoaderUI.alignAnchors(_F2, 0, "r", _71s);
			LoaderUI.alignAnchors(_71s, -20 - _52h.width, "l", _52h);
			//_Lu.log("(login) Buttons: " + [_71s.x,_71s.y,_52h.x,_52h.y]);
		}
		
		public function init():void
		{
			if (_I1e)
			{
				return;
			}
			_I1e = true;
			addTitleField();
			addInputFields();
			addButtons();
		}
		
		private function addTitleField():void
		{
			if (!_22B)
			{
				_22B = LoaderUI.createTextField("${connection.login.title}", 40, 16777215, false, true, false, false, "left");
				_22B.x = 0;
				_22B.y = 0;
				_22B.width = 500;
				_22B.multiline = false;
				_22B.thickness = 50;
				addChild(_22B);
			}
		}
		
		private function addInputFields():void
		{
			_F2 = new InputField(_context, _loginAreaWidth, "${connection.login.code.prompt}", "", "${connection.login.useTicket}", "", true);
			addChild(_F2);
			_F2.addEventListener("change", onInputChange);
			_F2.addEventListener("keyDown", onInputKeyboardEvent);
			_F2.x = 0;
			_F2.y = 100;
		}
		
		public function addButtons():void
		{
			_52h = new ColouredButton("red", "${generic.cancel}", new Rectangle(0, 300, 0, 40), true, onCancel, 14211288);
			addChild(_52h);
			_71s = new ColouredButton("gfreen", "${connection.login.play}", new Rectangle(0, 300, 0, 40), true, onLogin, 14211288);
			_71s.active = false;
			addChild(_71s);
		}
		
		private function onCancel(param1:Button):void
		{
			_context.showScreen(1);
		}
		
		private function onLogin(param1:Button):void
		{
			var _loc2_:Vector.<String> = new Vector.<String>();
			if (validateToken(_loc2_))
			{
				_context.initLoginWithSsoToken(_loc2_[0],_loc2_[1] + "." + _loc2_[2]);
			}
			else
			{
				_71s.active = false;
			}
		}
		
		private function onInputKeyboardEvent(param1:KeyboardEvent):void
		{
			if (param1.charCode == 13)
			{
				if (_71s && _71s.active)
				{
					onLogin(null);
				}
			}
		}
		
		private function onInputChange(param1:Event):void
		{
			var _loc2_:Vector.<String> = new Vector.<String>();
			if (validateToken(_loc2_))
			{
				_context.updateEnvironment(_loc2_[0], true);
				_71s.active = true;
			}
			else
			{
				_71s.active = false;
			}
		}
		
		private function validateToken(param1:Vector.<String>):Boolean
		{
			var _loc4_:String = _F2.text;
			if (!_loc4_)
			{
				return false;
			}
			if (_loc4_.length == 0)
			{
				return false;
			}
			var _loc3_:Array = _loc4_.split(".");
			if (_loc3_.length != 3 && _loc3_.length != 4)
			{
				return false;
			}
			var _loc2_:String = String(_loc3_[0]).replace("hh", "");
			_loc2_ = _loc2_.replace("br", "pt");
			_loc2_ = _loc2_.replace("us", "en");
			param1.push(_loc2_);
			param1.push(_loc3_[1]);
			param1.push(_loc3_[2]);
			return true;
		}
	
	}

}