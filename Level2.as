package 
{
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author mklingen
	 */
	public class Level2 extends Level 
	{

		public var text:FlxText;
		
		public function Level2() 
		{
			super();
		}
		
		override public function loadMap():void 
		{
			map = new Map(new LevelData(GameAssets.Level2Tiles, LevelData.TYPE_CSV), new LevelData(GameAssets.Level2Objects, LevelData.TYPE_CSV));
			map.loadLevel();
		}
		
		override public function update():void
		{
			if (text == null)
			{
				text = new FlxText(map.getBounds().width / 2 - 55, map.getBounds().height / 2 + 75, 312, "Welcome to Roboburgh!");
				add(text);	
			}
			super.update();
		}
		
	}

}