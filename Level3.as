package 
{
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author mklingen
	 */
	public class Level3 extends Level 
	{
		public function Level3() 
		{
			super();
		}
		
		override public function loadMap():void 
		{
			map = new Map(new LevelData(GameAssets.Level3Tiles, LevelData.TYPE_CSV), new LevelData(GameAssets.Level3Objects, LevelData.TYPE_CSV));
			map.loadLevel();
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}