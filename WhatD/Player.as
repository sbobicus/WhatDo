package WhatD 
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		public var index:int;
		
		public static var buttons:Array;
		
		public static const KEY_UP:int = 0;
		public static const KEY_LEFT:int = 1;
		public static const KEY_DOWN:int = 2;
		public static const KEY_RIGHT:int = 3;
		public static const KEY_JUMP:int = 4;
		
		
		public function Player(myIndex:int, x:Number, y:Number, graphic:Class) 
		{
			super(x, y, graphic);
			index = myIndex;
		}
		
		
		public static function initButtons() : void
		{
				buttons = new Array(
									new Array("W", "A", "S", "D", "SPACE"),
									new Array("UP", "LEFT", "DOWN", "RIGHT", "SHIFT")
									);
		}
		
		public function isKeyPressed(button:int):Boolean
		{
			return FlxG.keys[buttons[index][button]];
		}
		
		public function keyJustPressed(button:int):Boolean
		{
			return FlxG.keys.justPressed(buttons[index][button]);
		}
	}

}