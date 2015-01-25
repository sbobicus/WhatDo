package 
{
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author mklingen
	 */
	public class Level5 extends Level 
	{
		public function Level5() 
		{
			super();
		}
		
		override public function loadMap():void 
		{
			map = new Map(new LevelData(GameAssets.Level5Tiles, LevelData.TYPE_CSV), new LevelData(GameAssets.Level5Objects, LevelData.TYPE_CSV));
			map.loadLevel();
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}