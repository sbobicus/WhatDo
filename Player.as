package  
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		public var index:int;
		public var flames:Flames;
		
		public static var buttons:Array;
		
		public static const KEY_UP:int = 0;
		public static const KEY_LEFT:int = 1;
		public static const KEY_DOWN:int = 2;
		public static const KEY_RIGHT:int = 3;
		public static const KEY_JUMP:int = 4;
		
		
		public function Player(myIndex:int, x:Number, y:Number, graphic:Class) 
		{
			super(x, y, null);
			index = myIndex;
			loadGraphic(graphic, true, true, 32, 40, false);
			
			addAnimation("idle", [0], 1, true);
			addAnimation("run", [4, 5, 6, 7], 1.0 / 0.08, true);
			addAnimation("jump", [8, 9], 1.0 / 0.05, true);
			addAnimation("fall", [12, 13], 1.0 / 0.05, true);
			
			width = 16;
			height = 24;
			offset.x = 8;
			offset.y = 16;
			
			flames = new Flames(0, 0, null);
			flames.makeGraphic(32, 15, 0xffff1111);
			flames.exists = false;
		}
		
		
		
		
		public function flameOn(tiles:Map) : void
		{
			flames.exists = true;
			flames.timer = 0;
			var tileX:int = x / tiles.tileWidth;
			for (var dy:Number = y; dy < FlxG.height; dy += tiles.tileHeight)
			{
				var tileY:int = dy / tiles.tileHeight;
				var tile:uint = tiles.getTile(tileX, tileY);
				
				if (tile > 0)
				{
					flames.y = dy - 8;
					flames.x = x;
					return;
				}
				
			}
			
			flames.y = FlxG.height + 32;
			
		}
		
		public function flameOff() : void
		{
			flames.exists = false;
		}
		
		
		public override function postUpdate() : void
		{
		
			super.postUpdate();
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