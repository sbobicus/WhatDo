package 
{
	import org.flixel.*;
	import MenuState;
	[SWF(width="2048", height="1080", backgroundColor="#000000")] //Set the size and color of the Flash file
	
	public class WhatDo extends FlxGame
	{
		public static var levels:Array;
		public static var levelIDX:int;
		
		
		public function WhatDo()
		{
			super(600, 512, MenuState, 2); 
			levelIDX = -1;
			levels = new Array(Level,
							   Level,
							   Level);
		}
		
		public static function goToFirstLevel():void
		{
			levelIDX = -1;
			nextLevel();
		}
		
		public static function nextLevel():void
		{
			levelIDX = Math.min(levelIDX + 1, levels.length - 1);
			
			FlxG.switchState(new levels[levelIDX]);
		}
		
	}
}