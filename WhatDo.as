package 
{
	import org.flixel.*;
	import MenuState;
	[SWF(width="1280", height="720", backgroundColor="#000000")] //Set the size and color of the Flash file
	
	public class WhatDo extends FlxGame
	{
		public static var levels:Array;
		public static var texts:Array;
		public static var levelIDX:int;
		
		
		public function WhatDo()
		{
			super(1280/2, 720/2, MenuState, 2); 
			levelIDX = -1;
			levels = new Array(
							   Level1,
							   Level2,
							   Level3,
							   Level);
							   
			texts = new Array("We got fused together...\nWhat do we do now?",
							  "We take the friendly man's advice, and move on...",
							  "We need more gems. It is the only way.",
							  "Come on Edgar you lovable scamp.\n Let us out of your hellhole dimension!\n We miss our families..");
							   
		}
		
		public static function goToFirstLevel():void
		{
			levelIDX = -1;
			nextLevel();
		}
		
		public static function nextLevel():void
		{
			levelIDX = Math.min(levelIDX + 1, levels.length - 1);
			var state:TransitionState = new TransitionState();
			state.createText(texts[levelIDX]);
			state.nextState = levels[levelIDX];
			FlxG.switchState(state);
		}
		
	}
}