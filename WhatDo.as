package 
{
	import org.flixel.*;
	import MenuState;
	[SWF(width="1280", height="720", backgroundColor="#000000")] //Set the size and color of the Flash file
	
	public class WhatDo extends FlxGame
	{
		public static var levels:Array;
		public static var levelIDX:int;
		
		
		public function WhatDo()
		{
			super(1280/2, 720/2, MenuState, 2); 
			levelIDX = -1;
			levels = new Array(
							   Level1,
							   Level2,
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