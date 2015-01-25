package 
{
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author mklingen
	 */
	public class Skyscraper2 extends Level 
	{
		public var text:FlxText;
		
		public function Skyscraper2() 
		{
			super();
			
		}
		
		override public function loadMap():void 
		{
			map = new Map(new LevelData(GameAssets.Skyscraper2Tiles, LevelData.TYPE_CSV), new LevelData(GameAssets.Skyscraper2Objects, LevelData.TYPE_CSV));
			map.loadLevel();
		}
		
		override public function update():void
		{
			/*
			if (text == null)
			{
				text = new FlxText(map.getBounds().width / 2 - 55, map.getBounds().height / 2 + 75, 312, "In a tutorial? We can help!\n Get the gem, go to the door!");
				add(text);	
			}
			*/
			super.update();
		}
	}
	
}