package 
{
	import org.flixel.*;
	import org.flixel.FlxGame; //Allows you to refer to flixel objects in your code
	import PlayState;
	import Level;
	import MenuState;
	[SWF(width="640", height="480", backgroundColor="#000000")] //Set the size and color of the Flash file
	
	public class WhatDo extends FlxGame
	{
		public static var levels:Array;
		public static var levelIDX:int;
		
		
		public function WhatDo()
		{
			super(320, 240, MenuState, 2); 
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