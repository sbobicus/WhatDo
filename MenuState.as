package
{
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.playMusic(GameAssets.Music);	
			var title:FlxText;
			title = new FlxText(0, 16, FlxG.width, "What Do");
			title.setFormat (null, 16, 0xFFFFFFFF, "center");
			add(title);
			
			var instructions:FlxText;
			instructions = new FlxText(0, FlxG.height - 32, FlxG.width, "Press Space To Play");
			instructions.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(instructions);
 
		}
 
 
		override public function update():void
		{
			super.update(); 
 
			if (FlxG.keys.justPressed("SPACE"))
			{
				WhatDo.goToFirstLevel();
			}
 
		} 
 
	} 
}
 