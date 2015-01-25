package 
{
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author mklingen
	 */
	public class Level4 extends Level 
	{
		public function Level4() 
		{
			super();
		}
		
		override public function loadMap():void 
		{
			map = new Map(new LevelData(GameAssets.Level4Tiles, LevelData.TYPE_CSV), new LevelData(GameAssets.Level4Objects, LevelData.TYPE_CSV));
			map.loadLevel();
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}